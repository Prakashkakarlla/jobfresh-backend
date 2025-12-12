package com.jobboard.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;

/**
 * Async configuration for background task execution
 * Primarily used for email sending to prevent blocking API responses
 */
@Configuration
@EnableAsync
public class AsyncConfig {

    @Value("${async.executor.core-pool-size:2}")
    private int corePoolSize;

    @Value("${async.executor.max-pool-size:5}")
    private int maxPoolSize;

    @Value("${async.executor.queue-capacity:100}")
    private int queueCapacity;

    @Value("${async.executor.thread-name-prefix:async-}")
    private String threadNamePrefix;

    /**
     * Thread pool executor for async operations (primarily mail sending)
     * 
     * Configuration:
     * - Core pool size: 2 threads (always alive)
     * - Max pool size: 5 threads (created on demand)
     * - Queue capacity: 100 tasks (buffered before rejection)
     */
    @Bean(name = "mailExecutor")
    public Executor mailExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setThreadNamePrefix(threadNamePrefix);
        executor.setWaitForTasksToCompleteOnShutdown(true);
        executor.setAwaitTerminationSeconds(60);
        executor.initialize();
        return executor;
    }
}
