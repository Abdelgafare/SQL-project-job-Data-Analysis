SELECT skills,
count(skills_job_dim.job_id) as job_demand_count
from job_postings_fact
INNER JOIN skills_job_dim 
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short like '%Data Analyst%'
GROUP BY skills
ORDER BY job_demand_count DESC
    limit 5
