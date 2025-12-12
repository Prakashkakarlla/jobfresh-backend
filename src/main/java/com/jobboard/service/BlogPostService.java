package com.jobboard.service;

import com.jobboard.dto.request.BlogPostRequest;
import com.jobboard.dto.response.BlogCategoryDto;
import com.jobboard.dto.response.BlogPostResponse;
import com.jobboard.dto.response.BlogTagDto;
import com.jobboard.entity.BlogCategory;
import com.jobboard.entity.BlogPost;
import com.jobboard.entity.BlogTag;
import com.jobboard.entity.User;
import com.jobboard.entity.enums.BlogStatus;
import com.jobboard.exception.ResourceNotFoundException;
import com.jobboard.repository.BlogCategoryRepository;
import com.jobboard.repository.BlogPostRepository;
import com.jobboard.repository.BlogTagRepository;
import com.jobboard.repository.UserRepository;
import com.jobboard.util.SlugGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BlogPostService {

    private final BlogPostRepository blogPostRepository;
    private final BlogCategoryRepository categoryRepository;
    private final BlogTagRepository tagRepository;
    private final UserRepository userRepository;
    private final SlugGenerator slugGenerator;

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("MMM dd, yyyy");

    @Transactional
    public BlogPostResponse createBlogPost(BlogPostRequest request, Long authorId) {
        log.info("Creating blog post: {}", request.getTitle());

        // Generate unique slug
        String baseSlug = request.getTitle() != null ? slugGenerator.generateSlug(request.getTitle()) : "untitled";
        String uniqueSlug = ensureUniqueSlug(baseSlug);

        // Create entity
        BlogPost blogPost = new BlogPost();
        blogPost.setTitle(request.getTitle());
        blogPost.setSlug(uniqueSlug);
        blogPost.setContent(request.getContent());

        // Set author
        if (authorId != null) {
            User author = userRepository.findById(authorId)
                    .orElseThrow(() -> new RuntimeException("Author not found"));
            blogPost.setAuthor(author);
        }

        // Set category
        if (request.getCategoryId() != null) {
            BlogCategory category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            blogPost.setCategory(category);
        }

        // Set tags
        if (request.getTagIds() != null && !request.getTagIds().isEmpty()) {
            Set<BlogTag> tags = new HashSet<>(tagRepository.findAllById(request.getTagIds()));
            blogPost.setTags(tags);
        }

        // Set status
        if (request.getStatus() != null) {
            blogPost.setStatus(BlogStatus.valueOf(request.getStatus()));
        } else if (request.getPublished() != null && request.getPublished()) {
            blogPost.setStatus(BlogStatus.PUBLISHED);
        } else {
            blogPost.setStatus(BlogStatus.DRAFT);
        }

        // Set other fields
        blogPost.setFeatured(request.getFeatured() != null ? request.getFeatured() : false);
        blogPost.setMetaDescription(request.getMetaDescription());
        blogPost.setMetaKeywords(request.getMetaKeywords());
        blogPost.setOgImage(request.getOgImage());

        // Backward compatibility
        blogPost.setPublished(BlogStatus.PUBLISHED.equals(blogPost.getStatus()));

        BlogPost saved = blogPostRepository.save(blogPost);
        log.info("Blog post created with ID: {}", saved.getId());

        return mapToResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<BlogPostResponse> getAllBlogPosts() {
        return blogPostRepository.findAll().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<BlogPostResponse> getPublishedBlogPosts() {
        return blogPostRepository.findAll().stream()
                .filter(BlogPost::isPublished)
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public BlogPostResponse getBlogPostBySlug(String slug) {
        BlogPost blogPost = blogPostRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post not found with slug: " + slug));
        return mapToResponse(blogPost);
    }

    @Transactional
    public BlogPostResponse updateBlogPost(Long id, BlogPostRequest request, Long editorId) {
        log.info("Updating blog post with ID: {}", id);

        BlogPost blogPost = blogPostRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post not found"));

        // Update basic fields
        blogPost.setTitle(request.getTitle());
        blogPost.setContent(request.getContent());

        // Update category
        if (request.getCategoryId() != null) {
            BlogCategory category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            blogPost.setCategory(category);
        } else {
            blogPost.setCategory(null);
        }

        // Update tags
        if (request.getTagIds() != null) {
            Set<BlogTag> tags = new HashSet<>(tagRepository.findAllById(request.getTagIds()));
            blogPost.setTags(tags);
        } else {
            blogPost.getTags().clear();
        }

        // Update status
        if (request.getStatus() != null) {
            blogPost.setStatus(BlogStatus.valueOf(request.getStatus()));
        } else if (request.getPublished() != null) {
            blogPost.setStatus(request.getPublished() ? BlogStatus.PUBLISHED : BlogStatus.DRAFT);
        }

        // Update SEO and other fields
        blogPost.setFeatured(request.getFeatured() != null ? request.getFeatured() : false);
        blogPost.setMetaDescription(request.getMetaDescription());
        blogPost.setMetaKeywords(request.getMetaKeywords());
        blogPost.setOgImage(request.getOgImage());

        // Backward compatibility
        blogPost.setPublished(BlogStatus.PUBLISHED.equals(blogPost.getStatus()));

        BlogPost updated = blogPostRepository.save(blogPost);
        log.info("Blog post updated successfully");

        return mapToResponse(updated);
    }

    @Transactional
    public void deleteBlogPost(Long id) {
        log.info("Deleting blog post with ID: {}", id);
        BlogPost blogPost = blogPostRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post not found"));

        blogPostRepository.delete(blogPost);
        log.info("Blog post deleted successfully");
    }

    @Transactional
    public void incrementViewCount(Long id) {
        blogPostRepository.findById(id).ifPresent(post -> {
            post.setViewCount(post.getViewCount() + 1);
            blogPostRepository.save(post);
        });
    }

    private String ensureUniqueSlug(String baseSlug) {
        String slug = baseSlug;
        int counter = 1;

        while (blogPostRepository.existsBySlug(slug)) {
            slug = baseSlug + "-" + counter;
            counter++;
        }

        return slug;
    }

    private BlogPostResponse mapToResponse(BlogPost blogPost) {
        return BlogPostResponse.builder()
                .id(blogPost.getId())
                .title(blogPost.getTitle())
                .slug(blogPost.getSlug())
                .content(blogPost.getContent())
                .authorId(blogPost.getAuthor() != null ? blogPost.getAuthor().getId() : null)
                .authorName(blogPost.getAuthor() != null ? blogPost.getAuthor().getFullName() : null)
                .category(blogPost.getCategory() != null ? mapCategoryToDto(blogPost.getCategory()) : null)
                .tags(blogPost.getTags() != null
                        ? blogPost.getTags().stream().map(this::mapTagToDto).collect(Collectors.toSet())
                        : new HashSet<>())
                .status(blogPost.getStatus() != null ? blogPost.getStatus().name() : null)
                .featured(blogPost.getFeatured())
                .viewCount(blogPost.getViewCount())
                .readingTimeMinutes(blogPost.getReadingTimeMinutes())
                .metaDescription(blogPost.getMetaDescription())
                .metaKeywords(blogPost.getMetaKeywords())
                .ogImage(blogPost.getOgImage())
                .published(blogPost.getPublished())
                .createdAt(blogPost.getCreatedAt() != null ? blogPost.getCreatedAt().format(FORMATTER) : null)
                .updatedAt(blogPost.getUpdatedAt() != null ? blogPost.getUpdatedAt().format(FORMATTER) : null)
                .build();
    }

    private BlogCategoryDto mapCategoryToDto(BlogCategory category) {
        return BlogCategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .slug(category.getSlug())
                .description(category.getDescription())
                .displayOrder(category.getDisplayOrder())
                .createdAt(category.getCreatedAt())
                .build();
    }

    private BlogTagDto mapTagToDto(BlogTag tag) {
        return BlogTagDto.builder()
                .id(tag.getId())
                .name(tag.getName())
                .slug(tag.getSlug())
                .createdAt(tag.getCreatedAt())
                .build();
    }
}
