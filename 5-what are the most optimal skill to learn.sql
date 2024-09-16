WITH skills_demand AS (
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS job_demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title_short LIKE '%Data Analyst%'
    AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id, skills_dim.skills
), 
average_salary AS (  
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title_short LIKE '%Data Analyst%'
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id, skills_dim.skills
)
SELECT 
    skills_demand.skill_id,
    average_salary.skills,
    skills_demand.job_demand_count,
    average_salary.avg_salary
FROM skills_demand 
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY skills_demand.job_demand_count DESC, average_salary.avg_salary DESC
LIMIT 25;  -- Corrected the typo here
