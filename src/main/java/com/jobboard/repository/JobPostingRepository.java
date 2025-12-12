package com.jobboard.repository;

import com.jobboard.entity.JobPosting;
import com.jobboard.entity.JobPosting.JobStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository for JobPosting entity with optimized queries
 * Uses @EntityGraph to prevent N+1 query problems
 */
@Repository
public interface JobPostingRepository extends JpaRepository<JobPosting, Long> {

    /**
     * Find job by slug with company and category eagerly fetched
     * Prevents N+1 queries by loading associations in single query
     */
    @EntityGraph(attributePaths = { "company", "category" })
    Optional<JobPosting> findBySlugAndDeletedFalseAndStatus(String slug, JobStatus status);

    /**
     * List all published jobs with pagination
     * Ordered by posted date descending (newest first)
     */
    @EntityGraph(attributePaths = { "company", "category" })
    Page<JobPosting> findByDeletedFalseAndStatusOrderByPostedAtDesc(JobStatus status, Pageable pageable);

    /**
     * List published jobs filtered by category slug
     * Ordered by posted date descending
     */
    @EntityGraph(attributePaths = { "company", "category" })
    Page<JobPosting> findByDeletedFalseAndStatusAndCategory_SlugOrderByPostedAtDesc(
            JobStatus status, String categorySlug, Pageable pageable);

    /**
     * Find job by slug (for admin operations - ignores status and deleted flag)
     */
    @EntityGraph(attributePaths = { "company", "category" })
    Optional<JobPosting> findBySlug(String slug);

    /**
     * Check if job exists by slug
     */
    boolean existsBySlug(String slug);
}
