    select skills_dim.skills,round(AVG(salary_year_avg),0)as avg_salary
    FROM job_postings_fact

    INNER JOIN skills_job_dim 
        ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id


    WHERE job_title_short like '%Data Analyst%'
    And salary_year_avg IS NOT NULL 
    AND job_work_from_home =TRUE
    GROUP BY skills


    order BY AVG(salary_year_avg) DESC
  
