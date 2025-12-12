-- JobFresh Sample Data - Production Quality
-- Created for comprehensive testing and demonstration

USE jobboard;

-- ============================================
-- 1. COMPANIES (Top Tech Companies)
-- ============================================

INSERT INTO companies (name, slug, website, logo_url, about, work_culture, hiring_process, interview_tips, seo_title, seo_description, created_at, updated_at) VALUES
('Google', 'google', 'https://careers.google.com', 'https://logo.clearbit.com/google.com', 
'Google is a multinational technology company focusing on search engine technology, online advertising, cloud computing, computer software, quantum computing, e-commerce, artificial intelligence, and consumer electronics.',
'At Google, we believe that innovation thrives in an environment of openness, collaboration, and diversity. Our culture encourages creative thinking and promotes employee wellbeing through various programs.',
'Our hiring process typically includes: 1) Resume screening 2) Phone/video screening 3) Technical interviews (2-3 rounds) 4) Hiring committee review 5) Offer discussion',
'Focus on problem-solving skills, brush up on data structures and algorithms, understand Google products, and be ready to discuss your past projects in detail.',
'Google Careers India - Join Google', 'Explore career opportunities at Google India. Work on products that impact billions of users worldwide.',
NOW(), NOW()),

('Microsoft', 'microsoft', 'https://careers.microsoft.com', 'https://logo.clearbit.com/microsoft.com',
'Microsoft is a leading global technology company that develops, licenses, and supports software, services, devices, and solutions.',
'Microsoft culture is built on a growth mindset, diversity and inclusion, and giving back to communities. We empower every person and organization to achieve more.',
'Typical process: 1) Application review 2) Recruiter call 3) Technical assessment 4) On-site/virtual interviews (4-5 rounds) 5) Final decision',
'Demonstrate problem-solving abilities, understand Microsoft technologies, show leadership potential, and be prepared for behavioral questions.',
'Microsoft Careers - Opportunities in India', 'Join Microsoft India and work on cutting-edge technology that empowers billions worldwide.',
NOW(), NOW()),

('Amazon', 'amazon', 'https://amazon.jobs', 'https://logo.clearbit.com/amazon.com',
'Amazon is guided by four principles: customer obsession, passion for invention, commitment to operational excellence, and long-term thinking.',
'Amazon culture is driven by Leadership Principles. We hire and develop the best, maintain high standards, and think big.',
'Amazon hiring: 1) Online application 2) Phone screen 3) Technical/behavioral interviews 4) Bar raiser interview 5) Offer',
'Study Amazon Leadership Principles, prepare STAR method examples, practice coding problems, and understand Amazons businesses.',
'Amazon Jobs India - Career Opportunities', 'Discover your next career move at Amazon India. We are always inventing on behalf of our customers.',
NOW(), NOW()),

('Infosys', 'infosys', 'https://www.infosys.com/careers', 'https://logo.clearbit.com/infosys.com',
'Infosys is a global leader in next-generation digital services and consulting. We enable clients in more than 50 countries to navigate their digital transformation.',
'At Infosys, we believe in continuous learning, innovation, and sustainability. We invest heavily in employee development and maintaining work-life balance.',
'Hiring stages: 1) Online test 2) Technical interview 3) HR interview 4) Managerial round 5) Background verification',
'Prepare on core concepts, showcase project experience, understand Infosys service offerings, and demonstrate eagerness to learn.',
'Infosys Careers - Jobs in India', 'Build a rewarding career at Infosys. Join us in navigating the digital future.',
NOW(), NOW()),

('TCS', 'tcs', 'https://www.tcs.com/careers', 'https://logo.clearbit.com/tcs.com',
'Tata Consultancy Services is an IT services, consulting and business solutions organization that partners with many of the worlds largest businesses.',
'TCS values integrity, excellence, respect, and purposefulness. We foster a culture of innovation and continuous improvement.',
'TCS process: 1) Written test (aptitude + technical) 2) Technical interview 3) Managerial interview 4) HR round',
'Focus on fundamentals, be honest about your skills, research TCS projects and values, prepare examples from your experience.',
'TCS Careers - IT Jobs in India', 'Explore exciting career opportunities at TCS. Be part of transforming businesses through technology.',
NOW(), NOW());

