-- What are the top-paying data analyst jobs
--Identify the top 10 highest paying Data Analyst roles that are available remotely
--Focuses on job postings with specified salaries (remove nulls)
select job_id, job_title, name AS company_name,
job_location, job_schedule_type,job_posted_date, salary_year_avg 
FROM job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short='Data Analyst'
AND job_location='Anywhere'
AND job_work_from_home = TRUE
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10

