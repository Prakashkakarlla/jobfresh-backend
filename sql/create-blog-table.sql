-- Create blog_posts table
CREATE TABLE IF NOT EXISTS blog_posts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    slug VARCHAR(500) NOT NULL UNIQUE,
    content TEXT NOT NULL,
    author VARCHAR(255),
    category VARCHAR(255),
    featured_image VARCHAR(1000),
    meta_description VARCHAR(500),
    tags TEXT,
    published BOOLEAN NOT NULL DEFAULT FALSE,
    published_at DATETIME,
    seo_title VARCHAR(255),
    seo_description VARCHAR(500),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_blog_slug (slug),
    INDEX idx_blog_published (published),
    INDEX idx_blog_published_at (published_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
