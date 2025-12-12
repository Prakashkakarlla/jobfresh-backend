package com.jobboard.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * Response DTO for job detail view
 * Contains all job information including embedded details
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JobDetailResponse {

    private Long id;
    private String title;
    private String slug;
    private String location;
    private Boolean remote;
    private String jobType;
    private String status;
    private String applicationLink;

    // Company info
    private Map<String, Object> company; // {id, name, slug, logoUrl, about, workCulture...}

    // Category info
    private Map<String, Object> category; // {id, name, slug, introText...}

    // Content fields
    private String roleSummary;
    private String responsibilities;
    private String mustHaveSkills;
    private String niceToHaveSkills;
    private String toolsAndTechnologies;
    private String faqs;

    // Comprehensive job fields
    private String eligibleBatch;
    private String qualification;
    private String experienceLevel;
    private String lastDateToApply;
    private String eligibilityCriteria;
    private String interviewTips;
    private String selectionProcess;
    private String careerGrowthInfo;
    private String futureRoles;

    // Embedded details as maps for flexibility
    private Map<String, Object> compensation;
    private Map<String, Object> workArrangement;
    private Map<String, Object> hiringWorkflow;
    private Map<String, Object> roleContext;
    private Map<String, Object> legalAndPolicy;

    // SEO
    private String seoTitle;
    private String seoDescription;

    // Timestamps
    private String postedAt;
    private String expiresAt;
    private String createdAt;
    private String updatedAt;
}
