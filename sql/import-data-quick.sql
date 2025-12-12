-- Quick import script - focuses on essential data
USE jobboard;

-- Companies (15)
INSERT INTO companies (name, slug, website, about) VALUES
('Google', 'google', 'https://careers.google.com', 'Global technology leader'),
('Microsoft', 'microsoft', 'https://careers.microsoft.com', 'Software and cloud services'),
('Amazon', 'amazon', 'https://amazon.jobs', 'E-commerce and cloud computing'),
('Meta', 'meta', 'https://metacareers.com', 'Social media and technology'),
('Apple', 'apple', 'https://apple.com/careers', 'Consumer electronics and software'),
('Netflix', 'netflix', 'https://jobs.netflix.com', 'Streaming entertainment'),
('Adobe', 'adobe', 'https://adobe.com/careers', 'Creative software solutions'),
('Salesforce', 'salesforce', 'https://salesforce.com/careers', 'CRM and cloud computing'),
('Infosys', 'infosys', 'https://infosys.com/careers', 'IT services and consulting'),
('TCS', 'tcs', 'https://tcs.com/careers', 'IT services and business solutions'),
('Wipro', 'wipro', 'https://wipro.com/careers', 'IT consulting and services'),
('Accenture', 'accenture', 'https://accenture.com/careers', 'Professional services'),
('Oracle', 'oracle', 'https://oracle.com/careers', 'Database and cloud solutions'),
('IBM', 'ibm', 'https://ibm.com/careers', 'Technology and consulting'),
('Deloitte', 'deloitte', 'https://deloitte.com/careers', 'Audit and consulting');

-- Categories (10)
INSERT INTO job_categories (name, slug) VALUES
('Software Development', 'software-development'),
('Data Science', 'data-science'),
('Cloud Engineering', 'cloud-engineering'),
('Product Management', 'product-management'),
('DevOps Engineering', 'devops-engineering'),
('Frontend Development', 'frontend-development'),
('Backend Development', 'backend-development'),
('Mobile Development', 'mobile-development'),
('UI/UX Design', 'ui-ux-design'),
('Cybersecurity', 'cybersecurity');

