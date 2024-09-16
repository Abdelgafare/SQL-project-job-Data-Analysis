
WITH top_paying_jobs AS(
select  job_title_short ,
        job_id,
        salary_year_avg,
        name as company_name,
        job_location
FROM job_postings_fact 
    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
where job_title_short like '%Data Analyst%'
AND job_location='Anywhere'
AND salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT
top_paying_jobs.* ,skills
from top_paying_jobs
INNER JOIN skills_job_dim 
    ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id

ORDER BY salary_year_avg DESC


