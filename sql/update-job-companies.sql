-- ================================================================
-- JOBFRESH: Assign Jobs to Companies (MySQL Compatible)
-- ================================================================

-- Step 1: Check current state
SELECT 'Jobs without companies:' AS status, COUNT(*) AS count 
FROM job_postings WHERE company_id IS NULL;

-- Step 2: SIMPLE SOLUTION - Assign all to one company
-- Uncomment ONE of these options:

-- Option A: Assign ALL jobs to Google (ID 1)
-- UPDATE job_postings SET company_id = 1 WHERE company_id IS NULL;

-- Option B: Assign ALL jobs to Microsoft (ID 2)
-- UPDATE job_postings SET company_id = 2 WHERE company_id IS NULL;

-- Option C: Assign ALL jobs to Amazon (ID 3)
-- UPDATE job_postings SET company_id = 3 WHERE company_id IS NULL;

-- Step 3: ADVANCED SOLUTION - Distribute jobs across companies
-- This uses modulo to spread jobs evenly

UPDATE job_postings 
SET company_id = CASE 
    WHEN MOD(id, 15) = 0 THEN 15   -- Deloitte
    WHEN MOD(id, 15) = 1 THEN 1    -- Google
    WHEN MOD(id, 15) = 2 THEN 2    -- Microsoft
    WHEN MOD(id, 15) = 3 THEN 3    -- Amazon
    WHEN MOD(id, 15) = 4 THEN 4    -- Meta
    WHEN MOD(id, 15) = 5 THEN 5    -- Apple
    WHEN MOD(id, 15) = 6 THEN 6    -- Netflix
    WHEN MOD(id, 15) = 7 THEN 7    -- Adobe
    WHEN MOD(id, 15) = 8 THEN 8    -- Salesforce
    WHEN MOD(id, 15) = 9 THEN 9    -- Infosys
    WHEN MOD(id, 15) = 10 THEN 10  -- TCS
    WHEN MOD(id, 15) = 11 THEN 11  -- Wipro
    WHEN MOD(id, 15) = 12 THEN 12  -- Accenture
    WHEN MOD(id, 15) = 13 THEN 13  -- Oracle
    WHEN MOD(id, 15) = 14 THEN 14  -- IBM
END
WHERE company_id IS NULL;

-- Step 4: Verify the results
SELECT 
    c.name AS company,
    COUNT(jp.id) AS job_count
FROM companies c
LEFT JOIN job_postings jp ON c.id = jp.company_id
GROUP BY c.id, c.name
ORDER BY job_count DESC, c.name;

-- Step 5: Show sample of assigned jobs
SELECT jp.title, c.name AS company
FROM job_postings jp
JOIN companies c ON jp.company_id = c.id
LIMIT 15;
