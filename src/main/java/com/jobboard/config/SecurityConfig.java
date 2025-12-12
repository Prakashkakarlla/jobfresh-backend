package com.jobboard.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Security configuration
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // Disable CSRF for REST API
                .cors(cors -> cors.disable()) // Using global CORS config
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/auth/**").permitAll() // Auth endpoints are public
                        .requestMatchers("/api/admin/**").permitAll() // Admin endpoints (TODO: Add JWT filter)
                        .requestMatchers("/api/jobs/**").permitAll() // Public job endpoints
                        .requestMatchers("/api/companies/**").permitAll() // Public company endpoints
                        .requestMatchers("/api/categories/**").permitAll() // Public categories
                        .requestMatchers("/api/blogs/**").permitAll() // Public blog endpoints
                        .requestMatchers("/api/blog-categories/**").permitAll() // Public blog categories
                        .anyRequest().authenticated() // All other requests need auth
                );

        return http.build();
    }
}
