package com.jobboard.service;

import com.jobboard.dto.response.BlogCategoryDto;
import com.jobboard.entity.BlogCategory;
import com.jobboard.repository.BlogCategoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BlogCategoryService {

    private final BlogCategoryRepository categoryRepository;

    @Transactional(readOnly = true)
    public List<BlogCategoryDto> getAllCategories() {
        return categoryRepository.findAllByOrderByDisplayOrderAsc().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public BlogCategoryDto getCategoryBySlug(String slug) {
        BlogCategory category = categoryRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Category not found: " + slug));
        return toDto(category);
    }

    @Transactional
    public BlogCategoryDto createCategory(BlogCategoryDto dto) {
        if (categoryRepository.existsBySlug(dto.getSlug())) {
            throw new RuntimeException("Category with slug already exists: " + dto.getSlug());
        }

        BlogCategory category = new BlogCategory();
        category.setName(dto.getName());
        category.setSlug(dto.getSlug());
        category.setDescription(dto.getDescription());
        category.setDisplayOrder(dto.getDisplayOrder() != null ? dto.getDisplayOrder() : 0);

        BlogCategory saved = categoryRepository.save(category);
        log.info("Created blog category: {}", saved.getName());

        return toDto(saved);
    }

    @Transactional
    public BlogCategoryDto updateCategory(Long id, BlogCategoryDto dto) {
        BlogCategory category = categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found"));

        category.setName(dto.getName());
        category.setDescription(dto.getDescription());
        category.setDisplayOrder(dto.getDisplayOrder());

        BlogCategory updated = categoryRepository.save(category);
        log.info("Updated blog category: {}", updated.getName());

        return toDto(updated);
    }

    @Transactional
    public void deleteCategory(Long id) {
        BlogCategory category = categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found"));

        categoryRepository.delete(category);
        log.info("Deleted blog category: {}", category.getName());
    }

    private BlogCategoryDto toDto(BlogCategory category) {
        return BlogCategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .slug(category.getSlug())
                .description(category.getDescription())
                .displayOrder(category.getDisplayOrder())
                .createdAt(category.getCreatedAt())
                .build();
    }
}
