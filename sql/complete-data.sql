-- ============================================
-- JobFresh Complete Database - Production Data
-- All tables populated with realistic content
-- ============================================

USE jobboard;

-- Clear existing data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE job_postings;
TRUNCATE TABLE companies;
TRUNCATE TABLE job_categories;
TRUNCATE TABLE blog_posts;
TRUNCATE TABLE blog_tags;
TRUNCATE TABLE page_contents;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- COMPANIES (15 Top Companies)
-- ============================================

INSERT INTO companies (name, slug, website, logo_url, about, created_at, updated_at) VALUES
('Google', 'google', 'https://careers.google.com', 'https://logo.clearbit.com/google.com', 
'Google is a global technology leader in search, advertising, cloud computing, and AI.', NOW(), NOW()),

('Microsoft', 'microsoft', 'https://careers.microsoft.com', 'https://logo.clearbit.com/microsoft.com',
'Microsoft develops, licenses, and supports software, services, and devices worldwide.', NOW(), NOW()),

('Amazon', 'amazon', 'https://amazon.jobs', 'https://logo.clearbit.com/amazon.com',
'Amazon is the world''s largest online retailer and a leader in cloud computing.', NOW(), NOW()),

('Meta', 'meta', 'https://www.metacareers.com', 'https://logo.clearbit.com/meta.com',
'Meta builds technologies that help people connect, find communities, and grow businesses.', NOW(), NOW()),

('Apple', 'apple', 'https://www.apple.com/careers', 'https://logo.clearbit.com/apple.com',
'Apple designs and manufactures consumer electronics, software, and online services.', NOW(), NOW()),

('Netflix', 'netflix', 'https://jobs.netflix.com', 'https://logo.clearbit.com/netflix.com',
'Netflix is the world''s leading streaming entertainment service.', NOW(), NOW()),

('Adobe', 'adobe', 'https://www.adobe.com/careers', 'https://logo.clearbit.com/adobe.com',
'Adobe is changing the world through digital experiences.', NOW(), NOW()),

('Salesforce', 'salesforce', 'https://www.salesforce.com/company/careers', 'https://logo.clearbit.com/salesforce.com',
'Salesforce is the global leader in CRM and enterprise cloud computing.', NOW(), NOW()),

('Infosys', 'infosys', 'https://www.infosys.com/careers', 'https://logo.clearbit.com/infosys.com',
'Infosys is a global leader in next-generation digital services and consulting.', NOW(), NOW()),

('TCS', 'tcs', 'https://www.tcs.com/careers', 'https://logo.clearbit.com/tcs.com',
'Tata Consultancy Services is an IT services and consulting leader.', NOW(), NOW()),

('Wipro', 'wipro', 'https://careers.wipro.com', 'https://logo.clearbit.com/wipro.com',
'Wipro is a leading global IT, consulting and business process services company.', NOW(), NOW()),

('Accenture', 'accenture', 'https://www.accenture.com/in-en/careers', 'https://logo.clearbit.com/accenture.com',
'Accenture is a global professional services company with leading capabilities.', NOW(), NOW()),

('Oracle', 'oracle', 'https://www.oracle.com/careers', 'https://logo.clearbit.com/oracle.com',
'Oracle offers integrated cloud applications and platform services.', NOW(), NOW()),

('IBM', 'ibm', 'https://www.ibm.com/careers', 'https://logo.clearbit.com/ibm.com',
'IBM is a global technology and innovation company.', NOW(), NOW()),

('Deloitte', 'deloitte', 'https://www2.deloitte.com/in/en/careers.html', 'https://logo.clearbit.com/deloitte.com',
'Deloitte provides audit, consulting, tax, and advisory services.', NOW(), NOW());

-- ============================================
-- JOB CATEGORIES (10 Categories)
-- ============================================

INSERT INTO job_categories (name, slug, intro_text, seo_title, seo_description, created_at, updated_at) VALUES
('Software Development', 'software-development',
'Build the future with code. Software developers create applications that power the digital world.',
'Software Developer Jobs in India - JobFresh',
'Find latest software development jobs. Opportunities in Java, Python, JavaScript, and more.',
NOW(), NOW()),

('Data Science & Analytics', 'data-science',
'Turn data into insights. Data scientists use ML and statistics to solve business problems.',
'Data Science Jobs in India - JobFresh',
'Explore data science and analytics positions. ML, AI, and big data opportunities.',
NOW(), NOW()),

