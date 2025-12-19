package com.jobboard.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Cache configuration for the application
 * Uses in-memory ConcurrentMapCacheManager
 * 
 * Note: Redis can be enabled by adding spring-boot-starter-data-redis
 * and setting spring.cache.type=redis in application.properties
 */
@Configuration
@EnableCaching
public class CacheConfig {

    @Bean
    public CacheManager cacheManager() {
        return new ConcurrentMapCacheManager(
                "jobList",
                "jobDetails",
                "blogList",
                "blogDetails",
                "pages");
    }
}
