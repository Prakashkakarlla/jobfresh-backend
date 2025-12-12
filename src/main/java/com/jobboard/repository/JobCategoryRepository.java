package com.jobboard.repository;

import com.jobboard.entity.JobCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository for JobCategory entity
 */
@Repository
public interface JobCategoryRepository extends JpaRepository<JobCategory, Long> {

    /**
     * Find category by slug
     */
    Optional<JobCategory> findBySlug(String slug);

    /**
     * Check if category exists by slug
     */
    boolean existsBySlug(String slug);
}
