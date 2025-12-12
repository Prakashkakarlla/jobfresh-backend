package com.jobboard.service;

import com.jobboard.dto.request.JobCreateUpdateRequest;
import com.jobboard.dto.response.JobDetailResponse;
import com.jobboard.dto.response.JobSummaryResponse;
import com.jobboard.entity.*;
import com.jobboard.entity.embeddable.*;
import com.jobboard.exception.ResourceNotFoundException;
import com.jobboard.repository.CompanyRepository;
import com.jobboard.repository.JobCategoryRepository;
import com.jobboard.repository.JobPostingRepository;
import com.jobboard.util.SlugGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

/**
 * Service layer for JobPosting business logic
 * Implements caching strategy, entity-to-DTO mapping, and complex business
 * rules
 * 
 * Caching Strategy:
 * - jobList: List of jobs (by category + page)
 * - jobDetails: Individual job details (by slug)
 * 
 * Cache eviction on create/update/delete operations
 */
@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class JobPostingService {

    private final JobPostingRepository jobRepository;
    private final CompanyRepository companyRepository;
    private final JobCategoryRepository categoryRepository;
    private final SlugGenerator slugGenerator;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * Create new job posting
     * Generates slug, validates company and category, builds embedded details
     * Evicts caches to ensure fresh data in listings
     */
    @Transactional
    @Caching(evict = {
            @CacheEvict(value = "jobList", allEntries = true),
            @CacheEvict(value = "jobDetails", allEntries = true)
    })
    public JobDetailResponse createJob(JobCreateUpdateRequest request) {
        log.info("Creating new job: {}", request.getTitle());

        // Validate and load company
        Company company = companyRepository.findById(request.getCompanyId())
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Company not found with id: " + request.getCompanyId()));

        // Validate and load category
        JobCategory category = categoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Category not found with id: " + request.getCategoryId()));

        // Generate unique slug
        String baseSlug = slugGenerator.generateSlug(request.getTitle());
        String uniqueSlug = ensureUniqueSlug(baseSlug);

        // Build job posting entity
        JobPosting job = new JobPosting();
        job.setTitle(request.getTitle());
        job.setSlug(uniqueSlug);
        job.setLocation(request.getLocation());
        job.setRemote(request.getRemote());
        job.setJobType(request.getJobType());
        job.setStatus(JobPosting.JobStatus.valueOf(request.getStatus()));
        job.setApplicationLink(request.getApplicationLink());
        job.setCompany(company);
        job.setCategory(category);

        // Set content fields
        job.setRoleSummary(request.getRoleSummary());
        job.setResponsibilities(request.getResponsibilities());
        job.setMustHaveSkills(request.getMustHaveSkills());
        job.setNiceToHaveSkills(request.getNiceToHaveSkills());
        job.setToolsAndTechnologies(request.getToolsAndTechnologies());
        job.setFaqs(request.getFaqs());

        // Set new comprehensive fields
        job.setEligibleBatch(request.getEligibleBatch());
        job.setQualification(request.getQualification());
        job.setExperienceLevel(request.getExperienceLevel());
        job.setLastDateToApply(request.getLastDateToApply());
        job.setEligibilityCriteria(request.getEligibilityCriteria());
        job.setInterviewTips(request.getInterviewTips());
        job.setSelectionProcess(request.getSelectionProcess());
        job.setCareerGrowthInfo(request.getCareerGrowthInfo());
        job.setFutureRoles(request.getFutureRoles());

        // Build embedded details
        job.setCompensation(buildCompensationDetails(request));
        job.setWorkArrangement(buildWorkArrangementDetails(request));
        job.setHiringWorkflow(buildHiringWorkflowDetails(request));
        job.setRoleContext(buildRoleContextDetails(request));
        job.setLegalAndPolicy(buildLegalAndPolicyDetails(request));

        // SEO fields
        job.setSeoTitle(request.getSeoTitle() != null ? request.getSeoTitle() : request.getTitle());
        job.setSeoDescription(request.getSeoDescription());

        // Set postedAt if status is PUBLISHED
        if (job.getStatus() == JobPosting.JobStatus.PUBLISHED) {
            job.setPostedAt(LocalDateTime.now());
        }

        job.setExpiresAt(request.getExpiresAt());
        job.setDeleted(false);

        // Save job
        JobPosting savedJob = jobRepository.save(job);
        log.info("Job created successfully with id: {} and slug: {}", savedJob.getId(), savedJob.getSlug());

        return mapToDetailResponse(savedJob);
    }

    /**
     * List published jobs with optional category filter
     * Cached by category slug and page number for performance
     * 
     * @param categorySlug Optional category filter (null = all categories)
     * @param pageable     Pagination parameters
     * @return Page of job summaries
     */
    @Cacheable(value = "jobList", key = "#categorySlug + '_' + #pageable.pageNumber + '_' + #pageable.pageSize")
    public Page<JobSummaryResponse> listPublishedJobs(String categorySlug, Pageable pageable) {
        log.debug("Fetching jobs for category: {}, page: {}", categorySlug, pageable.getPageNumber());

        Page<JobPosting> jobPage;

        if (categorySlug != null && !categorySlug.isEmpty()) {
            // Filter by category
            jobPage = jobRepository.findByDeletedFalseAndStatusAndCategory_SlugOrderByPostedAtDesc(
                    JobPosting.JobStatus.PUBLISHED, categorySlug, pageable);
        } else {
            // All published jobs
            jobPage = jobRepository.findByDeletedFalseAndStatusOrderByPostedAtDesc(
                    JobPosting.JobStatus.PUBLISHED, pageable);
        }

        return jobPage.map(this::mapToSummaryResponse);
    }

    /**
     * Get job detail by slug
     * Cached by slug for fast repeated access
     * Only returns published, non-deleted jobs
     */
    @Cacheable(value = "jobDetails", key = "#slug")
    public JobDetailResponse getJobBySlug(String slug) {
        log.debug("Fetching job detail for slug: {}", slug);

        JobPosting job = jobRepository.findBySlugAndDeletedFalseAndStatus(
                slug, JobPosting.JobStatus.PUBLISHED)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Job not found with slug: " + slug));

        return mapToDetailResponse(job);
    }

    /**
     * Update existing job
     * Evicts caches to ensure fresh data
     */
    @Transactional
    @Caching(evict = {
            @CacheEvict(value = "jobList", allEntries = true),
            @CacheEvict(value = "jobDetails", allEntries = true)
    })
    public JobDetailResponse updateJob(String slug, JobCreateUpdateRequest request) {
        log.info("Updating job with slug: {}", slug);

        JobPosting job = jobRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Job not found with slug: " + slug));

        // Update company if changed
        if (!job.getCompany().getId().equals(request.getCompanyId())) {
            Company company = companyRepository.findById(request.getCompanyId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Company not found with id: " + request.getCompanyId()));
            job.setCompany(company);
        }

        // Update category if changed
        if (!job.getCategory().getId().equals(request.getCategoryId())) {
            JobCategory category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Category not found with id: " + request.getCategoryId()));
            job.setCategory(category);
        }

        // Update basic fields
        job.setTitle(request.getTitle());
        job.setLocation(request.getLocation());
        job.setRemote(request.getRemote());
        job.setJobType(request.getJobType());

        JobPosting.JobStatus newStatus = JobPosting.JobStatus.valueOf(request.getStatus());
        JobPosting.JobStatus oldStatus = job.getStatus();
        job.setStatus(newStatus);

        // Set postedAt when changing from DRAFT to PUBLISHED
        if (oldStatus != JobPosting.JobStatus.PUBLISHED &&
                newStatus == JobPosting.JobStatus.PUBLISHED &&
                job.getPostedAt() == null) {
            job.setPostedAt(LocalDateTime.now());
        }

        job.setApplicationLink(request.getApplicationLink());

        // Update content
        job.setRoleSummary(request.getRoleSummary());
        job.setResponsibilities(request.getResponsibilities());
        job.setMustHaveSkills(request.getMustHaveSkills());
        job.setNiceToHaveSkills(request.getNiceToHaveSkills());
        job.setToolsAndTechnologies(request.getToolsAndTechnologies());
        job.setFaqs(request.getFaqs());

        // Update new comprehensive fields
        job.setEligibleBatch(request.getEligibleBatch());
        job.setQualification(request.getQualification());
        job.setExperienceLevel(request.getExperienceLevel());
        job.setLastDateToApply(request.getLastDateToApply());
        job.setEligibilityCriteria(request.getEligibilityCriteria());
        job.setInterviewTips(request.getInterviewTips());
        job.setSelectionProcess(request.getSelectionProcess());
        job.setCareerGrowthInfo(request.getCareerGrowthInfo());
        job.setFutureRoles(request.getFutureRoles());

        // Update embedded details
        job.setCompensation(buildCompensationDetails(request));
        job.setWorkArrangement(buildWorkArrangementDetails(request));
        job.setHiringWorkflow(buildHiringWorkflowDetails(request));
        job.setRoleContext(buildRoleContextDetails(request));
        job.setLegalAndPolicy(buildLegalAndPolicyDetails(request));

        // Update SEO
        job.setSeoTitle(request.getSeoTitle());
        job.setSeoDescription(request.getSeoDescription());
        job.setExpiresAt(request.getExpiresAt());

        JobPosting updatedJob = jobRepository.save(job);
        log.info("Job updated successfully: {}", slug);

        return mapToDetailResponse(updatedJob);
    }

    /**
     * Soft delete job
     * Sets deleted flag instead of removing from database
     * Evicts caches
     */
    @Transactional
    @Caching(evict = {
            @CacheEvict(value = "jobList", allEntries = true),
            @CacheEvict(value = "jobDetails", key = "#slug")
    })
    public void deleteJob(String slug) {
        log.info("Soft deleting job with slug: {}", slug);

        JobPosting job = jobRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Job not found with slug: " + slug));

        job.setDeleted(true);
        jobRepository.save(job);

        log.info("Job soft deleted: {}", slug);
    }

    // ========== Helper Methods ==========

    /**
     * Ensure slug is unique by appending counter if necessary
     */
    private String ensureUniqueSlug(String baseSlug) {
        String slug = baseSlug;
        int counter = 1;

        while (jobRepository.existsBySlug(slug)) {
            slug = slugGenerator.generateUniqueSlug(baseSlug, counter);
            counter++;
        }

        return slug;
    }

    /**
     * Build CompensationDetails from request
     */
    private CompensationDetails buildCompensationDetails(JobCreateUpdateRequest request) {
        return new CompensationDetails(
                request.getSalaryMin(),
                request.getSalaryMax(),
                request.getCurrency(),
                request.getSalaryType(),
                request.getPayFrequency(),
                request.getBenefitsSummary(),
                request.getAdditionalPerks());
    }

    /**
     * Build WorkArrangementDetails from request
     */
    private WorkArrangementDetails buildWorkArrangementDetails(JobCreateUpdateRequest request) {
        return new WorkArrangementDetails(
                request.getWorkMode(),
                request.getOfficeLocation(),
                request.getWorkingHours(),
                request.getShiftType(),
                request.getWeekendWork(),
                request.getTravelRequired(),
                request.getTravelPercentage(),
                request.getWorkEnvironment());
    }

    /**
     * Build HiringWorkflowDetails from request
     */
    private HiringWorkflowDetails buildHiringWorkflowDetails(JobCreateUpdateRequest request) {
        return new HiringWorkflowDetails(
                request.getNumberOfRounds(),
                request.getRoundsDescription(),
                request.getExpectedDecisionDays(),
                request.getAssignmentRequired(),
                request.getPreparationTips());
    }

    /**
     * Build RoleContextDetails from request
     */
    private RoleContextDetails buildRoleContextDetails(JobCreateUpdateRequest request) {
        return new RoleContextDetails(
                request.getTeamOverview(),
                request.getProjectDomain(),
                request.getTechStack(),
                request.getCareerPath(),
                request.getIdealCandidateProfile());
    }

    /**
     * Build LegalAndPolicyDetails from request
     */
    private LegalAndPolicyDetails buildLegalAndPolicyDetails(JobCreateUpdateRequest request) {
        return new LegalAndPolicyDetails(
                request.getBackgroundCheckRequired(),
                request.getBondApplicable(),
                request.getBondDuration(),
                request.getNoticePeriodPolicy(),
                request.getEqualOpportunityStatement());
    }

    /**
     * Map JobPosting entity to JobSummaryResponse DTO
     * Used for list views - contains minimal data
     */
    private JobSummaryResponse mapToSummaryResponse(JobPosting job) {
        return JobSummaryResponse.builder()
                .id(job.getId())
                .title(job.getTitle())
                .slug(job.getSlug())
                .companyName(job.getCompany().getName())
                .companySlug(job.getCompany().getSlug())
                .categoryName(job.getCategory().getName())
                .categorySlug(job.getCategory().getSlug())
                .location(job.getLocation())
                .remote(job.getRemote())
                .roleSummary(job.getRoleSummary())
                .jobType(job.getJobType())
                .status(job.getStatus().name())
                .postedAt(job.getPostedAt() != null ? job.getPostedAt().format(DATE_FORMATTER) : null)
                .build();
    }

    /**
     * Map JobPosting entity to JobDetailResponse DTO
     * Contains all job information including embedded details
     */
    private JobDetailResponse mapToDetailResponse(JobPosting job) {
        return JobDetailResponse.builder()
                .id(job.getId())
                .title(job.getTitle())
                .slug(job.getSlug())
                .location(job.getLocation())
                .remote(job.getRemote())
                .jobType(job.getJobType())
                .status(job.getStatus().name())
                .applicationLink(job.getApplicationLink())
                .company(buildCompanyMap(job.getCompany()))
                .category(buildCategoryMap(job.getCategory()))
                .roleSummary(job.getRoleSummary())
                .responsibilities(job.getResponsibilities())
                .mustHaveSkills(job.getMustHaveSkills())
                .niceToHaveSkills(job.getNiceToHaveSkills())
                .toolsAndTechnologies(job.getToolsAndTechnologies())
                .faqs(job.getFaqs())
                .eligibleBatch(job.getEligibleBatch())
                .qualification(job.getQualification())
                .experienceLevel(job.getExperienceLevel())
                .lastDateToApply(job.getLastDateToApply() != null ? job.getLastDateToApply().toString() : null)
                .eligibilityCriteria(job.getEligibilityCriteria())
                .interviewTips(job.getInterviewTips())
                .selectionProcess(job.getSelectionProcess())
                .careerGrowthInfo(job.getCareerGrowthInfo())
                .futureRoles(job.getFutureRoles())
                .compensation(buildCompensationMap(job.getCompensation()))
                .workArrangement(buildWorkArrangementMap(job.getWorkArrangement()))
                .hiringWorkflow(buildHiringWorkflowMap(job.getHiringWorkflow()))
                .roleContext(buildRoleContextMap(job.getRoleContext()))
                .legalAndPolicy(buildLegalAndPolicyMap(job.getLegalAndPolicy()))
                .seoTitle(job.getSeoTitle())
                .seoDescription(job.getSeoDescription())
                .postedAt(job.getPostedAt() != null ? job.getPostedAt().format(DATE_FORMATTER) : null)
                .expiresAt(job.getExpiresAt() != null ? job.getExpiresAt().format(DATE_FORMATTER) : null)
                .createdAt(job.getCreatedAt().format(DATE_FORMATTER))
                .updatedAt(job.getUpdatedAt().format(DATE_FORMATTER))
                .build();
    }

    private Map<String, Object> buildCompanyMap(Company company) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", company.getId());
        map.put("name", company.getName());
        map.put("slug", company.getSlug());
        map.put("website", company.getWebsite());
        map.put("logoUrl", company.getLogoUrl());
        map.put("about", company.getAbout());
        map.put("workCulture", company.getWorkCulture());
        map.put("hiringProcess", company.getHiringProcess());
        map.put("interviewTips", company.getInterviewTips());
        return map;
    }

    private Map<String, Object> buildCategoryMap(JobCategory category) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", category.getId());
        map.put("name", category.getName());
        map.put("slug", category.getSlug());
        map.put("introText", category.getIntroText());
        map.put("careerGuide", category.getCareerGuide());
        map.put("faq", category.getFaq());
        return map;
    }

    private Map<String, Object> buildCompensationMap(CompensationDetails comp) {
        if (comp == null)
            return null;
        Map<String, Object> map = new HashMap<>();
        map.put("salaryMin", comp.getSalaryMin());
        map.put("salaryMax", comp.getSalaryMax());
        map.put("currency", comp.getCurrency());
        map.put("salaryType", comp.getSalaryType());
        map.put("payFrequency", comp.getPayFrequency());
        map.put("benefitsSummary", comp.getBenefitsSummary());
        map.put("additionalPerks", comp.getAdditionalPerks());
        return map;
    }

    private Map<String, Object> buildWorkArrangementMap(WorkArrangementDetails wa) {
        if (wa == null)
            return null;
        Map<String, Object> map = new HashMap<>();
        map.put("workMode", wa.getWorkMode());
        map.put("officeLocation", wa.getOfficeLocation());
        map.put("workingHours", wa.getWorkingHours());
        map.put("shiftType", wa.getShiftType());
        map.put("weekendWork", wa.getWeekendWork());
        map.put("travelRequired", wa.getTravelRequired());
        map.put("travelPercentage", wa.getTravelPercentage());
        map.put("workEnvironment", wa.getWorkEnvironment());
        return map;
    }

    private Map<String, Object> buildHiringWorkflowMap(HiringWorkflowDetails hw) {
        if (hw == null)
            return null;
        Map<String, Object> map = new HashMap<>();
        map.put("numberOfRounds", hw.getNumberOfRounds());
        map.put("roundsDescription", hw.getRoundsDescription());
        map.put("expectedDecisionDays", hw.getExpectedDecisionDays());
        map.put("assignmentRequired", hw.getAssignmentRequired());
        map.put("preparationTips", hw.getPreparationTips());
        return map;
    }

    private Map<String, Object> buildRoleContextMap(RoleContextDetails rc) {
        if (rc == null)
            return null;
        Map<String, Object> map = new HashMap<>();
        map.put("teamOverview", rc.getTeamOverview());
        map.put("projectDomain", rc.getProjectDomain());
        map.put("techStack", rc.getTechStack());
        map.put("careerPath", rc.getCareerPath());
        map.put("idealCandidateProfile", rc.getIdealCandidateProfile());
        return map;
    }

    private Map<String, Object> buildLegalAndPolicyMap(LegalAndPolicyDetails lp) {
        if (lp == null)
            return null;
        Map<String, Object> map = new HashMap<>();
        map.put("backgroundCheckRequired", lp.getBackgroundCheckRequired());
        map.put("bondApplicable", lp.getBondApplicable());
        map.put("bondDuration", lp.getBondDuration());
        map.put("noticePeriodPolicy", lp.getNoticePeriodPolicy());
        map.put("equalOpportunityStatement", lp.getEqualOpportunityStatement());
        return map;
    }
}
