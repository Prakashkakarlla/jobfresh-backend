package com.jobboard.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BlogPostResponse {

    private Long id;
    private String title;
    private String slug;
    private String content;

    // Author info
    private Long authorId;
    private String authorName;

    // Category
    private BlogCategoryDto category;

    // Tags
    private Set<BlogTagDto> tags;

    // Status & flags
    private String status;
    private Boolean featured;

    // Analytics
    private Long viewCount;
    private Integer readingTimeMinutes;

    // SEO
    private String metaDescription;
    private String metaKeywords;
    private String ogImage;

    // Timestamps
    private String createdAt;
    private String updatedAt;

    // Backward compatibility
    @Deprecated
    private Boolean published;
}