('Cloud Engineering', 'cloud-engineering',
'Build scalable cloud infrastructure. Cloud engineers design and manage cloud solutions.',
'Cloud Engineer Jobs - AWS, Azure, GCP - JobFresh',
'Discover cloud computing jobs. Work with AWS, Azure, Google Cloud platforms.',
NOW(), NOW()),

('Product Management', 'product-management',
'Shape product strategy and vision. Product managers guide products from concept to launch.',
'Product Manager Jobs in India - JobFresh',
'Find product management roles. Lead product strategy at top companies.',
NOW(), NOW()),

('DevOps Engineering', 'devops-engineering',
'Automate and optimize. DevOps engineers bridge development and operations.',
'DevOps Engineer Jobs - CI/CD, Kubernetes - JobFresh',
'Latest DevOps positions. Work on automation, CI/CD, and cloud infrastructure.',
NOW(), NOW()),

('Frontend Development', 'frontend-development',
'Create beautiful user interfaces. Frontend developers build what users see and interact with.',
'Frontend Developer Jobs - React, Vue, Angular - JobFresh',
'Frontend development opportunities. Work with React, Vue, Angular frameworks.',
NOW(), NOW()),

('Backend Development', 'backend-development',
'Power the backend systems. Backend developers build APIs and server-side logic.',
'Backend Developer Jobs - Node, Java, Python - JobFresh',
'Backend engineering positions. Build scalable APIs and microservices.',
NOW(), NOW()),

('Mobile Development', 'mobile-development',
'Build mobile experiences. Mobile developers create iOS and Android applications.',
'Mobile Developer Jobs - iOS, Android - JobFresh',
'Mobile app development jobs. React Native, Flutter, Swift, Kotlin opportunities.',
NOW(), NOW()),

('UI/UX Design', 'ui-ux-design',
'Design delightful experiences. UI/UX designers create user-centered digital products.',
'UI/UX Designer Jobs in India - JobFresh',
'UI/UX design positions. Create beautiful, user-friendly interfaces.',
NOW(), NOW()),

('Cybersecurity', 'cybersecurity',
'Protect digital assets. Security engineers safeguard systems and data.',
'Cybersecurity Jobs in India - JobFresh',
'Information security and cybersecurity roles. Protect systems from threats.',
NOW(), NOW());

-- ============================================
-- JOB POSTINGS (30 Detailed Jobs)
-- ============================================

-- Google Jobs (3)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, nice_to_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('Senior Backend Engineer', 'senior-backend-engineer-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com/apply', 1, 7, 
'Build scalable backend systems serving billions of users at Google.', 
'Design and implement distributed systems\nOptimize database performance\nLead technical design reviews\nMentor junior engineers',
'Java/Python/Go, Distributed Systems, SQL/NoSQL, 5+ years backend',
'Kubernetes, gRPC, Bigtable, System Design',
2000000, 3500000, 'INR', 'Hybrid', NOW(), 0),

('Data Scientist - ML', 'data-scientist-ml-google', 'Hyderabad', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com/apply', 1, 2,
'Apply machine learning to solve challenging problems at Google scale.',
'Develop ML models for product recommendations\nAnalyze petabyte-scale datasets\nConduct experiment and A/B tests\nCollaborate with engineering teams',
'Python, TensorFlow/PyTorch, Statistics, 3+ years ML',
'NLP, Computer Vision, MLOps, Research publications',
1800000, 3200000, 'INR', 'On-site', NOW(), 0),

('Frontend Engineer - React', 'frontend-engineer-react-google', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.google.com/apply', 1, 6,
'Create beautiful, performant web experiences for Google products.',
'Build responsive React applications\nOptimize frontend performance\nImplement accessibility standards\nWrite comprehensive tests',
'React, JavaScript/TypeScript, HTML/CSS, 3+ years',
'Next.js, Redux, GraphQL, Performance optimization',
1500000, 2800000, 'INR', 'Hybrid', NOW(), 0);

-- Microsoft Jobs (3)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, nice_to_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('Cloud Solutions Architect', 'cloud-solutions-architect-microsoft', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com/apply', 2, 3,
'Design and implement Azure cloud solutions for enterprise customers.',
'Architect cloud migration strategies\nConduct technical workshops\nProvide pre-sales technical support\nCreate solution blueprints',
'Azure platform, Cloud architecture, Networking, 6+ years',
'Azure certifications, Multi-cloud, Terraform, PowerShell',
1800000, 3200000, 'INR', 'Remote', NOW(), 0),