-- Jobs (25 varied positions)
INSERT INTO job_postings (title, slug,  location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
-- Google (3)
('Senior Backend Engineer', 'senior-backend-engineer-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Build scalable systems at Google', 'Design distributed systems\nOptimize performance\nMentor engineers', 'Java/Go, Distributed Systems, 5+ years', 2000000, 3500000, 'INR', 'Hybrid', NOW(), 0),
('Data Scientist ML', 'data-scientist-ml-google', 'Hyderabad', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 2, 'Apply ML at Google scale', 'Build ML models\nAnalyze data\nA/B testing', 'Python, TensorFlow, Statistics, 3+ years', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),
('Frontend Engineer React', 'frontend-engineer-react-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 6, 'Create web experiences', 'Build React apps\nOptimize performance\nImplement A11Y', 'React, TypeScript, 3+ years', 1500000, 2800000, 'INR', 'Hybrid', NOW(), 0),

-- Microsoft (3)
('Cloud Architect', 'cloud-architect-microsoft', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 3, 'Design Azure solutions', 'Architect cloud migrations\nTechnical workshops\nCustomer solutions', 'Azure, Cloud architecture, 6+ years', 1800000, 3200000, 'INR', 'Remote', NOW(), 0),
('Product Manager AI', 'product-manager-ai-microsoft', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 4, 'Drive AI products', 'Define roadmap\nWork with teams\nAnalyze metrics', 'Product strategy, Analytics, 5+ years', 2500000, 4000000, 'INR', 'Hybrid', NOW(), 0),
('DevOps Engineer Azure', 'devops-engineer-azure-microsoft', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 5, 'Build CI/CD pipelines', 'Azure DevOps\nKubernetes\nTerraform', 'Azure, Docker, Kubernetes, 4+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),

-- Amazon (3)
('SDE Backend', 'sde-backend-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 1, 'Build Amazon platforms', 'Design features\nOptimize scale\nCode reviews', 'Java/Python, DS&A, 2-3 years', 1400000, 2600000, 'INR', 'On-site', NOW(), 0),
('ML Engineer Alexa', 'ml-engineer-alexa-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 2, 'Improve Alexa NLP', 'Develop NLP models\nTrain models\nResearch ML', 'Python, Deep Learning, NLP, 3+ years', 1700000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('Android Developer', 'android-developer-amazon', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 8, 'Build Amazon app', 'Android features\nOptimize performance\nMaterial design', 'Kotlin, Android SDK, 3+ years', 1200000, 2200000, 'INR', 'On-site', NOW(), 0),

-- Meta (2)
('Full Stack Engineer', 'full-stack-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 1, 'Build for billions', 'Full-stack features\nClient and server\nOptimize scale', 'JavaScript, React, PHP, 4+ years', 2200000, 3800000, 'INR', 'Hybrid', NOW(), 0),
('Security Engineer', 'security-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 10, 'Protect platforms', 'Security assessments\nFix vulnerabilities\nIncident response', 'Security, Pentesting, 4+ years', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),

-- More companies (15 varied jobs)
('iOS Developer', 'ios-developer-apple', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://apple.com/careers', 5, 8, 'Build iOS apps', 'Develop apps\nUI/UX implementation\nPerformance tuning', 'Swift, iOS SDK, 3+ years', 2000000, 3500000, 'INR', 'On-site', NOW(), 0),
('Backend Streaming', 'backend-streaming-netflix', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://jobs.netflix.com', 6, 7, 'Netflix infrastructure', 'Scalable APIs\nVideo delivery\nMicroservices', 'Java/Node, Microservices, 4+ years', 2500000, 4200000, 'INR', 'Hybrid', NOW(), 0),
('UI/UX Designer', 'uiux-designer-adobe', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://adobe.com/careers', 7, 9, 'Design for Creative Cloud', 'Wireframes\nUser research\nUI components', 'Figma, Adobe XD, 3+ years', 1400000, 2600000, 'INR', 'Hybrid', NOW(), 0),
('Salesforce Dev', 'salesforce-dev-salesforce', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://salesforce.com/careers', 8, 1, 'Customize Salesforce', 'Apex code\nLightning components\nIntegrations', 'Salesforce, Apex, 2+ years', 1000000, 1800000, 'INR', 'Remote', NOW(), 0),
('Full Stack Dev', 'full-stack-dev-infosys', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://infosys.com/careers', 9, 1, 'Web applications', 'React frontends\nSpring Boot APIs\nCloud deployment', 'React, Spring Boot, 2-4 years', 800000, 1500000, 'INR', 'On-site', NOW(), 0),
('DevOps Engineer', 'devops-engineer-tcs', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://tcs.com/careers', 10, 5, 'Automate deployments', 'CI/CD pipelines\nKubernetes\nMonitoring', 'Jenkins, Docker, Kubernetes, 3-5 years', 900000, 1700000, 'INR', 'Hybrid', NOW(), 0),
('Java Developer', 'java-developer-wipro', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://wipro.com/careers', 11, 7, 'Enterprise Java', 'Java development\nDatabase design\nAPI integration', 'Java, Spring, SQL, 3+ years', 700000, 1400000, 'INR', 'On-site', NOW(), 0),
('Tech Consultant', 'tech-consultant-accenture', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://accenture.com/careers', 12, 1, 'Client solutions', 'Analyze needs\nDesign solutions\nManage projects', 'Consulting, Technology, MBA/BTech', 1200000, 2200000, 'INR', 'Hybrid', NOW(), 0),
('DBA Oracle', 'dba-oracle-oracle', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://oracle.com/careers', 13, 7, 'Manage databases', 'Performance tuning\nHigh availability\nBackup strategy', 'Oracle DB, SQL, 4+ years', 1100000, 2000000, 'INR', 'On-site', NOW(), 0),
('Data Engineer', 'data-engineer-ibm', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://ibm.com/careers', 14, 2, 'Data pipelines', 'ETL pipelines\nBig data tools\nData quality', 'Python, Spark, SQL, 3+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),
('Business Analyst', 'business-analyst-deloitte', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://deloitte.com/careers', 15, 4, 'Process analysis', 'Requirements\nProcess maps\nData analysis', 'Business analysis, SQL, 2-4 years', 900000, 1600000, 'INR', 'Hybrid', NOW(), 0),
('React Native Dev', 'react-native-dev-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 8, 'Cross-platform apps', 'Build mobile apps\nShare code\nNative modules', 'React Native, JavaScript, 3+ years', 1600000, 2800000, 'INR', 'Hybrid', NOW(), 0),
('Python Backend', 'python-backend-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Python services', 'Build APIs\nDatabase optimization\nAsync processing', 'Python, Django/Flask, 3+ years', 1800000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('Site Reliability Engineer', 'sre-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 5, 'Ensure reliability', 'Monitor systems\nIncident management\nAutomation', 'Linux, Scripting, Monitoring, 4+ years', 1600000, 2800000, 'INR', 'On-site', NOW(), 0),
('Technical Writer', 'technical-writer-microsoft', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 1, 'Documentation', 'Write docs\nAPI references\nTutorials', 'Technical writing, 2+ years', 800000, 1400000, 'INR', 'Remote', NOW(), 0);

-- Blog posts (5)
INSERT INTO blog_posts (title, slug, author_name, content, excerpt, published, published_at) VALUES
('Top Interview Tips 2025', 'top-interview-tips-2025', 'JobFresh Team', 'Master tech interviews with these expert tips...', 'Proven strategies for tech interviews', 1, NOW()),
('Data Science Career Guide', 'data-science-career-guide', 'Priya Sharma', 'Complete roadmap to becoming a data scientist...', 'Your path to data science career', 1, NOW()),
('AWS vs Azure vs GCP', 'aws-vs-azure-vs-gcp', 'Rahul Kumar', 'Comparing the top 3 cloud platforms...', 'Cloud platform comparison guide', 1, NOW()),
('Negotiate Tech Salary', 'negotiate-tech-salary', 'Amit Patel', 'Get the compensation you deserve...', 'Salary negotiation strategies', 1, NOW()),
('Remote Work Best Practices', 'remote-work-best-practices', 'JobFresh Team', 'Excel as a remote developer...', 'Tips for productive remote work', 1, NOW());

-- Pages (4)
INSERT INTO page_contents (slug, title, content, published) VALUES
('about', 'About JobFresh', 'JobFresh is India''s leading job portal for tech professionals.', 1),
('privacy', 'Privacy Policy', 'We protect your data. Learn how we handle your information.', 1),
('terms', 'Terms of Service', 'By using JobFresh, you agree to these terms.', 1),
('contact', 'Contact Us', 'Get in touch: info@jobfresh.com', 1);

SELECT 'Data imported successfully!' AS status;
SELECT COUNT(*) AS companies FROM companies;
SELECT COUNT(*) AS categories FROM job_categories;
SELECT COUNT(*) AS jobs FROM job_postings;
SELECT COUNT(*) AS blogs FROM blog_posts;
SELECT COUNT(*) AS pages FROM page_contents;
