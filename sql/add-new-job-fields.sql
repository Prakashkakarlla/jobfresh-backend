-- Add new comprehensive fields for job postings
USE jobboard;

-- Add columns one by one (will skip if exists)
ALTER TABLE job_postings ADD COLUMN eligible_batch VARCHAR(100);
ALTER TABLE job_postings ADD COLUMN qualification VARCHAR(500);
ALTER TABLE job_postings ADD COLUMN experience_level VARCHAR(100);
ALTER TABLE job_postings ADD COLUMN last_date_to_apply DATE;
ALTER TABLE job_postings ADD COLUMN eligibility_criteria TEXT;
ALTER TABLE job_postings ADD COLUMN interview_tips TEXT;
ALTER TABLE job_postings ADD COLUMN selection_process TEXT;
ALTER TABLE job_postings ADD COLUMN career_growth_info TEXT;
ALTER TABLE job_postings ADD COLUMN future_roles TEXT;

SELECT 'New columns added!' AS Status;