-- ============================================
-- 2. JOB CATEGORIES
-- ============================================

INSERT INTO job_categories (name, slug, intro_text, career_guide, faq, seo_title, seo_description, created_at, updated_at) VALUES
('Software Development', 'software-development',
'Software developers design, create, test, and maintain software applications and systems that power our digital world.',
'Career Path: Junior Developer → Senior Developer → Tech Lead → Engineering Manager / Principal Engineer. 
Skills Needed: Programming languages (Java, Python, JavaScript), algorithms, databases, system design, version control.
Average Salary: ₹3-25 LPA depending on experience',
'Q: What skills do I need? A: Core programming, problem-solving, data structures, and algorithms.
Q: Is a degree required? A: While helpful, many companies now hire based on skills and portfolio.
Q: How long to become senior? A: Typically 4-6 years with consistent learning.',
'Software Development Jobs in India', 'Find the latest software development jobs. Browse opportunities for Java, Python, full-stack developers.',
NOW(), NOW()),

('Data Science', 'data-science',
'Data scientists analyze complex datasets to extract insights and help organizations make data-driven decisions.',
'Career Path: Data Analyst → Data Scientist → Senior Data Scientist → Lead Data Scientist / Data Science Manager.
Skills: Python/R, SQL, machine learning, statistics, data visualization, big data tools.
Average Salary: ₹4-30 LPA',
'Q: Need a PhD? A: Not mandatory. Masters or strong  portfolio works fine.
Q: Math requirements? A: Statistics and linear algebra are important.
Q: Tools to learn? A: Python, SQL, Tableau, TensorFlow/PyTorch.',
'Data Science Jobs in India', 'Explore data science opportunities. Find jobs in machine learning, AI, and analytics.',
NOW(), NOW()),

('Cloud Engineering', 'cloud-engineering',
'Cloud engineers design, implement, and manage cloud infrastructure and services for scalable applications.',
'Career Path: Cloud Developer → Cloud Engineer → Cloud Architect → Cloud Solutions Architect.
Skills: AWS/Azure/GCP, Docker, Kubernetes, DevOps, networking, security.
Average Salary: ₹5-28 LPA',
'Q: Which cloud to learn? A: Start with AWS as its most popular, then expand.
Q: Certifications needed? A: Not mandatory but AWS/Azure certs are valuable.
Q: DevOps vs Cloud? A: Overlapping but Cloud focuses on infrastructure.',
'Cloud Engineering Jobs', 'Find cloud computing jobs. Opportunities in AWS, Azure, Google Cloud Platform.',
NOW(), NOW()),

('Product Management', 'product-management',
'Product managers guide product strategy, development, and launch, bridging business, technology, and user experience.',
'Career Path: Associate PM → PM → Senior PM → Group PM → Director of Product.
Skills: Strategy, analytics, communication, user research, technical knowledge, roadmapping.
Average Salary: ₹8-40 LPA',
'Q: Need tech background? A: Helpful but not mandatory. Understanding technology is key.
Q: MBA required? A: Not always. Many PMs come from engineering or business backgrounds.
Q: How to start? A: Build products, work cross-functionally, take on PM responsibilities.',
'Product Management Jobs in India', 'Discover product manager opportunities. Lead product strategy at top companies.',
NOW(), NOW()),

('DevOps Engineering', 'devops-engineering',
'DevOps engineers streamline software development and deployment through automation, CI/CD, and infrastructure management.',
'Career Path: DevOps Engineer → Senior DevOps → DevOps Architect → Director of Engineering.
Skills: Linux, scripting, CI/CD, Docker, Kubernetes, cloud platforms, monitoring.
Average Salary: ₹4-25 LPA',
'Q: Coding required? A: Yes, scripting is essential (Python, Bash, Go).
Q: Cloud knowledge? A: Crucial. Learn at least one cloud platform deeply.
Q: Difference from SysAdmin? A: DevOps focuses on automation and continuous delivery.',
'DevOps Jobs in India', 'Find DevOps engineer positions. Work on CI/CD, automation, and cloud infrastructure.',
NOW(), NOW());

