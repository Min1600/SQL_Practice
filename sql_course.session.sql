select skills_job_dim.skill_id, count(skills_job_dim.skill_id) as skill_count
from skills_job_dim
inner join skills_dim on skills_job_dim.skill_id = skills_dim .skill_id
group by skills_job_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5




WITH jobs as (select company_id, COUNT(job_id) as no_of_jobs from job_postings_fact
group by company_id)

SELECT company_id, no_of_jobs,
 CASE
 WHEN no_of_jobs < 10 THEN 'Small'
 WHEN no_of_jobs BETWEEN 10 AND 50 THEN 'Medium'
 ELSE 'Large'
 END
 FROM jobs 
 ORDER BY no_of_jobs DESC;


select job_title, salary_year_avg from january_jobs
where salary_year_avg is not null AND salary_year_avg<70000
order by salary_year_avg desc;

select*from company_dim limit 5;