('Product Manager - AI', 'product-manager-ai-microsoft', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com/apply', 2, 4,
'Drive product strategy for AI-powered Microsoft products.',
'Define product roadmap and vision\nWork with engineering and design teams\nAnalyze user feedback and metrics\nLead go-to-market strategy',
'Product strategy, Analytics, Technical background, 5+ years PM',
'MBA, AI/ML knowledge, B2B SaaS experience',
2500000, 4000000, 'INR', 'Hybrid', NOW(), 0),

('DevOps Engineer - Azure', 'devops-engineer-azure-microsoft', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://careers.microsoft.com/apply', 2, 5,
'Build and maintain CI/CD pipelines for Microsoft products.',
'Implement Azure DevOps pipelines\nManage Kubernetes clusters\nAutomate infrastructure with Terraform\nMonitor system performance',
'Azure, Docker, Kubernetes, CI/CD, 4+ years DevOps',
'Azure DevOps, Helm, Prometheus, GitOps',
1300000, 2400000, 'INR', 'Hybrid', NOW(), 0);

-- Amazon Jobs (3)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, nice_to_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('Software Development Engineer', 'software-development-engineer-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs/apply', 3, 1,
'Build features for Amazon retail platform serving millions daily.',
'Design and code new features\nOptimize for scalability and performance\nParticipate in code reviews\nOn-call production support',
'Java/Python, Data structures, System design, 2-3 years',
'AWS services, Microservices, Distributed systems',
1400000, 2600000, 'INR', 'On-site', NOW(), 0),

('ML Engineer - Alexa', 'ml-engineer-alexa-amazon', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs/apply', 3, 2,
'Improve Alexa''s natural language understanding with ML.',
'Develop NLP models for voice recognition\nTrain and deploy ML models\nOptimize model performance\nResearch new ML techniques',
'Python, Deep Learning, NLP, 3+ years ML',
'PyTorch, Transformers, Multi-lingual models, ASR',
1700000, 3000000, 'INR', 'Hybrid', NOW(), 0),

('Mobile Developer - Android', 'mobile-developer-android-amazon', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://amazon.jobs/apply', 3, 8,
'Build Amazon mobile app used by millions of shoppers.',
'Develop Android features\nOptimize app performance\nImplement material design\nWrite automated tests',
'Kotlin, Android SDK, MVVM, 3+ years Android',
'Jetpack Compose, Coroutines, Room, Retrofit',
1200000, 2200000, 'INR', 'On-site', NOW(), 0);

-- Meta Jobs (2)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, nice_to_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('Full Stack Engineer', 'full-stack-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com/apply', 4, 1,
'Build features connecting billions on Facebook, Instagram, WhatsApp.',
'Develop full-stack features\nWrite server and client code\nOptimize for billions of users\nCollaborate across teams',
'JavaScript, React, PHP/Python, Databases, 4+ years',
'GraphQL, React Native, Hack, Large-scale systems',
2200000, 3800000, 'INR', 'Hybrid', NOW(), 0),

('Security Engineer', 'security-engineer-meta', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://metacareers.com/apply', 4, 10,
'Protect Meta platforms and billions of users worldwide.',
'Conduct security assessments\nIdentify and fix vulnerabilities\nBuild security tools\nRespond to incidents',
'Security principles, Penetration testing, 4+ years',
'Bug bounty, Cryptography, Threat modeling',
1800000, 3200000, 'INR', 'On-site', NOW(), 0);

-- Additional Companies (Shorter entries for variety)
INSERT INTO job_postings (title, slug, location, remote, job_type, status, application_link, company_id, category_id, role_summary, responsibilities, must_have_skills, salary_min, salary_max, currency, work_mode, posted_at, deleted) VALUES
('iOS Developer', 'ios-developer-apple', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://apple.com/careers/apply', 5, 8,
'Build innovative iOS applications at Apple.', 'Develop iOS apps\nImplement UI/UX designs\nOptimize performance\nCollaborate with designers', 'Swift, iOS SDK, UIKit, 3+ years', 2000000, 3500000, 'INR', 'On-site', NOW(), 0),

