package com.jobboard.controller;

import com.jobboard.dto.request.LoginRequestDto;
import com.jobboard.dto.request.OtpRequestDto;
import com.jobboard.dto.request.OtpVerifyDto;
import com.jobboard.dto.response.AuthResponseDto;
import com.jobboard.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Authentication controller
 */
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Slf4j
public class AuthController {

    private final AuthService authService;

    /**
     * Request OTP for email
     */
    @PostMapping("/request-otp")
    public ResponseEntity<Map<String, String>> requestOtp(@Valid @RequestBody OtpRequestDto request) {
        log.info("OTP requested for: {}", request.getEmail());

        try {
            authService.requestOtp(request);

            Map<String, String> response = new HashMap<>();
            response.put("message", "OTP sent to your email");

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Error requesting OTP: {}", e.getMessage());

            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
        }
    }

    /**
     * Verify OTP and login
     */
    @PostMapping("/verify-otp")
    public ResponseEntity<?> verifyOtp(@Valid @RequestBody OtpVerifyDto request) {
        log.info("OTP verification for: {}", request.getEmail());

        try {
            AuthResponseDto response = authService.verifyOtp(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Error verifying OTP: {}", e.getMessage());

            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
        }
    }

    /**
     * Login with email and password
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequestDto request) {
        log.info("Login attempt for: {}", request.getEmail());

        try {
            AuthResponseDto response = authService.login(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Login failed: {}", e.getMessage());

            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
        }
    }
}
