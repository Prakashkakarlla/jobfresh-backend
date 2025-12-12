package com.jobboard.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Cache configuration for the application
 * Uses in-memory ConcurrentMapCacheManager for simplicity
 * 
 * For production with multiple instances, consider:
 * - Redis (recommended)
 * - Hazelcast
 * - EhCache
 */
@Configuration
@EnableCaching
public class CacheConfig {

    @Bean
    public CacheManager cacheManager() {
        return new ConcurrentMapCacheManager(
                "jobList", // Job listings cache (by category + page)
                "jobDetails", // Individual job details (by slug)
                "blogList", // Blog post listings (by tag + page)
                "blogDetails", // Individual blog posts (by slug)
                "pages" // Static pages (by slug)
        );
    }
}
