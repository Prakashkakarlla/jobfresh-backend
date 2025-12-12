package com.jobboard.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * Service for sending emails asynchronously
 * Uses @Async to prevent blocking API requests
 * All mail operations execute in separate thread pool (mailExecutor)
 */
@Service
@Slf4j
public class MailService {

    private final JavaMailSender mailSender;
    private final String adminEmail;

    public MailService(
            JavaMailSender mailSender,
            @Value("${mail.admin.email}") String adminEmail) {
        this.mailSender = mailSender;
        this.adminEmail = adminEmail;
    }

    /**
     * Send simple text email asynchronously
     * Logs errors but doesn't throw to prevent API failure
     */
    @Async("mailExecutor")
    public void sendSimpleMail(String to, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);
            message.setFrom(adminEmail);

            mailSender.send(message);
            log.info("Email sent successfully to: {}", to);
        } catch (MailException e) {
            log.error("Failed to send email to: {}. Error: {}", to, e.getMessage());
            // Don't throw - log only, as this is async operation
        }
    }

    /**
     * Send contact form message to admin
     * Executes asynchronously to not block API response
     */
    @Async("mailExecutor")
    public void sendContactMessageToAdmin(String name, String email, String subject, String message) {
        String emailBody = String.format(
                "Contact Form Submission\n\n" +
                        "Name: %s\n" +
                        "Email: %s\n" +
                        "Subject: %s\n\n" +
                        "Message:\n%s\n\n" +
                        "---\n" +
                        "This email was sent from the Job Board contact form.",
                name, email, subject, message);

        sendSimpleMail(adminEmail, "[Job Board] Contact Form: " + subject, emailBody);
    }

    /**
     * Send job application notification to admin
     * Includes applicant details and resume link if provided
     */
    @Async("mailExecutor")
    public void sendJobApplicationToAdmin(
            String jobTitle,
            String jobSlug,
            String applicantName,
            String applicantEmail,
            String details) {

        String emailBody = String.format(
                "New Job Application\n\n" +
                        "Job: %s\n" +
                        "Job Slug: %s\n\n" +
                        "Applicant Details:\n" +
                        "Name: %s\n" +
                        "Email: %s\n\n" +
                        "Application Details:\n%s\n\n" +
                        "---\n" +
                        "Please review this application at your earliest convenience.",
                jobTitle, jobSlug, applicantName, applicantEmail, details);

        String subject = String.format("[Job Board] Application for %s - %s", jobTitle, applicantName);
        sendSimpleMail(adminEmail, subject, emailBody);
    }
}
