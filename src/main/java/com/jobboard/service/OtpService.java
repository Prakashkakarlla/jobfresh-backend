package com.jobboard.service;

import com.jobboard.entity.OtpCode;
import com.jobboard.repository.OtpCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Random;

/**
 * Service for generating and validating OTP codes
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class OtpService {

    private final OtpCodeRepository otpCodeRepository;
    private final EmailService emailService;

    @Value("${otp.expiry.minutes:10}")
    private int otpExpiryMinutes;

    @Value("${otp.length:6}")
    private int otpLength;

    /**
     * Generate and send OTP to email
     */
    @Transactional
    public void generateAndSendOtp(String email) {
        // Generate random OTP
        String otpCode = generateOtpCode();

        // Create OTP entity
        OtpCode otp = new OtpCode();
        otp.setEmail(email);
        otp.setCode(otpCode);
        otp.setExpiresAt(LocalDateTime.now().plusMinutes(otpExpiryMinutes));
        otp.setUsed(false);

        // Save to database
        otpCodeRepository.save(otp);

        // Send email
        emailService.sendOtpEmail(email, otpCode);

        log.info("OTP generated and sent to: {}", email);
    }

    /**
     * Verify OTP code
     */
    @Transactional
    public boolean verifyOtp(String email, String code) {
        // Find latest unused OTP for email
        OtpCode otp = otpCodeRepository
                .findTopByEmailAndUsedFalseOrderByCreatedAtDesc(email)
                .orElse(null);

        if (otp == null) {
            log.warn("No OTP found for email: {}", email);
            return false;
        }

        // Check if OTP matches and is valid
        if (!otp.getCode().equals(code)) {
            log.warn("Invalid OTP code for email: {}", email);
            return false;
        }

        if (!otp.isValid()) {
            log.warn("Expired or used OTP for email: {}", email);
            return false;
        }

        // Mark OTP as used
        otp.setUsed(true);
        otpCodeRepository.save(otp);

        log.info("OTP verified successfully for: {}", email);
        return true;
    }

    /**
     * Generate random OTP code
     */
    private String generateOtpCode() {
        Random random = new Random();
        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < otpLength; i++) {
            otp.append(random.nextInt(10));
        }

        return otp.toString();
    }

    /**
     * Clean up expired OTPs (scheduled task)
     */
    @Transactional
    public void cleanupExpiredOtps() {
        otpCodeRepository.deleteByExpiresAtBefore(LocalDateTime.now());
        log.debug("Cleaned up expired OTPs");
    }
}
