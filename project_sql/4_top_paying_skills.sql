--What are the top skills based on salary?
--Look at the average salary associated with each skill for Data Analyst positions
--Focuses on roles with specified salary, regardless of location

select skills, ROUND(AVG(salary_year_avg),0) as avg_salary
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
group by skills
ORDER BY avg_salary DESC
LIMIT 5