-- ============================================
-- 3. JOB POSTINGS (Comprehensive Examples)
-- ============================================

-- Job 1: Google - Senior Software Engineer
INSERT INTO job_postings (
    title, slug, location, remote, job_type, status, application_link,
    company_id, category_id, role_summary, responsibilities, must_have_skills,
    nice_to_have_skills, tools_and_technologies, faqs,
    salary_min, salary_max, currency, salary_type, pay_frequency, benefits_summary, additional_perks,
    work_mode, office_location, working_hours, shift_type, weekend_work, travel_required, travel_percentage, work_environment,
    number_of_rounds, rounds_description, expected_decision_days, assignment_required, preparation_tips,
    team_overview, project_domain, tech_stack, career_path, ideal_candidate_profile,
    background_check_required, bond_applicable, bond_duration, notice_period_policy, equal_opportunity_statement,
    seo_title, seo_description, posted_at, expires_at, deleted
) VALUES (
    'Senior Software Engineer - Backend Systems', 'senior-software-engineer-backend-google',
    'Bangalore, Karnataka', false, 'Full-time', 'PUBLISHED',
    'https://careers.google.com/jobs/results/123456',
    1, 1,
    'Join Google''s Search Infrastructure team to build and scale systems that serve billions of queries daily. You''ll work on cutting-edge distributed systems, optimize performance, and solve complex technical challenges.',
    '- Design and implement scalable backend services for Google Search\n- Optimize system performance and reliability\n- Collaborate with cross-functional teams on feature development\n- Mentor junior engineers and lead technical discussions\n- Participate in code reviews and architectural decisions\n- Troubleshoot production issues and implement solutions',
    'Java, Python, or C++; Data structures and algorithms; Distributed systems; SQL and NoSQL databases; REST APIs; System design; 5+ years backend development',
    'Go language; Kubernetes; gRPC; Protocol Buffers; Bigtable; Spanner; Experience with search or recommendation systems; Open source contributions',
    'Java, Spring Boot, MySQL, Redis, Kafka, Docker, Kubernetes, Git, Jenkins, Grafana, Prometheus',
    'Q: What team will I work with? A: Search Infrastructure team, ~20 engineers globally.\nQ: What''s the work culture? A: Collaborative, innovative, with focus on impact.\nQ: Growth opportunities? A: Clear path to Staff Engineer or Team Lead.',
    2000000, 3500000, 'INR', 'Fixed + Variable', 'Annual', 
    'Health insurance for family, Stock options (RSUs), Retirement benefits (EPF, Gratuity), Wellness programs',
    'Free meals, On-site gym, Learning budget ₹50K/year, Flexible work hours, Parental leave 26 weeks, Shuttle service',
    'Hybrid', 'Google Bangalore, RMZ Infinity',  '9 AM - 6 PM (Flexible)', 'Day Shift', 'No', false, 0,
    'Modern office with collaboration spaces, quiet zones, cafeteria, game rooms, and wellness facilities',
    5, '1) Phone screen (45 min coding)\n2) Technical deep dive (60 min)\n3) System design (60 min)\n4) Coding round (60 min)\n5) Googleyness & Leadership', 
    30, true, 'Review data structures, practice system design, understand Google products, prepare project examples using STAR method',
    'Part of Search Infrastructure team reporting to Senior Engineering Manager. Team of 20 engineers working on distributed search systems.',
    'Search, Ads, Cloud Infrastructure', 'Java, C++, Python, Go, Bigtable, Spanner, Kubernetes, gRPC',
    'Senior SWE → Staff SWE → Principal Engineer or Engineering Manager → Senior Manager/Director',
    'Passionate about large-scale systems, strong CS fundamentals, collaborative mindset, proven track record of shipping impactful products',
    true, false, NULL, 'Typically 2-3 months notice, negotiable',
    'Google is an equal opportunity employer. We celebrate diversity and are committed to creating an inclusive environment for all employees.',
    'Senior Software Engineer at Google Bangalore', 'Join Google as Senior Backend Engineer in Bangalore. Work on systems serving billions. Competitive salary ₹20-35 LPA.',
    NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), false
);

