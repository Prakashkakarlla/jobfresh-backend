-- Fresh Complete Import for JobFresh
USE jobboard;

-- Companies first
INSERT INTO companies (name, slug, website, about) VALUES
('Google', 'google', 'https://careers.google.com', 'Global technology leader'),
('Microsoft', 'microsoft', 'https://careers.microsoft.com', 'Software and cloud services'),
('Amazon', 'amazon', 'https://amazon.jobs', 'E-commerce and cloud'),
('Meta', 'meta', 'https://metacareers.com', 'Social media and technology'),
('Apple', 'apple', 'https://apple.com/careers', 'Consumer electronics'),
('Netflix', 'netflix', 'https://jobs.netflix.com', 'Streaming entertainment'),
('Adobe', 'adobe', 'https://adobe.com/careers', 'Creative software'),
('Salesforce', 'salesforce', 'https://salesforce.com/careers', 'CRM and cloud'),
('Infosys', 'infosys', 'https://infosys.com/careers', 'IT services'),
('TCS', 'tcs', 'https://tcs.com/careers', 'IT consulting'),
('Wipro', 'wipro', 'https://wipro.com/careers', 'IT services'),
('Accenture', 'accenture', 'https://accenture.com/careers', 'Professional services'),
('Oracle', 'oracle', 'https://oracle.com/careers', 'Database solutions'),
('IBM', 'ibm', 'https://ibm.com/careers', 'Technology services'),
('Deloitte', 'deloitte', 'https://deloitte.com/careers', 'Consulting');

-- Categories next
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

