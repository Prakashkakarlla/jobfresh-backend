package com.jobboard.service;

import com.jobboard.config.JwtTokenProvider;
import com.jobboard.dto.request.LoginRequestDto;
import com.jobboard.dto.request.OtpRequestDto;
import com.jobboard.dto.request.OtpVerifyDto;
import com.jobboard.dto.response.AuthResponseDto;
import com.jobboard.entity.User;
import com.jobboard.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * Authentication service
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final UserRepository userRepository;
    private final OtpService otpService;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;

    /**
     * Request OTP for email
     */
    @Transactional
    public void requestOtp(OtpRequestDto request) {
        String email = request.getEmail();

        // Check if user exists
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Check if user is enabled
        if (!user.getEnabled()) {
            throw new RuntimeException("Account is disabled");
        }

        // Generate and send OTP
        otpService.generateAndSendOtp(email);

        log.info("OTP requested for: {}", email);
    }

    /**
     * Verify OTP and generate JWT token
     */
    @Transactional
    public AuthResponseDto verifyOtp(OtpVerifyDto request) {
        String email = request.getEmail();
        String otp = request.getOtp();

        // Verify OTP
        boolean isValid = otpService.verifyOtp(email, otp);
        if (!isValid) {
            throw new RuntimeException("Invalid or expired OTP");
        }

        // Find user
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Update last login
        user.setLastLogin(LocalDateTime.now());
        userRepository.save(user);

        // Generate JWT token
        String token = jwtTokenProvider.generateToken(
                user.getEmail(),
                user.getRole().name(),
                user.getId());

        log.info("User logged in via OTP: {}", email);

        return AuthResponseDto.builder()
                .token(token)
                .email(user.getEmail())
                .fullName(user.getFullName())
                .role(user.getRole().name())
                .userId(user.getId())
                .build();
    }

    /**
     * Login with email and password
     */
    @Transactional
    public AuthResponseDto login(LoginRequestDto request) {
        String email = request.getEmail();
        String password = request.getPassword();

        // Find user
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Invalid email or password"));

        // Check if user is enabled
        if (!user.getEnabled()) {
            throw new RuntimeException("Account is disabled");
        }

        // Check if user has password (not super admin)
        if (user.getPassword() == null) {
            throw new RuntimeException("Please use OTP login");
        }

        // Verify password
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid email or password");
        }

        // Update last login
        user.setLastLogin(LocalDateTime.now());
        userRepository.save(user);

        // Generate JWT token
        String token = jwtTokenProvider.generateToken(
                user.getEmail(),
                user.getRole().name(),
                user.getId());

        log.info("User logged in with password: {}", email);

        return AuthResponseDto.builder()
                .token(token)
                .email(user.getEmail())
                .fullName(user.getFullName())
                .role(user.getRole().name())
                .userId(user.getId())
                .build();
    }
}