-- Job 2: Microsoft - Cloud Solutions Architect
INSERT INTO job_postings (
    title, slug, location, remote, job_type, status, application_link,
    company_id, category_id, role_summary, responsibilities, must_have_skills,
    nice_to_have_skills, tools_and_technologies, faqs,
    salary_min, salary_max, currency, salary_type, pay_frequency, benefits_summary, additional_perks,
    work_mode, office_location, working_hours, shift_type, weekend_work, travel_required, travel_percentage, work_environment,
    number_of_rounds, rounds_description, expected_decision_days, assignment_required, preparation_tips,
    team_overview, project_domain, tech_stack, career_path, ideal_candidate_profile,
    background_check_required, bond_applicable, bond_duration, notice_period_policy, equal_opportunity_statement,
    seo_title, seo_description, posted_at, expires_at, deleted
) VALUES (
    'Cloud Solutions Architect - Azure', 'cloud-solutions-architect-azure-microsoft',
    'Hyderabad, Telangana', true, 'Full-time', 'PUBLISHED',
    'https://careers.microsoft.com/us/en/job/1234567',
    2, 3,
    'Lead cloud transformation initiatives for enterprise customers. Design and implement Azure solutions that meet complex business requirements while ensuring security, scalability, and cost-optimization.',
    '- Design end-to-end Azure cloud solutions for enterprise clients\n- Conduct technical workshops and solution assessments\n- Provide architectural guidance and best practices\n- Collaborate with sales and engineering teams\n- Create technical documentation and architecture diagrams\n- Stay updated with latest Azure services and features',
    'Azure platform expertise; Cloud architecture patterns; Networking and security; Infrastructure as Code; 6+ years in cloud technologies; Strong communication skills',
    'Azure certifications (Solutions Architect Expert); Multi-cloud experience (AWS/GCP); PowerShell/ARM templates; DevOps practices; Enterprise architecture frameworks (TOGAF)',
    'Azure, ARM Templates, Terraform, PowerShell, Azure DevOps, Kubernetes, Docker, Python',
    'Q: Is this customer-facing? A: Yes, you''ll work directly with enterprise customers.\nQ: Travel needed? A: Approximately 20-30% travel to client sites.\nQ: Certifications required? A: Azure Solutions Architect certification preferred within 6 months.',
    1800000, 3200000, 'INR', 'Fixed + Performance Bonus', 'Annual',
    'Comprehensive health coverage, Microsoft stock purchase plan, Performance bonuses, Life and disability insurance',
    'Remote work allowance ₹2K/month, Professional development budget, Microsoft products discount, Gym membership, Annual team offsites',
    'Remote', 'Microsoft Hyderabad (visit as needed)', 'Flexible hours with core hours 10 AM - 4 PM', 'Flexible', 'No', true, 25,
    'Remote-first role with modern collaboration tools. Option to work from Microsoft office with all amenities.',
    4, '1) Recruiter screen (30 min)\n2) Technical interview with architect (90 min)\n3) Customer scenario discussion (60 min)\n4) Final round with hiring manager (45 min)',
    21, false, 'Study Azure well-architected framework, practice solution design scenarios, review Microsoft case studies, prepare to discuss past projects',
    'Azure Customer Success team, 15 architects supporting enterprise clients across India. Report to Senior Cloud Architect.',
    'Cloud Solutions, Digital Transformation, Enterprise Architecture',
    'Azure, Azure DevOps, Terraform, Kubernetes, .NET, Python',
    'Cloud Architect → Senior Cloud Architect → Principal Architect → Cloud Practice Lead',
    'Customer-focused, excellent communicator, deep Azure knowledge, able to translate business needs to technical solutions, thought leader',
    true, false, NULL, 'Standard 60-90 days, flexible based on client commitments',
    'Microsoft is committed to equality of opportunity in employment. We welcome applications from all qualified candidates.',
    'Cloud Solutions Architect - Microsoft Azure Hyderabad', 'Become Azure Solutions Architect at Microsoft Hyderabad. Design cloud solutions for enterprises. Remote work available.',
    NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), false
);