-- Now jobs with correct IDs
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('Senior Backend Engineer', 'senior-backend-engineer-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Build scalable systems', 'Design systems\nOptimize performance', 'Java, Go, 5+ years', 2000000, 3500000, 'INR', 'Hybrid', NOW(), 0),
('Data Scientist ML', 'data-scientist-ml-google', 'Hyderabad', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 2, 'ML at scale', 'Build models\nAnalyze data', 'Python, TensorFlow, 3+ years', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),
('Frontend React', 'frontend-react-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 6, 'Web experiences', 'Build React apps\nOptimize', 'React, TypeScript, 3+ years', 1500000, 2800000, 'INR', 'Hybrid', NOW(), 0),
('Cloud Architect', 'cloud-architect-microsoft', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 3, 'Azure solutions', 'Design cloud\nWorkshops', 'Azure, 6+ years', 1800000, 3200000, 'INR', 'Remote', NOW(), 0),
('Product Manager', 'product-manager-microsoft', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 4, 'AI products', 'Roadmap\nAnalytics', 'Product, 5+ years', 2500000, 4000000, 'INR', 'Hybrid', NOW(), 0),
('DevOps Azure', 'devops-azure-microsoft', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com', 2, 5, 'CI/CD pipelines', 'Azure DevOps\nK8s', 'Azure, Docker, 4+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),
('SDE Backend', 'sde-backend-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 1, 'Amazon retail', 'Build features\nScale', 'Java, DS&A, 2-3 years', 1400000, 2600000, 'INR', 'On-site', NOW(), 0),
('ML Alexa', 'ml-alexa-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 2, 'NLP for Alexa', 'NLP models\nTraining', 'Python, DL, NLP, 3+ years', 1700000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('Android Dev', 'android-dev-amazon', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 8, 'Mobile app', 'Android features\nOptimize', 'Kotlin, Android, 3+ years', 1200000, 2200000, 'INR', 'On-site', NOW(), 0),
('Full Stack', 'full-stack-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 1, 'For billions', 'Full-stack\nScale', 'JS, React, PHP, 4+ years', 2200000, 3800000, 'INR', 'Hybrid', NOW(), 0),
('Security Eng', 'security-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 10, 'Protect platforms', 'Security\nIncidents', 'Security, 4+ years', 1800000, 3200000, 'INR', 'On-site', NOW(), 0),
('iOS Developer', 'ios-apple', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://apple.com/careers', 5, 8, 'iOS apps', 'Build apps\nUI/UX', 'Swift, iOS, 3+ years', 2000000, 3500000, 'INR', 'On-site', NOW(), 0),
('Backend Stream', 'backend-netflix', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://jobs.netflix.com', 6, 7, 'Streaming', 'APIs\nMicroservices', 'Java/Node, 4+ years', 2500000, 4200000, 'INR', 'Hybrid', NOW(), 0),
('UI/UX Designer', 'uiux-adobe', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://adobe.com/careers', 7, 9, 'Design CC', 'Wireframes\nResearch', 'Figma, 3+ years', 1400000, 2600000, 'INR', 'Hybrid', NOW(), 0),
('Salesforce Dev', 'sfdc-salesforce', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://salesforce.com/careers', 8, 1, 'CRM platform', 'Apex\nLightning', 'Salesforce, 2+ years', 1000000, 1800000, 'INR', 'Remote', NOW(), 0),
('Full Stack', 'fullstack-infosys', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://infosys.com/careers', 9, 1, 'Web apps', 'React\nSpring Boot', 'React, Java, 2-4 years', 800000, 1500000, 'INR', 'On-site', NOW(), 0),
('DevOps', 'devops-tcs', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://tcs.com/careers', 10, 5, 'Automation', 'CI/CD\nK8s', 'Jenkins, Docker, 3-5 years', 900000, 1700000, 'INR', 'Hybrid', NOW(), 0),
('Java Dev', 'java-wipro', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://wipro.com/careers', 11, 7, 'Enterprise', 'Java code\nAPIs', 'Java, Spring, 3+ years', 700000, 1400000, 'INR', 'On-site', NOW(), 0),
('Consultant', 'consultant-accenture', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://accenture.com/careers', 12, 1, 'Tech consulting', 'Solutions\nClients', 'Consulting, MBA/BTech', 1200000, 2200000, 'INR', 'Hybrid', NOW(), 0),
('DBA', 'dba-oracle', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://oracle.com/careers', 13, 7, 'Databases', 'Optimize\nBackups', 'Oracle DB, 4+ years', 1100000, 2000000, 'INR', 'On-site', NOW(), 0),
('Data Engineer', 'data-eng-ibm', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://ibm.com/careers', 14, 2, 'Data pipelines', 'ETL\nSpark', 'Python, Spark, 3+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),
('Business Analyst', 'ba-deloitte', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://deloitte.com/careers', 15, 4, 'Process', 'Requirements\nAnalysis', 'BA, SQL, 2-4 years', 900000, 1600000, 'INR', 'Hybrid', NOW(), 0),
('React Native', 'rn-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com', 4, 8, 'Mobile', 'Cross-platform', 'React Native, 3+ years', 1600000, 2800000, 'INR', 'Hybrid', NOW(), 0),
('Python Backend', 'python-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com', 1, 7, 'Services', 'APIs\nOptimize', 'Python, Flask, 3+ years', 1800000, 3000000, 'INR', 'Hybrid', NOW(), 0),
('SRE', 'sre-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs', 3, 5, 'Reliability', 'Monitor\nAutomate', 'Linux, Scripting, 4+ years', 1600000, 2800000, 'INR', 'On-site', NOW(), 0);

-- Blog posts
INSERT INTO blog_posts (title, slug, author_name, content, excerpt, published, published_at) VALUES
('Tech Interview Tips 2025', 'tech-interview-tips-2025', 'JobFresh Team', 'Master interviews...', 'Interview strategies', 1, NOW()),
('Data Science Guide', 'data-science-guide', 'Priya Sharma', 'Complete roadmap...', 'Become a data scientist', 1, NOW()),
('Cloud Comparison', 'cloud-comparison', 'Rahul Kumar', 'AWS vs Azure vs GCP...', 'Choose the right cloud', 1, NOW()),
('Salary Negotiation', 'salary-negotiation', 'Amit Patel', 'Get paid more...', 'Negotiation tactics', 1, NOW()),
('Remote Work Tips', 'remote-work-tips', 'JobFresh Team', 'Work from home...', 'Remote productivity', 1, NOW());

-- Pages
INSERT INTO page_contents (slug, title, content, published) VALUES
('about', 'About', 'JobFresh is India top job portal', 1),
('privacy', 'Privacy', 'We protect your data', 1),
('terms', 'Terms', 'Terms of service', 1),
('contact', 'Contact', 'Email: info@jobfresh.com', 1);

SELECT COUNT(*) FROM companies;
SELECT COUNT(*) FROM job_categories;
SELECT COUNT(*) FROM job_postings;
SELECT COUNT(*) FROM blog_posts;
SELECT COUNT(*) FROM page_contents;
