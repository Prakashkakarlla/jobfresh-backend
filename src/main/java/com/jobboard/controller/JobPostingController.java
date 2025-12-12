package com.jobboard.controller;

import com.jobboard.dto.request.JobApplicationRequest;
import com.jobboard.dto.request.JobCreateUpdateRequest;
import com.jobboard.dto.response.JobDetailResponse;
import com.jobboard.dto.response.JobSummaryResponse;
import com.jobboard.service.JobPostingService;
import com.jobboard.service.MailService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * REST controller for job posting operations
 * 
 * Endpoints:
 * POST /api/jobs - Create job
 * GET /api/jobs - List jobs (with optional category filter)
 * GET /api/jobs/{slug} - Get job detail
 * PUT /api/jobs/{slug} - Update job
 * DELETE /api/jobs/{slug} - Delete job
 * POST /api/jobs/{slug}/apply - Submit application
 */
@RestController
@RequestMapping("/api/jobs")
@RequiredArgsConstructor
@Slf4j
public class JobPostingController {

    private final JobPostingService jobService;
    private final MailService mailService;

    /**
     * Create new job posting
     * 
     * @param request Job creation payload
     * @return Created job details (201 CREATED)
     */
    @PostMapping
    public ResponseEntity<JobDetailResponse> createJob(@Valid @RequestBody JobCreateUpdateRequest request) {
        log.info("POST /api/jobs - Creating job: {}", request.getTitle());
        JobDetailResponse response = jobService.createJob(request);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    /**
     * List published jobs with pagination
     * Optional category filter via query parameter
     * 
     * @param categorySlug Optional category filter
     * @param pageable     Pagination parameters (default: page=0, size=20)
     * @return Page of job summaries (200 OK)
     */
    @GetMapping
    public ResponseEntity<Page<JobSummaryResponse>> listJobs(
            @RequestParam(required = false) String categorySlug,
            @PageableDefault(size = 20) Pageable pageable) {

        log.debug("GET /api/jobs - category: {}, page: {}", categorySlug, pageable.getPageNumber());
        Page<JobSummaryResponse> jobs = jobService.listPublishedJobs(categorySlug, pageable);
        return ResponseEntity.ok(jobs);
    }

    /**
     * Get job detail by slug
     * 
     * @param slug Job slug
     * @return Job detail (200 OK)
     */
    @GetMapping("/{slug}")
    public ResponseEntity<JobDetailResponse> getJob(@PathVariable String slug) {
        log.debug("GET /api/jobs/{} - Fetching job detail", slug);
        JobDetailResponse job = jobService.getJobBySlug(slug);
        return ResponseEntity.ok(job);
    }

    /**
     * Update existing job
     * 
     * @param slug    Job slug
     * @param request Updated job payload
     * @return Updated job details (200 OK)
     */
    @PutMapping("/{slug}")
    public ResponseEntity<JobDetailResponse> updateJob(
            @PathVariable String slug,
            @Valid @RequestBody JobCreateUpdateRequest request) {

        log.info("PUT /api/jobs/{} - Updating job", slug);
        JobDetailResponse updated = jobService.updateJob(slug, request);
        return ResponseEntity.ok(updated);
    }

    /**
     * Delete job (soft delete)
     * 
     * @param slug Job slug
     * @return No content (204 NO CONTENT)
     */
    @DeleteMapping("/{slug}")
    public ResponseEntity<Void> deleteJob(@PathVariable String slug) {
        log.info("DELETE /api/jobs/{} - Deleting job", slug);
        jobService.deleteJob(slug);
        return ResponseEntity.noContent().build();
    }

    /**
     * Submit job application
     * Sends email to admin with applicant details
     * 
     * @param slug    Job slug
     * @param request Application payload
     * @return Success message (200 OK)
     */
    @PostMapping("/{slug}/apply")
    public ResponseEntity<String> applyForJob(
            @PathVariable String slug,
            @Valid @RequestBody JobApplicationRequest request) {

        log.info("POST /api/jobs/{}/apply - Application from: {}", slug, request.getApplicantEmail());

        // Get job details for email
        JobDetailResponse job = jobService.getJobBySlug(slug);

        // Build application details
        StringBuilder details = new StringBuilder();
        if (request.getMessage() != null && !request.getMessage().isEmpty()) {
            details.append("Message: ").append(request.getMessage()).append("\n\n");
        }
        if (request.getApplicantPhone() != null && !request.getApplicantPhone().isEmpty()) {
            details.append("Phone: ").append(request.getApplicantPhone()).append("\n");
        }
        if (request.getResumeUrl() != null && !request.getResumeUrl().isEmpty()) {
            details.append("Resume: ").append(request.getResumeUrl()).append("\n");
        }

        // Send email asynchronously
        mailService.sendJobApplicationToAdmin(
                job.getTitle(),
                job.getSlug(),
                request.getApplicantName(),
                request.getApplicantEmail(),
                details.toString());

        return ResponseEntity.ok("Application submitted successfully.");
    }
}