-- Job 3: Amazon - Data Scientist
INSERT INTO job_postings (
    title, slug, location, remote, job_type, status, application_link,
    company_id, category_id, role_summary, responsibilities, must_have_skills,
    nice_to_have_skills, tools_and_technologies, faqs,
    salary_min, salary_max, currency, salary_type, pay_frequency, benefits_summary, additional_perks,
    work_mode, office_location, working_hours, shift_type, weekend_work, travel_required, travel_percentage, work_environment,
    number_of_rounds, rounds_description, expected_decision_days, assignment_required, preparation_tips,
    team_overview, project_domain, tech_stack, career_path, ideal_candidate_profile,
    background_check_required, bond_applicable, bond_duration, notice_period_policy, equal_opportunity_statement,
    seo_title, seo_description, posted_at, expires_at, deleted
) VALUES (
    'Data Scientist - Recommendations', 'data-scientist-recommendations-amazon',
    'Bangalore, Karnataka', false, 'Full-time', 'PUBLISHED',
    'https://amazon.jobs/en/jobs/HR123456',
    3, 2,
    'Join Amazon''s Personalization team to build ML models that power product recommendations for millions of customers. Apply advanced machine learning techniques to improve customer experience and drive business metrics.',
    '- Develop and deploy machine learning models for product recommendations\n- Analyze large-scale datasets to extract insights\n- Design and conduct A/B tests to measure impact\n- Collaborate with engineering teams for model deployment\n- Present findings to leadership and influence product decisions\n- Stay current with latest ML research and techniques',
    'Python and R; Machine learning algorithms; Statistics and A/B testing; SQL and data analysis; Deep learning frameworks; Masters/PhD in quantitative field; 3+ years in data science',
    'NLP and computer vision; Recommendation systems experience; Spark and distributed computing; AWS services (SageMaker, EMR); Published research; Experience with real-time ML systems',
    'Python, TensorFlow, PyTorch, Scikit-learn, SQL, Spark, AWS, Jupyter, Git',
    'Q: Which team specifically? A: Personalization team within Amazon Retail.\nQ: Publication opportunities? A: Yes, we encourage publishing at top conferences.\nQ: Data access? A: You work with petabytes of customer interaction data.',
    1600000, 2800000, 'INR', 'Fixed + Stock Options', 'Annual',
    'Medical insurance (including parents), Amazon RSUs vesting over 4 years, Relocation assistance, Retirement benefits',
    'Food allowance ₹3K/month, Work from home setup ₹20K one-time, Learning budget, Amazon Prime membership, Employee discounts',
    'Hybrid', 'Amazon Bangalore - Embassy Tech Village', '10 AM - 7 PM (Core hours)', 'Day Shift', 'No', false, 0,
    'Collaborative workspace with meeting rooms, focus areas, cafeteria, and recreational facilities',
    6, '1) Phone screen - technical (45 min)\n2) Coding round (60 min)\n3) ML system design (60 min)\n4) Statistics and probability (45 min)\n5) Behavioral (45 min)\n6) Bar raiser (60 min)',
    28, true, 'Study Amazon Leadership Principles with examples, brush up on ML algorithms, practice probability and statistics, review past project impact using data',
    'Personalization Science team, 12 data scientists and 8 ML engineers. Part of larger Retail Data Science org with 100+ scientists.',
    'E-commerce, Recommendations, Personalization, Machine Learning',
    'Python, TensorFlow, PyTorch, Spark, AWS SageMaker, Redshift, DynamoDB',
    'Data Scientist → Senior Data Scientist → Principal Data Scientist / Science Manager',
    'Strong analytical skills, customer obsession, proven ML deployment experience, ability to work with ambiguity, bias for action',
    true, false, NULL, '60 days notice, can be negotiated',
    'Amazon is an Equal Opportunity Employer. We celebrate diversity and are committed to creating an inclusive workplace.',
    'Data Scientist Jobs at Amazon Bangalore', 'Join Amazon as Data Scientist in Bangalore. Build recommendation systems with ML. Salary ₹16-28 LPA + RSUs.',
    NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), false
);

