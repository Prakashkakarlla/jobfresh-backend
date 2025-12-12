package com.jobboard.controller;

import com.jobboard.dto.request.ContactRequest;
import com.jobboard.service.MailService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/contact")
@RequiredArgsConstructor
@Slf4j
public class ContactController {

    private final MailService mailService;

    /**
     * Handle contact form submissions
     * Sends email to admin asynchronously
     * 
     * @param request Contact form data
     * @return Success message (200 OK)
     */
    @PostMapping
    public ResponseEntity<String> submitContactForm(@Valid @RequestBody ContactRequest request) {
        log.info("POST /api/contact - From: {}", request.getEmail());

        mailService.sendContactMessageToAdmin(
                request.getName(),
                request.getEmail(),
                request.getSubject(),
                request.getMessage());

        return ResponseEntity.ok("Your message has been sent successfully. We'll get back to you soon!");
    }
}
