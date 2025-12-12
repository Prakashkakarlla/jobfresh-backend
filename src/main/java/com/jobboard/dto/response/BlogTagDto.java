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
public class BlogTagDto {
    private Long id;
    private String name;
    private String slug;
    private LocalDateTime createdAt;
}
