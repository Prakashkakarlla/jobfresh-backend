package com.jobboard.service;

import com.jobboard.dto.request.PageContentRequest;
import com.jobboard.dto.response.PageContentResponse;
import com.jobboard.entity.PageContent;
import com.jobboard.exception.ResourceNotFoundException;
import com.jobboard.repository.PageContentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.format.DateTimeFormatter;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class PageContentService {

    private final PageContentRepository pageRepository;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Transactional
    @CacheEvict(value = "pages", allEntries = true)
    public PageContentResponse createPage(PageContentRequest request) {
        log.info("Creating page: {}", request.getSlug());

        PageContent page = new PageContent();
        page.setSlug(request.getSlug());
        page.setTitle(request.getTitle());
        page.setContent(request.getContent());
        page.setPublished(request.getPublished());
        page.setSeoTitle(request.getSeoTitle() != null ? request.getSeoTitle() : request.getTitle());
        page.setSeoDescription(request.getSeoDescription());

        PageContent saved = pageRepository.save(page);
        return mapToResponse(saved);
    }

    @Cacheable(value = "pages", key = "#slug")
    public PageContentResponse getPublishedPage(String slug) {
        PageContent page = pageRepository.findBySlugAndPublishedTrue(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Page not found: " + slug));

        return mapToResponse(page);
    }

    @Transactional
    @CacheEvict(value = "pages", key = "#slug")
    public PageContentResponse updatePage(String slug, PageContentRequest request) {
        PageContent page = pageRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Page not found: " + slug));

        page.setTitle(request.getTitle());
        page.setContent(request.getContent());
        page.setPublished(request.getPublished());
        page.setSeoTitle(request.getSeoTitle());
        page.setSeoDescription(request.getSeoDescription());

        PageContent updated = pageRepository.save(page);
        return mapToResponse(updated);
    }

    @Transactional
    @CacheEvict(value = "pages", key = "#slug")
    public void deletePage(String slug) {
        PageContent page = pageRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Page not found: " + slug));

        pageRepository.delete(page);
        log.info("Page deleted: {}", slug);
    }

    private PageContentResponse mapToResponse(PageContent page) {
        return PageContentResponse.builder()
                .id(page.getId())
                .slug(page.getSlug())
                .title(page.getTitle())
                .content(page.getContent())
                .seoTitle(page.getSeoTitle())
                .seoDescription(page.getSeoDescription())
                .createdAt(page.getCreatedAt().format(DATE_FORMATTER))
                .updatedAt(page.getUpdatedAt().format(DATE_FORMATTER))
                .build();
    }
}