-- Job 4: Infosys - Full Stack Developer
INSERT INTO job_postings (
    title, slug, location, remote, job_type, status, application_link,
    company_id, category_id, role_summary, responsibilities, must_have_skills,
    nice_to_have_skills, tools_and_technologies, faqs,
    salary_min, salary_max, currency, salary_type, pay_frequency, benefits_summary, additional_perks,
    work_mode, office_location, working_hours, shift_type, weekend_work, travel_required, travel_percentage, work_environment,
    number_of_rounds, rounds_description, expected_decision_days, assignment_required, preparation_tips,
    team_overview, project_domain, tech_stack, career_path, ideal_candidate_profile,
    background_check_required, bond_applicable, bond_duration, notice_period_policy, equal_opportunity_statement,
    seo_title, seo_description, posted_at, expires_at, deleted
) VALUES (
    'Full Stack Developer - React & Spring Boot', 'full-stack-developer-react-spring-infosys',
    'Pune, Maharashtra', false, 'Full-time', 'PUBLISHED',
    'https://www.infosys.com/careers/job-123456.html',
    4, 1,
    'Develop modern web applications for global clients using React, Spring Boot, and cloud technologies. Work on enterprise projects that transform businesses across industries.',
    '- Build responsive web applications using React and modern JavaScript\n- Develop RESTful APIs with Spring Boot and microservices\n- Write clean, testable code following best practices\n- Participate in agile ceremonies and sprint planning\n- Collaborate with designers, QA, and project managers\n- Deploy applications to cloud platforms',
    'JavaScript, React.js; Java, Sprint Boot; RESTful APIs; MySQL/PostgreSQL; HTML5, CSS3; Git version control; 2-4 years full stack experience',
    'Redux, TypeScript; Microservices architecture; Docker, Kubernetes; AWS or Azure; CI/CD pipelines; Unit testing (Jest, JUnit)',
    'React, Redux, JavaScript, Java, Spring Boot, MySQL, Docker, Git, Jenkins, AWS',
    'Q: Project variety? A: You''ll work on 2-3 different client projects per year.\nQ: Client interaction? A: Regular calls with onshore teams and stakeholders.\nQ: Shift timings? A: Usually day shift, occasional late evenings for client calls.',
    800000, 1500000, 'INR', 'Fixed CTC', 'Annual',
    'Health insurance (self + family), Life insurance, Accidental insurance, Gratuity',
    'Transport facility, Food coupons ₹1500/month, Learning platforms (Pluralsight, Udemy), Annual bonus based on performance, Infosys campus facilities',
    'On-site', 'Infosys Campus, Pune', '9:30 AM - 6:30 PM', 'Day Shift', 'No', false, 0,
    'Modern IT campus with cafeteria, gym, sports facilities, library, and collaborative work spaces',
    3, '1) Technical assessment online (coding + MCQs)\n2) Technical interview (60 min - full stack concepts)\n3) HR interview (30 min - background, expectations)',
    14, false, 'Brush up on React and Spring Boot concepts, practice coding problems, prepare project explanations, research Infosys values',
    'Digital Experience team, 25 developers working on various client projects. Report to Project Manager/Tech Lead.',
    'Web Development, Enterprise Applications, Digital Transformation',
    'React, Redux, Spring Boot, MySQL, AWS, Docker, Jenkins',
    'Developer → Senior Developer → Tech Lead → Module Lead → Project Manager',
    'Quick learner, team player, strong communication, attention to quality, ability to handle multiple tasks',
    true, true, '18 months training bond', '90 days notice period',
    'Infosys is an equal opportunity employer. We are committed to diversity and inclusion in our workplace.',
    'Full Stack Developer - Infosys Pune', 'Join Infosys as Full Stack Developer in Pune. Work with ReactJS and Spring Boot. Salary ₹8-15 LPA.',
    NOW(), DATE_ADD(NOW(), INTERVAL 90 DAY), false
);

