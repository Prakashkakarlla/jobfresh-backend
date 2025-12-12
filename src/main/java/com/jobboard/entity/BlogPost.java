package com.jobboard.entity;

import com.jobboard.entity.enums.BlogStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "blog_posts", indexes = {
        @Index(name = "idx_slug", columnList = "slug", unique = true),
        @Index(name = "idx_status", columnList = "status"),
        @Index(name = "idx_featured", columnList = "featured"),
        @Index(name = "idx_author", columnList = "author_id"),
        @Index(name = "idx_category", columnList = "category_id")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlogPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 500)
    private String title;

    @Column(nullable = false, unique = true, length = 500)
    private String slug;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    // Author relationship
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private User author;

    // Category relationship
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BlogCategory category;

    // Tags relationship (Many-to-Many)
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "blog_post_tags", joinColumns = @JoinColumn(name = "blog_post_id"), inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private Set<BlogTag> tags = new HashSet<>();

    // Status (DRAFT, PUBLISHED, ARCHIVED)
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private BlogStatus status = BlogStatus.DRAFT;

    // Featured flag
    @Column(nullable = false)
    private Boolean featured = false;

    // Analytics
    @Column(name = "view_count", nullable = false)
    private Long viewCount = 0L;

    @Column(name = "reading_time_minutes")
    private Integer readingTimeMinutes;

    // SEO Metadata
    @Column(name = "meta_description", length = 255)
    private String metaDescription;

    @Column(name = "meta_keywords", length = 255)
    private String metaKeywords;

    @Column(name = "og_image", length = 500)
    private String ogImage;

    // Timestamps
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // Backward compatibility - deprecated
    @Deprecated
    @Column(name = "published")
    private Boolean published;

    /**
     * Helper method to check if blog is published
     */
    public boolean isPublished() {
        return BlogStatus.PUBLISHED.equals(this.status);
    }

    /**
     * Calculate reading time based on content
     * Average reading speed: 200 words per minute
     */
    @PrePersist
    @PreUpdate
    protected void calculateReadingTime() {
        if (content != null && !content.isEmpty()) {
            int wordCount = content.split("\\s+").length;
            this.readingTimeMinutes = Math.max(1, (int) Math.ceil(wordCount / 200.0));
        }
    }
}
