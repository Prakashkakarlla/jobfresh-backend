package com.jobboard.controller;

import com.jobboard.dto.request.PageContentRequest;
import com.jobboard.dto.response.PageContentResponse;
import com.jobboard.service.PageContentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/pages")
@RequiredArgsConstructor
@Slf4j
public class PageContentController {

    private final PageContentService pageService;

    @PostMapping
    public ResponseEntity<PageContentResponse> createPage(@Valid @RequestBody PageContentRequest request) {
        log.info("POST /api/pages - Creating page: {}", request.getSlug());
        PageContentResponse response = pageService.createPage(request);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    @GetMapping("/{slug}")
    public ResponseEntity<PageContentResponse> getPage(@PathVariable String slug) {
        log.debug("GET /api/pages/{}", slug);
        PageContentResponse page = pageService.getPublishedPage(slug);
        return ResponseEntity.ok(page);
    }

    @PutMapping("/{slug}")
    public ResponseEntity<PageContentResponse> updatePage(
            @PathVariable String slug,
            @Valid @RequestBody PageContentRequest request) {

        log.info("PUT /api/pages/{}", slug);
        PageContentResponse updated = pageService.updatePage(slug, request);
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{slug}")
    public ResponseEntity<Void> deletePage(@PathVariable String slug) {
        log.info("DELETE /api/pages/{}", slug);
        pageService.deletePage(slug);
        return ResponseEntity.noContent().build();
    }
}
