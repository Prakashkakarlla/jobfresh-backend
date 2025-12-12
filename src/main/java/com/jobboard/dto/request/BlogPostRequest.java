package com.jobboard.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlogPostRequest {

    @NotBlank(message = "Title is required")
    @Size(max = 500, message = "Title must not exceed 500 characters")
    private String title;

    @NotBlank(message = "Content is required")
    private String content;

    // Category
    private Long categoryId;

    // Tags (IDs)
    private Set<Long> tagIds;

    // Status
    private String status; // DRAFT, PUBLISHED, ARCHIVED

    // Featured flag
    private Boolean featured;

    // SEO
    @Size(max = 255, message = "Meta description must not exceed 255 characters")
    private String metaDescription;

    @Size(max = 255, message = "Meta keywords must not exceed 255 characters")
    private String metaKeywords;

    @Size(max = 500, message = "OG image URL must not exceed 500 characters")
    private String ogImage;

    // Backward compatibility
    @Deprecated
    private Boolean published;
}
