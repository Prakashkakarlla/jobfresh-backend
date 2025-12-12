package com.jobboard.repository;

import com.jobboard.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository for Company entity
 */
@Repository
public interface CompanyRepository extends JpaRepository<Company, Long> {

    /**
     * Find company by slug
     */
    Optional<Company> findBySlug(String slug);

    /**
     * Check if company exists by slug
     */
    boolean existsBySlug(String slug);
}