-- Job 5: TCS - DevOps Engineer
INSERT INTO job_postings (
    title, slug, location, remote, job_type, status, application_link,
    company_id, category_id, role_summary, responsibilities, must_have_skills,
    nice_to_have_skills, tools_and_technologies, faqs,
    salary_min, salary_max, currency, salary_type, pay_frequency, benefits_summary, additional_perks,
    work_mode, office_location, working_hours, shift_type, weekend_work, travel_required, travel_percentage, work_environment,
    number_of_rounds, rounds_description, expected_decision_days, assignment_required, preparation_tips,
    team_overview, project_domain, tech_stack, career_path, ideal_candidate_profile,
    background_check_required, bond_applicable, bond_duration, notice_period_policy, equal_opportunity_statement,
    seo_title, seo_description, posted_at, expires_at, deleted
) VALUES (
    'DevOps Engineer - CI/CD Automation', 'devops-engineer-cicd-tcs',
    'Chennai, Tamil Nadu', false, 'Full-time', 'PUBLISHED',
    'https://www.tcs.com/careers/job-123456',
    5, 5,
    'Lead DevOps initiatives for enterprise clients. Build and maintain CI/CD pipelines, automate infrastructure, and improve deployment processes to accelerate software delivery.',
    '- Design and implement CI/CD pipelines using Jenkins, GitLab CI\n- Automate infrastructure provisioning with Terraform or Ansible\n- Manage containerized applications with Docker and Kubernetes\n- Monitor system performance and implement observability solutions\n- Collaborate with development teams for smooth deployments\n- Optimize cloud resource usage and costs',
    'Linux system administration; Scripting (Python, Bash, Shell); Jenkins, GitLab CI/CD; Docker and Kubernetes; AWS or Azure; 3-5 years DevOps experience',
    'Terraform, Ansible, CloudFormation; Prometheus, Grafana, ELK stack; Service mesh (Istio); GitOps practices; Security tools (Vault, SonarQube)',
    'Jenkins, GitLab, Docker, Kubernetes, Terraform, AWS, Python, Bash, Prometheus, Grafana',
    'Q: Oncall responsibilities? A: Yes, rotating on-call schedule for production support.\nQ: Travel for client visits? A: Occasional, mostly for project kickoffs.\nQ: Certification support? A: Yes, TCS supports AWS/Azure certifications with paid training.',
    900000, 1700000, 'INR', 'Fixed CTC', 'Annual',
    'Comprehensive health insurance, Group life insurance, Accident coverage, Provident fund, Gratuity',
    'Remote work infrastructure reimbursement, Performance-based bonus, Certification training, TCS Ultimatix learning portal, Work-life balance initiatives',
    'Hybrid', 'TCS Chennai, Siruseri IT Park', '9 AM - 6 PM (Flexible for deployments)', 'Day/Evening Shift', 'Occasional on-call', false, 0,
    'Well-equipped office with recreation areas, cafeteria, health center, and collaborative spaces',
    3, '1) Written test (technical aptitude + DevOps concepts)\n2) Technical interview (DevOps tools, scenarios)\n3) Managerial round (behavioral, problem-solving)',
    14, false, 'Study CI/CD concepts thoroughly, practice Kubernetes deployments, understand cloud basics, prepare examples of automation you''ve done',
    'Cloud and Infrastructure Services team, 18 DevOps engineers supporting multiple client projects. Report to Delivery Manager.',
    'DevOps, Cloud Infrastructure, Automation, CI/CD',
    'Jenkins, Docker, Kubernetes, Terraform, AWS, Azure, Python, Git',
    'DevOps Engineer → Senior DevOps → DevOps Lead → Delivery Manager → Associate Consultant',
    'Problem-solver, automation enthusiast, strong in scripting, team player, comfortable with 24x7 support model',
    true, true, '24 months service agreement for lateral hires', '60-90 days notice',
    'TCS is committed to equal employment opportunity and maintaining a diverse, inclusive work environment.',
    'DevOps Engineer Jobs at TCS Chennai', 'Join TCS as DevOps Engineer in Chennai. Work on CI/CD automation and cloud infrastructure. ₹9-17 LPA.',
    NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), false
);

COMMIT;
