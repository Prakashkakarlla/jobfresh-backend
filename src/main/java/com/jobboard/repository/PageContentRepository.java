package com.jobboard.repository;

import com.jobboard.entity.PageContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository for PageContent entity
 */
@Repository
public interface PageContentRepository extends JpaRepository<PageContent, Long> {

    /**
     * Find published page by slug
     */
    Optional<PageContent> findBySlugAndPublishedTrue(String slug);

    /**
     * Find page by slug (admin - ignores published status)
     */
    Optional<PageContent> findBySlug(String slug);

    /**
     * Check if page exists by slug
     */
    boolean existsBySlug(String slug);
}
