package com.jobboard.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BlogCategoryDto {
    private Long id;
    private String name;
    private String slug;
    private String description;
    private Integer displayOrder;
    private LocalDateTime createdAt;
}
