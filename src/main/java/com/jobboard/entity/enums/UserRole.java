package com.jobboard.entity.enums;

/**
 * User roles for role-based access control
 */
public enum UserRole {
    /**
     * Super administrator with full system access
     * Uses OTP authentication
     */
    SUPER_ADMIN,

    /**
     * Administrator who can manage users and content
     * Uses email/password authentication
     */
    ADMIN,

    /**
     * Content manager who can create and edit blog posts
     * Uses email/password authentication
     */
    CONTENT_MANAGER,

    /**
     * Job manager who can create and edit job postings
     * Uses email/password authentication
     */
    JOB_MANAGER
}
