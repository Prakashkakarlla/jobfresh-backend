-- Fix blog_posts table - set default timestamps for NULL values

-- Update all blog posts with NULL created_at to use current timestamp
UPDATE blog_posts 
SET created_at = COALESCE(created_at, NOW())
WHERE created_at IS NULL;

-- Update all blog posts with NULL updated_at to match created_at
UPDATE blog_posts 
SET updated_at = COALESCE(updated_at, created_at, NOW())
WHERE updated_at IS NULL;

-- Update all blog posts with NULL published_at to match created_at (for published posts)
UPDATE blog_posts 
SET published_at = COALESCE(published_at, created_at, NOW())
WHERE published_at IS NULL AND status = 'PUBLISHED';

-- Verify the fix
SELECT id, title, created_at, updated_at, published_at, status 
FROM blog_posts 
LIMIT 5;
