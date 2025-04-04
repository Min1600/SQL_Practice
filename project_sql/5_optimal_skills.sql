--What are the most optimal skills to learn (aka high demand and a high-paying skill)
--Identify skills in high demand associated with high average salaries for Data Analyst roles


select skills_job_dim.skill_id, skills,
count(skills_job_dim.skill_id) as skill_count,
ROUND(AVG(salary_year_avg),0) as avg_salary
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
group by skills_job_dim.skill_id,skills_dim.skills
ORDER BY avg_salary DESC, skill_count DESC



--With CTE's

with skills_demand as(
select skills_job_dim.skill_id, skills,count(skills_job_dim.skill_id) as skill_count
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Analyst'
group by skills, skills_job_dim.skill_id
ORDER BY skill_count DESC
), top_salary as(
select skills_job_dim.skill_id, ROUND(AVG(salary_year_avg),0) as avg_salary
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
group by skills_job_dim.skill_id
ORDER BY avg_salary DESC
)

SELECT skills_demand.skill_id, skills_demand.skills, avg_salary, skill_count
FROM skills_demand
INNER JOIN top_salary ON skills_demand.skill_id = top_salary.skill_id
ORDER BY avg_salary DESC, skill_count DESC