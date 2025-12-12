package com.jobboard.controller;

import com.jobboard.entity.JobCategory;
import com.jobboard.repository.JobCategoryRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/categories")
@RequiredArgsConstructor
public class CategoryController {

    private final JobCategoryRepository categoryRepository;

    /**
     * Get all categories with pagination
     */
    @GetMapping
    public ResponseEntity<Page<JobCategory>> getAllCategories(Pageable pageable) {
        log.info("Fetching all categories");
        Page<JobCategory> categories = categoryRepository.findAll(pageable);
        return ResponseEntity.ok(categories);
    }

    /**
     * Get all categories without pagination (for dropdowns)
     */
    @GetMapping("/all")
    public ResponseEntity<List<JobCategory>> getAllCategoriesList() {
        log.info("Fetching all categories list");
        List<JobCategory> categories = categoryRepository.findAll();
        return ResponseEntity.ok(categories);
    }

    /**
     * Get category by ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<JobCategory> getCategoryById(@PathVariable Long id) {
        log.info("Fetching category by id: {}", id);
        return categoryRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Create new category
     */
    @PostMapping
    public ResponseEntity<JobCategory> createCategory(@Valid @RequestBody JobCategory category) {
        log.info("Creating new category: {}", category.getName());

        // Generate slug from name if not provided
        if (category.getSlug() == null || category.getSlug().isEmpty()) {
            category.setSlug(generateSlug(category.getName()));
        }

        JobCategory savedCategory = categoryRepository.save(category);
        log.info("Category created with id: {}", savedCategory.getId());
        return ResponseEntity.status(HttpStatus.CREATED).body(savedCategory);
    }

    /**
     * Update existing category
     */
    @PutMapping("/{id}")
    public ResponseEntity<JobCategory> updateCategory(
            @PathVariable Long id,
            @Valid @RequestBody JobCategory categoryRequest) {
        log.info("Updating category with id: {}", id);

        return categoryRepository.findById(id)
                .map(category -> {
                    category.setName(categoryRequest.getName());
                    category.setSlug(categoryRequest.getSlug() != null ? categoryRequest.getSlug()
                            : generateSlug(categoryRequest.getName()));

                    // Update content fields
                    category.setIntroText(categoryRequest.getIntroText());
                    category.setCareerGuide(categoryRequest.getCareerGuide());
                    category.setFaq(categoryRequest.getFaq());

                    // Update SEO fields
                    category.setSeoTitle(categoryRequest.getSeoTitle());
                    category.setSeoDescription(categoryRequest.getSeoDescription());

                    JobCategory updated = categoryRepository.save(category);
                    log.info("Category updated: {}", id);
                    return ResponseEntity.ok(updated);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Delete category
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCategory(@PathVariable Long id) {
        log.info("Deleting category with id: {}", id);

        if (!categoryRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }

        categoryRepository.deleteById(id);
        log.info("Category deleted: {}", id);
        return ResponseEntity.noContent().build();
    }

    /**
     * Generate slug from category name
     */
    private String generateSlug(String name) {
        return name.toLowerCase()
                .replaceAll("[^a-z0-9\\s-]", "")
                .replaceAll("\\s+", "-")
                .replaceAll("-+", "-")
                .trim();
    }
}
