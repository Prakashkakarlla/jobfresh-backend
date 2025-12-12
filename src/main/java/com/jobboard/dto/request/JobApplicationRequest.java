package com.jobboard.dto.request;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Request DTO for job application submissions
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobApplicationRequest {

    @NotBlank(message = "Applicant name is required")
    @Size(min = 2, max = 255, message = "Name must be between 2 and 255 characters")
    private String applicantName;

    @NotBlank(message = "Applicant email is required")
    @Email(message = "Email must be valid")
    @Size(max = 255, message = "Email must not exceed 255 characters")
    private String applicantEmail;

    @Pattern(regexp = "^[0-9]{10}$", message = "Phone number must be 10 digits")
    private String applicantPhone;

    @Size(max = 1000, message = "Resume URL must not exceed 1000 characters")
    private String resumeUrl;

    @Size(max = 5000, message = "Message must not exceed 5000 characters")
    private String message;
}
