/* question what are the top paying data analyst roles  ?
identify the top highest 10 paying that are avaliable remotely
focus on salaries 
and say the company name and the month of the posting and also identify the required skills
and skill type for the position 
*/
SELEct * from job_postings_fact limit 10;
SELECT DISTINCT * from skills_dim ;
SELECT DISTINCT * from skills_job_dim limit 10 ;
select DISTINCT *  FROM company_dim LIMIT10

/* what is the expected output is  job title ,remote job ,salary ,the company name
the month of posting job the required skills and also the type of skill
*/



SELECT 
    job_postings_fact.job_title_short AS job_title,
    job_postings_fact.job_work_from_home AS remotely,
    job_postings_fact.salary_year_avg AS salary,
    company_dim.name AS company_name,
    extract (MONTH from job_posted_date) as month,--or TO_CHAR(job_postings_fact.posting_date, 'Month') AS posting_month
    STRING_AGG(skills_dim.skills, ', ') AS required_skills,
    STRING_AGG(skills_dim.type, ', ') AS skill_type

FROM job_postings_fact
left JOIN company_dim 
    ON company_dim.company_id = job_postings_fact.company_id
INNER JOIN skills_job_dim 
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_work_from_home = 'True'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_title_short LIKE '%Data Analyst%'
    
GROUP BY 
    job_postings_fact.job_title_short, 
    job_postings_fact.job_work_from_home, 
    job_postings_fact.salary_year_avg, 
    company_dim.name, 
    job_postings_fact.job_posted_date
ORDER BY 
    job_postings_fact.salary_year_avg DESC
LIMIT 10;







