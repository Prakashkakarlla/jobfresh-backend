-- ============================================
-- JobFresh Database - Complete Fix Script
-- This will populate all tables correctly
-- ============================================

USE jobboard;

-- Step 1: Clear job_postings only (keep companies and categories)
DELETE FROM job_postings WHERE id > 0;
DELETE FROM blog_posts WHERE id > 0;
DELETE FROM page_contents WHERE id > 0;

-- Step 2: Reset auto-increment
ALTER TABLE job_postings AUTO_INCREMENT = 1;
ALTER TABLE blog_posts AUTO_INCREMENT = 1;
ALTER TABLE page_contents AUTO_INCREMENT = 1;

-- Step 3: Insert Jobs (25 jobs across all companies and categories)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
-- Google (3 jobs)
('Senior Backend Engineer', 'senior-backend-engineer-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Build scalable backend systems at Google', 'Design distributed systems\nOptimize database performance\nMentor junior engineers', 'Java/Python/Go, Distributed Systems, SQL, 5+ years backend', 2000000, 3500000, 'INR', 'Hybrid', NOW(), 0),
('Data Scientist ML', 'data-scientist-ml-google', 'Hyderabad', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 2, 'Apply machine learning at Google scale', 'Develop ML models\nAnalyze petabyte datasets\nConduct A/B tests', 'Python, TensorFlow, Statistics, 3+ years ML', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),
('Frontend Engineer React', 'frontend-engineer-react-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 6, 'Create beautiful web experiences for Google products', 'Build responsive React apps\nOptimize performance\nImplement accessibility', 'React, TypeScript, HTML/CSS, 3+ years', 1500000, 2800000, 'INR', 'Hybrid', NOW(), 0),

-- Microsoft (3 jobs)
('Cloud Solutions Architect', 'cloud-solutions-architect-microsoft', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 3, 'Design Azure cloud solutions for enterprises', 'Architect cloud migrations\nConduct workshops\nProvide technical guidance', 'Azure, Cloud architecture, 6+ years experience', 1800000, 3200000, 'INR', 'Remote', NOW(), 0),
('Product Manager AI', 'product-manager-ai-microsoft', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 4, 'Drive AI product strategy at Microsoft', 'Define product roadmap\nWork with engineering\nAnalyze user metrics', 'Product strategy, Analytics, 5+ years PM', 2500000, 4000000, 'INR', 'Hybrid', NOW(), 0),
('DevOps Engineer Azure', 'devops-engineer-azure-microsoft', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 5, 'Build CI/CD pipelines for Microsoft products', 'Implement Azure DevOps\nManage Kubernetes\nAutomate infrastructure', 'Azure, Docker, Kubernetes, 4+ years DevOps', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),

-- Amazon (3 jobs)
('Software Development Engineer', 'software-development-engineer-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 1, 'Build features for Amazon retail platform', 'Design and code features\nOptimize scalability\nCode reviews', 'Java/Python, Data structures, 2-3 years', 1400000, 2600000, 'INR', 'On-site', NOW(), 0),
('ML Engineer Alexa', 'ml-engineer-alexa-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 2, 'Improve Alexa NLP with machine learning', 'Develop NLP models\nTrain models\nResearch ML techniques', 'Python, Deep Learning, NLP, 3+ years', 1700000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('Android Developer', 'android-developer-amazon', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 8, 'Build Amazon mobile app for millions', 'Develop Android features\nOptimize performance\nMaterial design', 'Kotlin, Android SDK, 3+ years', 1200000, 2200000, 'INR', 'On-site', NOW(), 0),

-- Meta (2 jobs)
('Full Stack Engineer', 'full-stack-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 1, 'Build features for billions of users', 'Develop full-stack features\nClient and server code\nOptimize for scale', 'JavaScript, React, PHP/Python, 4+ years', 2200000, 3800000, 'INR', 'Hybrid', NOW(), 0),
('Security Engineer', 'security-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 10, 'Protect Meta platforms and users', 'Security assessments\nFix vulnerabilities\nIncident response', 'Security, Penetration testing, 4+ years', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),

-- Apple (1 job)
('iOS Developer', 'ios-developer-apple', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://apple.com/careers', 5, 8, 'Build innovative iOS applications at Apple', 'Develop iOS apps\nImplement UI/UX\nOptimize performance', 'Swift, iOS SDK, UIKit, 3+ years', 2000000, 3500000, 'INR', 'On-site', NOW(), 0),

-- Netflix (1 job)
('Backend Engineer Streaming', 'backend-engineer-streaming-netflix', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://jobs.netflix.com', 6, 7, 'Build Netflix streaming infrastructure', 'Design scalable APIs\nOptimize video delivery\nManage microservices', 'Java/Node.js, Microservices, 4+ years', 2500000, 4200000, 'INR', 'Hybrid', NOW(), 0),

-- Adobe (1 job)
('UI/UX Designer', 'uiux-designer-adobe', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://adobe.com/careers', 7, 9, 'Design for Adobe Creative Cloud', 'Create wireframes\nUser research\nDesign UI components', 'Figma, Adobe XD, User research, 3+ years', 1400000, 2600000, 'INR', 'Hybrid', NOW(), 0),

-- Salesforce (1 job)
('Salesforce Developer', 'salesforce-developer-salesforce', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://salesforce.com/careers', 8, 1, 'Customize Salesforce CRM platform', 'Develop Apex code\nBuild Lightning components\nIntegrate systems', 'Salesforce, Apex, Lightning, 2+ years', 1000000, 1800000, 'INR', 'Remote', NOW(), 0),

-- Infosys (1 job)
('Full Stack Developer', 'full-stack-developer-infosys', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://infosys.com/careers', 9, 1, 'Build web applications for global clients', 'Develop React frontends\nSpring Boot APIs\nDeploy to cloud', 'React, Spring Boot, MySQL, 2-4 years', 800000, 1500000, 'INR', 'On-site', NOW(), 0),

-- TCS (1 job)
('DevOps Engineer', 'devops-engineer-tcs', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://tcs.com/careers', 10, 5, 'Automate infrastructure and deployments', 'Build CI/CD pipelines\nManage Kubernetes\nOptimize cloud costs', 'Jenkins, Docker, Kubernetes, 3-5 years', 900000, 1700000, 'INR', 'Hybrid', NOW(), 0),

-- Wipro (1 job)
('Java Developer', 'java-developer-wipro', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://wipro.com/careers', 11, 7, 'Develop enterprise Java applications', 'Write Java code\nDesign databases\nIntegrate APIs', 'Java, Spring, SQL, 3+ years', 700000, 1400000, 'INR', 'On-site', NOW(), 0),

-- Accenture (1 job)
('Technology Consultant', 'technology-consultant-accenture', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://accenture.com/careers', 12, 1, 'Provide tech consulting to Fortune 500', 'Analyze client needs\nDesign solutions\nLead implementations', 'Consulting, Technology, MBA/BTech', 1200000, 2200000, 'INR', 'Hybrid', NOW(), 0),

-- Oracle (1 job)
('Database Administrator', 'database-administrator-oracle', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://oracle.com/careers', 13, 7, 'Manage Oracle databases for enterprises', 'Optimize performance\nEnsure availability\nImplement backups', 'Oracle DB, SQL, PL/SQL, 4+ years', 1100000, 2000000, 'INR', 'On-site', NOW(), 0),

-- IBM (1 job)
('Data Engineer', 'data-engineer-ibm', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://ibm.com/careers', 14, 2, 'Build data pipelines for AI and analytics', 'Design ETL pipelines\nBig data tools\nOptimize processing', 'Python, Spark, SQL, Cloud, 3+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),

-- Deloitte (1 job)
('Business Analyst', 'business-analyst-deloitte', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://deloitte.com/careers', 15, 4, 'Analyze business processes for transformation', 'Gather requirements\nProcess mapping\nData analysis', 'Business analysis, SQL, Excel, 2-4 years', 900000, 1600000, 'INR', 'Hybrid', NOW(), 0),

-- Additional variety jobs
('React Native Developer', 'react-native-developer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 8, 'Build cross-platform mobile apps', 'Develop mobile apps\nShare code iOS/Android\nNative modules', 'React Native, JavaScript, 3+ years', 1600000, 2800000, 'INR', 'Hybrid', NOW(), 0),
('Python Backend Developer', 'python-backend-developer-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Build Python microservices', 'Design APIs\nDatabase optimization\nAsync processing', 'Python, Django/Flask, 3+ years', 1800000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('Site Reliability Engineer', 'site-reliability-engineer-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 5, 'Ensure system reliability at scale', 'Monitor systems\nIncident management\nAutomation scripts', 'Linux, Scripting, Monitoring, 4+ years', 1600000, 2800000, 'INR', 'On-site', NOW(), 0);

-- Step 4: Insert Blog Posts (10 articles)
INSERT INTO blog_posts (title, slug, author_name, content, excerpt, published, published_at, created_at, updated_at) VALUES
('Top 10 Interview Tips for Tech Jobs 2025', 'top-10-interview-tips-2025', 'JobFresh Team',
'Landing your dream tech job requires preparation. Here are our top 10 proven tips for acing technical interviews in 2025.',
'Master your next tech interview with these expert strategies.',
1, NOW(), NOW(), NOW()),

('Complete Guide to Learning Data Science', 'complete-guide-data-science', 'Priya Sharma',
'Data science is one of the hottest careers in tech. This comprehensive guide covers everything from basics to advanced ML.',
'Your complete roadmap to becoming a data scientist in 2025.',
1, NOW(), NOW(), NOW()),

('AWS vs Azure vs GCP: Cloud Platform Comparison', 'aws-vs-azure-vs-gcp', 'Rahul Kumar',
'Choosing the right cloud platform is crucial for your career. We compare AWS, Azure, and Google Cloud in detail.',
'Detailed comparison to help you choose the right cloud platform.',
1, NOW(), NOW(), NOW()),

('How to Negotiate Your Tech Salary Like a Pro', 'negotiate-tech-salary', 'Amit Patel',
'Salary negotiation can increase your compensation by 10-30%. Learn proven strategies from hiring managers.',
'Expert strategies to negotiate higher tech salaries.',
1, NOW(), NOW(), NOW()),

('React vs Vue vs Angular in 2025', 'react-vs-vue-vs-angular-2025', 'Sarah Johnson',
'Frontend frameworks evolve rapidly. Which one should you learn in 2025? We analyze all three.',
'Compare React, Vue, and Angular to choose the best framework.',
1, NOW(), NOW(), NOW()),

('Breaking into Product Management from Engineering', 'breaking-into-product-management', 'Anjali Verma',
'Many engineers aspire to become PMs. Here is your step-by-step roadmap to make the transition successfully.',
'Complete guide for engineers transitioning to PM roles.',
1, NOW(), NOW(), NOW()),

('The Complete DevOps Engineer Roadmap 2025', 'devops-engineer-roadmap-2025', 'Karthik Reddy',
'DevOps is essential for modern software delivery. Learn what skills you need to become a DevOps engineer.',
'Your complete learning path to DevOps engineering.',
1, NOW(), NOW(), NOW()),

('Remote Work Best Practices for Developers', 'remote-work-best-practices-developers', 'JobFresh Team',
'Remote work is the new normal. Master these best practices to stay productive and advance your career.',
'Essential tips and tools for remote software developers.',
1, NOW(), NOW(), NOW()),

('Machine Learning Career Guide 2025', 'machine-learning-career-guide-2025', 'Dr. Ravi Shankar',
'ML is transforming every industry. Learn how to build a successful career in this exciting and growing field.',
'Complete guide to starting your ML engineering career.',
1, NOW(), NOW(), NOW()),

('Top Tech Companies Hiring in India 2025', 'top-tech-companies-hiring-india-2025', 'JobFresh Team',
'These companies are actively hiring in India and offer excellent growth opportunities and compensation.',
'Best tech companies to work for in India in 2025.',
1, NOW(), NOW(), NOW());

-- Step 5: Insert Static Pages (5 pages)
INSERT INTO page_contents (slug, title, content, published, created_at, updated_at) VALUES
('about', 'About JobFresh', 
'JobFresh is India''s premier job portal connecting talented tech professionals with opportunities at leading companies. We focus on quality over quantity.',
1, NOW(), NOW()),

('privacy', 'Privacy Policy',
'We protect your personal information. Learn how JobFresh collects, uses, and safeguards your data.',
1, NOW(), NOW()),

('terms', 'Terms of Service',
'By using JobFresh, you agree to our terms of service. Please read these terms carefully before using our platform.',
1, NOW(), NOW()),

('contact', 'Contact Us',
'Get in touch with the JobFresh team. Email: info@jobfresh.com | Phone: +91-80-1234-5678',
1, NOW(), NOW()),

('faq', 'Frequently Asked Questions',
'Find answers to common questions about using JobFresh, applying for jobs, and more.',
1, NOW(), NOW());

-- Verification
SELECT '=== DATA IMPORT COMPLETE ===' AS Status;
SELECT COUNT(*) AS Total_Companies FROM companies;
SELECT COUNT(*) AS Total_Categories FROM job_categories;
SELECT COUNT(*) AS Total_Jobs FROM job_postings WHERE deleted = 0;
SELECT COUNT(*) AS Total_Blogs FROM blog_posts;
SELECT COUNT(*) AS Total_Pages FROM page_contents;

-- Sample data check
SELECT CONCAT(title, ' at ', (SELECT name FROM companies WHERE id = job_postings.company_id)) AS Sample_Jobs
FROM job_postings LIMIT 5;