('Backend Engineer - Streaming', 'backend-engineer-streaming-netflix', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://jobs.netflix.com/apply', 6, 7,
'Build Netflix streaming infrastructure.', 'Design scalable APIs\nOptimize video delivery\nManage microservices\nMonitor performance', 'Java/Node.js, Microservices, AWS, 4+ years', 2500000, 4200000, 'INR', 'Hybrid', NOW(), 0),

('UI/UX Designer', 'ui-ux-designer-adobe', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://adobe.com/careers/apply', 7, 9,
'Design beautiful experiences for Adobe Creative Cloud.', 'Create wireframes and prototypes\nConduct user research\nDesign UI components\nCollaborate with PMs', 'Figma, Adobe XD, User research, 3+ years', 1400000, 2600000, 'INR', 'Hybrid', NOW(), 0),

('Salesforce Developer', 'salesforce-developer-salesforce', 'Hyderabad', 1, 'Full-time', 'PUBLISHED', 'https://salesforce.com/careers/apply', 8, 1,
'Customize and extend Salesforce CRM platform.', 'Develop Apex code\nBuild Lightning components\nIntegrate systems\nCustomize workflows', 'Salesforce, Apex, Lightning, 2+ years', 1000000, 1800000, 'INR', 'Remote', NOW(), 0),

('Full Stack Developer', 'full-stack-developer-infosys', 'Pune', 0, 'Full-time', 'PUBLISHED', 'https://infosys.com/careers/apply', 9, 1,
'Build modern web applications for global clients.', 'Develop React frontends\nCreate Spring Boot APIs\nDeploy to cloud\nWrite tests', 'React, Spring Boot, MySQL, 2-4 years', 800000, 1500000, 'INR', 'On-site', NOW(), 0),

('DevOps Engineer', 'devops-engineer-tcs', 'Chennai', 0, 'Full-time', 'PUBLISHED', 'https://tcs.com/careers/apply', 10, 5,
'Automate infrastructure and deployments.', 'Build CI/CD pipelines\nManage Kubernetes\nOptimize costs\nMonitor systems', 'Jenkins, Docker, Kubernetes, 3-5 years', 900000, 1700000, 'INR', 'Hybrid', NOW(), 0),

('Java Developer', 'java-developer-wipro', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://wipro.com/careers/apply', 11, 7,
'Develop enterprise Java applications.', 'Write Java code\nDesign databases\nIntegrate APIs\nDebug issues', 'Java, Spring, SQL, 3+ years', 700000, 1400000, 'INR', 'On-site', NOW(), 0),

('Consultant - Tech', 'consultant-tech-accenture', 'Mumbai', 0, 'Full-time', 'PUBLISHED', 'https://accenture.com/careers/apply', 12, 1,
'Provide technology consulting to Fortune 500 clients.', 'Analyze client needs\nDesign solutions\nLead implementations\nManage stakeholders', 'Consulting, Technology, Communication, MBA/B.Tech', 1200000, 2200000, 'INR', 'Hybrid', NOW(), 0),

('Database Administrator', 'database-administrator-oracle', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://oracle.com/careers/apply', 13, 7,
'Manage Oracle databases for enterprise clients.', 'Optimize database performance\nEnsure high availability\nImplement backups\nTroubleshoot issues', 'Oracle DB, SQL, PL/SQL, 4+ years', 1100000, 2000000, 'INR', 'On-site', NOW(), 0),

('Data Engineer', 'data-engineer-ibm', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://ibm.com/careers/apply', 14, 2,
'Build data pipelines for AI and analytics.', 'Design ETL pipelines\nWork with big data tools\nOptimize data processing\nEnsure data quality', 'Python, Spark, SQL, Cloud, 3+ years', 1300000, 2400000, 'INR', 'Hybrid', NOW(), 0),

('Business Analyst', 'business-analyst-deloitte', 'Bangalore', 0, 'Full-time', 'PUBLISHED', 'https://deloitte.com/careers/apply', 15, 4,
'Analyze business processes and drive digital transformation.', 'Gather requirements\nCreate process maps\nAnalyze data\nPresent recommendations', 'Business analysis, SQL, Excel, 2-4 years', 900000, 1600000, 'INR', 'Hybrid', NOW(), 0);

-- ============================================
-- BLOG POSTS (10 Articles)
-- ============================================

