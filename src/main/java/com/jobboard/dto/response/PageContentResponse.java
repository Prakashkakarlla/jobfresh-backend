package com.jobboard.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response DTO for static page content
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageContentResponse {

    private Long id;
    private String slug;
    private String title;
    private String content;
    private String seoTitle;
    private String seoDescription;
    private String createdAt;
    private String updatedAt;
}
