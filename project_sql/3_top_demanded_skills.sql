--Display top 5 skills in Data analyst role


select skills,count(skills_job_dim.skill_id) as skill_count
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Analyst'
group by skills
ORDER BY skill_count DESC
LIMIT 5


