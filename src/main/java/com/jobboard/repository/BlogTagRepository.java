package com.jobboard.repository;

import com.jobboard.entity.BlogTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.List;
import java.util.Set;

@Repository
public interface BlogTagRepository extends JpaRepository<BlogTag, Long> {

    Optional<BlogTag> findBySlug(String slug);

    Optional<BlogTag> findByName(String name);

    List<BlogTag> findByNameIn(Set<String> names);

    boolean existsBySlug(String slug);
}
