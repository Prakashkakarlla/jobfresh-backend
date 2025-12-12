package com.jobboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * Service for sending emails
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    /**
     * Send OTP email to user
     */
    public void sendOtpEmail(String toEmail, String otpCode) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("JobFresh - Your Login OTP Code");
            message.setText(String.format(
                    "Hello,\n\n" +
                            "Your OTP code for JobFresh admin login is: %s\n\n" +
                            "This code will expire in 10 minutes.\n\n" +
                            "If you did not request this code, please ignore this email.\n\n" +
                            "Best regards,\n" +
                            "JobFresh Team",
                    otpCode));

            mailSender.send(message);
            log.info("OTP email sent to: {}", toEmail);
        } catch (Exception e) {
            log.error("Failed to send OTP email to {}: {}", toEmail, e.getMessage());
            throw new RuntimeException("Failed to send OTP email", e);
        }
    }

    /**
     * Send welcome email to new user
     */
    public void sendWelcomeEmail(String toEmail, String tempPassword) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("Welcome to JobFresh");
            message.setText(String.format(
                    "Hello,\n\n" +
                            "Your JobFresh account has been created.\n\n" +
                            "Email: %s\n" +
                            "Temporary Password: %s\n\n" +
                            "Please login and change your password.\n\n" +
                            "Best regards,\n" +
                            "JobFresh Team",
                    toEmail,
                    tempPassword));

            mailSender.send(message);
            log.info("Welcome email sent to: {}", toEmail);
        } catch (Exception e) {
            log.error("Failed to send welcome email to {}: {}", toEmail, e.getMessage());
        }
    }
}