INSERT INTO blog_posts (title, slug, author_name, content, excerpt, featured_image_url, published, published_at, created_at, updated_at) VALUES
('Top 10 Interview Tips for Tech Jobs in 2025', 'top-10-interview-tips-2025', 'JobFresh Team',
'Landing your dream tech job requires more than just technical skills. Here are our top 10 tips...',
'Master your next tech interview with these proven strategies from industry experts.',
'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2', 1, NOW(), NOW(), NOW()),

('Complete Guide to Learning Data Science', 'complete-guide-data-science', 'Priya Sharma',
'Data science is one of the hottest careers. This comprehensive guide will help you get started...',
'Everything you need to know to break into data science, from basics to advanced topics.',
'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 1, NOW(), NOW(), NOW()),

('AWS vs Azure vs GCP: Which Cloud is Right for You?', 'aws-vs-azure-vs-gcp', 'Rahul Kumar',
'Choosing the right cloud platform is crucial. Let''s compare the big three...',
'Detailed comparison of AWS, Azure, and Google Cloud to help you choose.',
'https://images.unsplash.com/photo-1544197150-b99a580bb7a8', 1, NOW(), NOW(), NOW()),

('How to Negotiate Your Tech Salary', 'negotiate-tech-salary', 'Amit Patel',
'Salary negotiation can increase your earnings significantly. Here''s how to do it right...',
'Expert strategies to negotiate higher compensation in tech roles.',
'https://images.unsplash.com/photo-1554224155-6726b3ff858f', 1, NOW(), NOW(), NOW()),

('React vs Vue vs Angular in 2025', 'react-vs-vue-vs-angular', 'Sarah Johnson',
'Frontend frameworks continue to evolve. Which one should you learn in 2025?',
'Compare React, Vue, and Angular to choose the best framework for your career.',
'https://images.unsplash.com/photo-1633356122544-f134324a6cee', 1, NOW(), NOW(), NOW()),

('Breaking into Product Management from Engineering', 'breaking-into-product-management', 'Anjali Verma',
'Many engineers aspire to become PMs. Here''s your roadmap to making the transition...',
'Step-by-step guide for engineers transitioning to product management roles.',
'https://images.unsplash.com/photo-1552664730-d307ca884978', 1, NOW(), NOW(), NOW()),

('The DevOps Engineer Roadmap 2025', 'devops-engineer-roadmap-2025', 'Karthik Reddy',
'DevOps is essential for modern software delivery. Here''s what you need to learn...',
'Complete learning path to become a DevOps engineer in 2025.',
'https://images.unsplash.com/photo-1618401471353-b98afee0b2eb', 1, NOW(), NOW(), NOW()),

('Remote Work Best Practices for  Developers', 'remote-work-best-practices', 'JobFresh Team',
'Remote work is here to stay. Here are our best practices for staying productive...',
'Tips and tools to excel as a remote software developer.',
'https://images.unsplash.com/photo-1588196749597-9ff075ee6b5b', 1, NOW(), NOW(), NOW()),

('Machine Learning Career Guide 2025', 'machine-learning-career-guide', 'Dr. Ravi Shankar',
'ML is transforming industries. Here''s how to build a career in this exciting field...',
'Your complete guide to starting and growing an ML engineering career.',
'https://images.unsplash.com/photo-1555949963-aa79dcee981c', 1, NOW(), NOW(), NOW()),

('Top Tech Companies Hiring in India 2025', 'top-tech-companies-hiring-india', 'JobFresh Team',
'These companies are actively hiring and offering great opportunities in India...',
'List of top tech companies with the best hiring prospects in 2025.',
'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab', 1, NOW(), NOW(), NOW());

-- ============================================
-- STATIC PAGES (5 Pages)
-- ============================================

INSERT INTO page_contents (slug, title, content, meta_description, published, created_at, updated_at) VALUES
('about', 'About JobFresh', 
'# About JobFresh\n\nJobFresh is India''s leading job portal connecting talented professionals with opportunities at top companies.\n\n## Our Mission\nTo make job searching easier, faster, and more transparent.\n\n## What We Offer\n- Curated job listings from verified companies\n- Detailed company profiles and reviews\n- Career guidance and interview tips\n- Salary insights and trends\n\n## Why Choose JobFresh?\n- **Quality over Quantity**: We focus on genuine opportunities\n- **Detailed Information**: Complete job descriptions with salary ranges\n- **Easy Application**: Apply directly without complicated forms\n- **Free for Job Seekers**: All features completely free\n\nJoin thousands of professionals who found their dream jobs through JobFresh.',
'Learn about JobFresh - India''s trusted job portal for tech professionals.',
1, NOW(), NOW()),

('privacy', 'Privacy Policy',
'# Privacy Policy\n\nLast updated: December 2025\n\n## Information We Collect\nWe collect information you provide when creating an account, applying for jobs, or using our services.\n\n## How We Use Your Information\n- To match you with relevant job opportunities\n- To improve our services\n- To communicate about your applications\n- To send job alerts (if opted in)\n\n## Data Security\nWe use industry-standard security measures to protect your personal information.\n\n## Your Rights\nYou can access, update, or delete your data at any time.\n\n## Cookies\nWe use cookies to improve user experience and analyze site traffic.\n\n## Contact Us\nFor privacy concerns, email us at privacy@jobfresh.com',
'JobFresh privacy policy - How we protect and use your data.',
1, NOW(), NOW()),

('terms', 'Terms of Service',
'# Terms of Service\n\nWelcome to JobFresh. By using our platform, you agree to these terms.\n\n## User Accounts\n- You must provide accurate information\n- Keep your password secure\n- You are responsible for your account activity\n\n## Job Listings\n- All jobs are posted by employers\n- We verify companies but cannot guarantee accuracy\n- Report suspicious listings immediately\n\n## User Conduct\n- Do not post false information\n- Respect other users and companies\n- Do not spam or abuse the platform\n\n## Intellectual Property\nAll content on JobFresh is protected by copyright.\n\n## Liability\nJobFresh is a platform connecting job seekers and employers. We are not responsible for hiring decisions.\n\n## Changes to Terms\nWe may update these terms. Continued use means acceptance.',
'JobFresh terms of service and user agreement.',
1, NOW(), NOW()),

('contact', 'Contact Us',
'# Contact JobFresh\n\nWe''re here to help!\n\n## General Inquiries\nEmail: info@jobfresh.com\nPhone: +91-80-1234-5678\n\n## For Job Seekers\nHave questions about jobs or your application?\nEmail: support@jobfresh.com\n\n## For Employers\nWant to post jobs or partner with us?\nEmail: employers@jobfresh.com\n\n## Press & Media\nMedia inquiries and press releases:\nEmail: press@jobfresh.com\n\n## Office Location\nJobFresh Technologies Pvt Ltd\nKoramangala, Bangalore 560034\nIndia\n\n## Business Hours\nMonday - Friday: 9:00 AM - 6:00 PM IST\nSaturday: 10:00 AM - 4:00 PM IST\nSunday: Closed\n\n## Follow Us\n- Twitter: @jobfresh\n- LinkedIn: /company/jobfresh\n- Instagram: @jobfresh.india',
'Get in touch with JobFresh team for support, partnerships, or general inquiries.',
1, NOW(), NOW()),

('faq', 'Frequently Asked Questions',
'# FAQ\n\n## General\n\n**Q: Is JobFresh free?**\nA: Yes, JobFresh is completely free for job seekers.\n\n**Q: How do I apply for jobs?**\nA: Click on any job listing and use the "Apply" button to be redirected to the company''s application page.\n\n**Q: How often are new jobs posted?**\nA: We add new jobs daily from verified companies.\n\n## For Job Seekers\n\n**Q: Do I need to create an account?**\nA: No, you can browse and apply without an account. However, creating one lets you save jobs and set alerts.\n\n**Q: How do I get job alerts?**\nA: Create an account, go to settings, and enable email notifications for your preferred categories.\n\n**Q: Are salary ranges accurate?**\nA: We display salary information provided by companies. Actual offers may vary based on experience.\n\n## For Employers\n\n**Q: How can I post jobs?**\nA: Contact employers@jobfresh.com to learn about our job posting packages.\n\n**Q: Do you verify candidates?**\nA: Candidates apply directly. You handle the verification and hiring process.',
'Frequently asked questions about using JobFresh platform.',
1, NOW(), NOW());

-- Verify data
SELECT 'Companies:', COUNT(*) FROM companies;
SELECT 'Categories:', COUNT(*) FROM job_categories;
SELECT 'Jobs:', COUNT(*) FROM job_postings;
SELECT 'Blogs:', COUNT(*) FROM blog_posts;
SELECT 'Pages:', COUNT(*) FROM page_contents;

COMMIT;
