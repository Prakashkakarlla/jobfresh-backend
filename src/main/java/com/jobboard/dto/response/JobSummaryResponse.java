package com.jobboard.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response DTO for job listing/summary view
 * Contains minimal fields for performance in list views
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JobSummaryResponse {

    private Long id;
    private String title;
    private String slug;
    private String companyName;
    private String companySlug;
    private String categoryName;
    private String categorySlug;
    private String location;
    private Boolean remote;
    private String roleSummary;
    private String jobType;
    private String status;
    private String postedAt; // Formatted date string
}
