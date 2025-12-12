-- Professional Blog System Database Migration
-- Run this to upgrade blog tables

-- Create blog_categories table
CREATE TABLE IF NOT EXISTS blog_categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_slug (slug),
    INDEX idx_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create blog_tags table
CREATE TABLE IF NOT EXISTS blog_tags (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create blog_post_tags join table
CREATE TABLE IF NOT EXISTS blog_post_tags (
    blog_post_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    PRIMARY KEY (blog_post_id, tag_id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_posts(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES blog_tags(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Update blog_posts table (add columns one by one, ignore errors if they exist)
-- Note: Run each ALTER TABLE separately, ignore errors for existing columns

ALTER TABLE blog_posts ADD COLUMN author_id BIGINT;
ALTER TABLE blog_posts ADD COLUMN category_id BIGINT;
ALTER TABLE blog_posts ADD COLUMN status VARCHAR(20) DEFAULT 'DRAFT';
ALTER TABLE blog_posts ADD COLUMN featured BOOLEAN DEFAULT FALSE;
ALTER TABLE blog_posts ADD COLUMN view_count BIGINT DEFAULT 0;
ALTER TABLE blog_posts ADD COLUMN reading_time_minutes INT;
ALTER TABLE blog_posts ADD COLUMN meta_description VARCHAR(255);
ALTER TABLE blog_posts ADD COLUMN meta_keywords VARCHAR(255);
ALTER TABLE blog_posts ADD COLUMN og_image VARCHAR(500);

-- Add foreign keys (drop first if exists to avoid errors)
ALTER TABLE blog_posts DROP FOREIGN KEY IF EXISTS fk_blog_author;
ALTER TABLE blog_posts DROP FOREIGN KEY IF EXISTS fk_blog_category;

ALTER TABLE blog_posts
ADD CONSTRAINT fk_blog_author FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE blog_posts
ADD CONSTRAINT fk_blog_category FOREIGN KEY (category_id) REFERENCES blog_categories(id) ON DELETE SET NULL;

-- Add indexes
CREATE INDEX idx_author_id ON blog_posts(author_id);
CREATE INDEX idx_category_id ON blog_posts(category_id);
CREATE INDEX idx_status ON blog_posts(status);
CREATE INDEX idx_featured ON blog_posts(featured);

-- Insert sample categories
INSERT INTO blog_categories (name, slug, description, display_order) VALUES
('Technology', 'technology', 'Tech tutorials, tools, and industry news', 1),
('Career', 'career', 'Career advice, growth tips, and professional development', 2),
('Interview Prep', 'interview-prep', 'Interview questions, guides, and preparation tips', 3),
('Company Culture', 'company-culture', 'Work culture, team building, and workplace insights', 4)
ON DUPLICATE KEY UPDATE name=name;

-- Insert sample tags
INSERT INTO blog_tags (name, slug) VALUES
('Java', 'java'),
('Spring Boot', 'spring-boot'),
('React', 'react'),
('JavaScript', 'javascript'),
('Career Tips', 'career-tips'),
('Interview', 'interview'),
('Remote Work', 'remote-work'),
('Productivity', 'productivity'),
('Leadership', 'leadership'),
('Job Search', 'job-search')
ON DUPLICATE KEY UPDATE name=name;

-- Migrate existing published field to status
UPDATE blog_posts 
SET status = CASE 
    WHEN published = TRUE THEN 'PUBLISHED'
    ELSE 'DRAFT'
END
WHERE status IS NULL OR status = '';
