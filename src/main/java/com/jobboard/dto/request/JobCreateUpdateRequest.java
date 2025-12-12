package com.jobboard.dto.request;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Request DTO for creating and updating job postings
 * Contains all job content fields with comprehensive validation
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobCreateUpdateRequest {

    @NotBlank(message = "Title is required")
    @Size(max = 500, message = "Title must not exceed 500 characters")
    private String title;

    @NotBlank(message = "Location is required")
    @Size(max = 255, message = "Location must not exceed 255 characters")
    private String location;

    @NotNull(message = "Remote flag is required")
    private Boolean remote;

    @NotBlank(message = "Job type is required")
    @Pattern(regexp = "Full-time|Part-time|Contract|Internship", message = "Invalid job type")
    private String jobType;

    @NotBlank(message = "Status is required")
    @Pattern(regexp = "DRAFT|PUBLISHED|EXPIRED|CLOSED", message = "Invalid status")
    private String status;

    @NotBlank(message = "Application link is required")
    @Size(max = 1000, message = "Application link must not exceed 1000 characters")
    private String applicationLink;

    @NotNull(message = "Company ID is required")
    private Long companyId;

    @NotNull(message = "Category ID is required")
    private Long categoryId;

    // Content fields
    @NotBlank(message = "Role summary is required")
    @Size(max = 5000, message = "Role summary must not exceed 5000 characters")
    private String roleSummary;

    @Size(max = 10000, message = "Responsibilities must not exceed 10000 characters")
    private String responsibilities;

    @Size(max = 5000, message = "Must-have skills must not exceed 5000 characters")
    private String mustHaveSkills;

    @Size(max = 5000, message = "Nice-to-have skills must not exceed 5000 characters")
    private String niceToHaveSkills;

    @Size(max = 5000, message = "Tools and technologies must not exceed 5000 characters")
    private String toolsAndTechnologies;

    @Size(max = 10000, message = "FAQs must not exceed 10000 characters")
    private String faqs;

    // New Comprehensive Fields for Campus/Fresher Hiring
    @Size(max = 100, message = "Eligible batch must not exceed 100 characters")
    private String eligibleBatch; // e.g., "2024/2025"

    @Size(max = 500, message = "Qualification must not exceed 500 characters")
    private String qualification; // e.g., "B.E/B.Tech/MCA/M.Sc in CS/IT"

    @Size(max = 100, message = "Experience level must not exceed 100 characters")
    private String experienceLevel; // e.g., "Freshers", "0-2 years"

    private LocalDate lastDateToApply; // Application deadline

    @Size(max = 5000, message = "Eligibility criteria must not exceed 5000 characters")
    private String eligibilityCriteria; // Newline-separated

    @Size(max = 5000, message = "Interview tips must not exceed 5000 characters")
    private String interviewTips; // Newline-separated

    @Size(max = 3000, message = "Selection process must not exceed 3000 characters")
    private String selectionProcess; // Newline-separated

    @Size(max = 2000, message = "Career growth info must not exceed 2000 characters")
    private String careerGrowthInfo; // Career progression description

    @Size(max = 500, message = "Future roles must not exceed 500 characters")
    private String futureRoles; // Comma-separated

    // Compensation
    @Min(value = 0, message = "Minimum salary must be non-negative")
    private Integer salaryMin;

    @Min(value = 0, message = "Maximum salary must be non-negative")
    private Integer salaryMax;

    @Size(max = 10, message = "Currency code must not exceed 10 characters")
    private String currency;

    @Size(max = 50, message = "Salary type must not exceed 50 characters")
    private String salaryType;

    @Size(max = 50, message = "Pay frequency must not exceed 50 characters")
    private String payFrequency;

    @Size(max = 1000, message = "Benefits summary must not exceed 1000 characters")
    private String benefitsSummary;

    @Size(max = 1000, message = "Additional perks must not exceed 1000 characters")
    private String additionalPerks;

    // Work Arrangement
    @Size(max = 50, message = "Work mode must not exceed 50 characters")
    private String workMode;

    @Size(max = 255, message = "Office location must not exceed 255 characters")
    private String officeLocation;

    @Size(max = 100, message = "Working hours must not exceed 100 characters")
    private String workingHours;

    @Size(max = 50, message = "Shift type must not exceed 50 characters")
    private String shiftType;

    private Boolean weekendWork;
    private Boolean travelRequired;

    @Min(value = 0, message = "Travel percentage must be between 0 and 100")
    @Max(value = 100, message = "Travel percentage must be between 0 and 100")
    private Integer travelPercentage;

    @Size(max = 1000, message = "Work environment must not exceed 1000 characters")
    private String workEnvironment;

    // Hiring Workflow
    @Min(value = 1, message = "Number of rounds must be at least 1")
    private Integer numberOfRounds;

    @Size(max = 2000, message = "Rounds description must not exceed 2000 characters")
    private String roundsDescription;

    @Min(value = 1, message = "Expected decision days must be at least 1")
    private Integer expectedDecisionDays;

    private Boolean assignmentRequired;

    @Size(max = 2000, message = "Preparation tips must not exceed 2000 characters")
    private String preparationTips;

    // Role Context
    @Size(max = 2000, message = "Team overview must not exceed 2000 characters")
    private String teamOverview;

    @Size(max = 1000, message = "Project domain must not exceed 1000 characters")
    private String projectDomain;

    @Size(max = 1000, message = "Tech stack must not exceed 1000 characters")
    private String techStack;

    @Size(max = 1000, message = "Career path must not exceed 1000 characters")
    private String careerPath;

    @Size(max = 2000, message = "Ideal candidate profile must not exceed 2000 characters")
    private String idealCandidateProfile;

    // Legal and Policy
    private Boolean backgroundCheckRequired;
    private Boolean bondApplicable;

    @Min(value = 0, message = "Bond duration must be non-negative")
    private Integer bondDuration;

    @Size(max = 500, message = "Notice period policy must not exceed 500 characters")
    private String noticePeriodPolicy;

    @Size(max = 1000, message = "Equal opportunity statement must not exceed 1000 characters")
    private String equalOpportunityStatement;

    // SEO
    @Size(max = 255, message = "SEO title must not exceed 255 characters")
    private String seoTitle;

    @Size(max = 500, message = "SEO description must not exceed 500 characters")
    private String seoDescription;

    // Optional expiry date
    private LocalDateTime expiresAt;
}
