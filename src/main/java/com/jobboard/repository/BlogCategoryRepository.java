package com.jobboard.repository;

import com.jobboard.entity.BlogCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.List;

@Repository
public interface BlogCategoryRepository extends JpaRepository<BlogCategory, Long> {

    Optional<BlogCategory> findBySlug(String slug);

    List<BlogCategory> findAllByOrderByDisplayOrderAsc();

    boolean existsBySlug(String slug);
}
