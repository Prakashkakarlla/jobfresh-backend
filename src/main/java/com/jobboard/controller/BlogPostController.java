package com.jobboard.controller;

import com.jobboard.dto.request.BlogPostRequest;
import com.jobboard.dto.response.BlogPostResponse;
import com.jobboard.service.BlogPostService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/blogs")
@RequiredArgsConstructor
@Slf4j
public class BlogPostController {

    private final BlogPostService blogPostService;

    @PostMapping
    public ResponseEntity<BlogPostResponse> createBlogPost(@Valid @RequestBody BlogPostRequest request) {
        log.info("POST /api/blog-posts - Creating blog post: {}", request.getTitle());
        Long authorId = 1L; // TODO: Get from authentication
        BlogPostResponse response = blogPostService.createBlogPost(request, authorId);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<BlogPostResponse>> getAllBlogPosts() {
        log.debug("GET /api/blog-posts - Fetching all blog posts");
        List<BlogPostResponse> posts = blogPostService.getAllBlogPosts();
        return ResponseEntity.ok(posts);
    }

    @GetMapping("/{slug}")
    public ResponseEntity<BlogPostResponse> getBlogPost(@PathVariable String slug) {
        log.debug("GET /api/blogs/{}", slug);
        BlogPostResponse post = blogPostService.getBlogPostBySlug(slug);
        return ResponseEntity.ok(post);
    }

    @PutMapping("/{id}")
    public ResponseEntity<BlogPostResponse> updateBlogPost(
            @PathVariable Long id,
            @Valid @RequestBody BlogPostRequest request) {
        log.info("PUT /api/blog-posts/{}", id);
        Long editorId = 1L; // TODO: Get from authentication
        BlogPostResponse response = blogPostService.updateBlogPost(id, request, editorId);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBlogPost(@PathVariable Long id) {
        log.info("DELETE /api/blog-posts/{}", id);
        blogPostService.deleteBlogPost(id);
        return ResponseEntity.noContent().build();
    }
}
