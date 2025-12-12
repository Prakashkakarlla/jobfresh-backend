package com.jobboard.entity;

import com.jobboard.entity.embeddable.*;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "job_postings", indexes = {
        @Index(name = "idx_job_slug", columnList = "slug", unique = true),
        @Index(name = "idx_job_status", columnList = "status"),
        @Index(name = "idx_job_category", columnList = "category_id"),
        @Index(name = "idx_job_company", columnList = "company_id"),
        @Index(name = "idx_job_posted_at", columnList = "posted_at")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobPosting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 500)
    private String title;

    @Column(nullable = false, unique = true, length = 500)
    private String slug;

    @Column(length = 255)
    private String location;

    @Column(nullable = false)
    private Boolean remote = false;

    @Column(name = "job_type", length = 50)
    private String jobType; // e.g., "Full-time", "Part-time", "Contract"

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private JobStatus status = JobStatus.DRAFT;

    @Column(name = "application_link", length = 1000)
    private String applicationLink;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false)
    private JobCategory category;

    // Content Fields
    @Column(name = "role_summary", columnDefinition = "TEXT")
    private String roleSummary;

    @Column(columnDefinition = "TEXT")
    private String responsibilities;

    @Column(name = "must_have_skills", columnDefinition = "TEXT")
    private String mustHaveSkills;

    @Column(name = "nice_to_have_skills", columnDefinition = "TEXT")
    private String niceToHaveSkills;

    @Column(name = "tools_and_technologies", columnDefinition = "TEXT")
    private String toolsAndTechnologies;

    @Column(columnDefinition = "TEXT")
    private String faqs;

    // New Comprehensive Fields for Campus/Fresher Hiring
    @Column(name = "eligible_batch", length = 100)
    private String eligibleBatch; // e.g., "2024/2025"

    @Column(length = 500)
    private String qualification; // e.g., "B.E/B.Tech/MCA/M.Sc in CS/IT"

    @Column(name = "experience_level", length = 100)
    private String experienceLevel; // e.g., "Freshers", "0-2 years"

    @Column(name = "last_date_to_apply")
    private LocalDate lastDateToApply;

    @Column(name = "eligibility_criteria", columnDefinition = "TEXT")
    private String eligibilityCriteria; // Newline-separated list

    @Column(name = "interview_tips", columnDefinition = "TEXT")
    private String interviewTips; // Newline-separated tips

    @Column(name = "selection_process", columnDefinition = "TEXT")
    private String selectionProcess; // Newline-separated stages

    @Column(name = "career_growth_info", columnDefinition = "TEXT")
    private String careerGrowthInfo; // Career progression description

    @Column(name = "future_roles", columnDefinition = "TEXT")
    private String futureRoles; // Comma-separated future role titles

    // Embedded Value Objects
    @Embedded
    private CompensationDetails compensation;

    @Embedded
    private WorkArrangementDetails workArrangement;

    @Embedded
    private HiringWorkflowDetails hiringWorkflow;

    @Embedded
    private RoleContextDetails roleContext;

    @Embedded
    private LegalAndPolicyDetails legalAndPolicy;

    // SEO
    @Column(name = "seo_title", length = 255)
    private String seoTitle;

    @Column(name = "seo_description", length = 500)
    private String seoDescription;

    // Timestamps
    @Column(name = "posted_at")
    private LocalDateTime postedAt;

    @Column(name = "expires_at")
    private LocalDateTime expiresAt;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(nullable = false)
    private Boolean deleted = false;

    // Enum for Job Status
    public enum JobStatus {
        DRAFT, PUBLISHED, EXPIRED, CLOSED
    }
}
