


-- Q1.How many unique post types are found in the 'fact_content' table?

-- Query :

SELECT post_type,count(*) as counts FROM fact_content group by post_type;



-- Q2. What are the highest and lowest recorded impressions for each post type?

-- Query :

SELECT 
	post_type,
    MAX(impressions) as Highest_Rec_Impressions,
    MIN(impressions) as Lowest_Rec_Impressions
FROM fact_content 
GROUP BY post_type;

-- Q3. Filter all the posts that were published on a weekend in the month of March and April and export them to a separate csv file.

-- Query : 

select * from fact_content where MONTH(date) IN (3,4) and dayofweek(date) IN (1,7);

-- Create a report to get the statistics for the account. The final output 
-- includes the following fields:
-- • month_name
-- • total_profile_visits
-- • total_new_followers

-- Query:

SELECT 
	DATE_FORMAT(date,'%M') as Month_name,
    SUM(profile_visits) as Total_Profile_Visits,
    SUM(new_followers) as Total_Followers
FROM fact_account
GROUP BY Month_name;

-- Q4.Write a CTE that calculates the total number of 'likes' for each 
-- 'post_category' during the month of 'July' and subsequently, arrange the 
-- 'post_category' values in descending order according to their total likes.

-- Query : 

WITH likes_cte AS (
SELECT 
	post_category,
    SUM(likes) AS Total_Likes 
FROM fact_content 
WHERE MONTH(date) = 7 
GROUP BY post_category 
ORDER BY SUM(likes) DESC
)

SELECT * FROM likes_cte;

-- Create a report that displays the unique post_category names alongside 
-- their respective counts for each month. The output should have three 
-- columns: 
-- • month_name
-- • post_category_names 
-- • post_category_count

-- Query :

SELECT
    DATE_FORMAT(date, '%M') AS month_name,
    GROUP_CONCAT(DISTINCT post_category ORDER BY post_category SEPARATOR ',') AS post_category,
    COUNT(DISTINCT post_category) AS count
FROM fact_content
GROUP BY DATE_FORMAT(date, '%M'),MONTH(date) 
ORDER BY MONTH(date);

-- What is the percentage breakdown of total reach by post type? The final 
-- output includes the following fields:
-- • post_type
-- • total_reach
-- • reach_percentage

-- Query : 

SELECT 
	post_type,
    SUM(reach) as Total_Reach, 
    ROUND(SUM(reach)*100.0/SUM(sum(reach)) over(),2) as Reach_percentage
FROM fact_content
GROUP BY post_type
ORDER BY Reach_percentage DESC;

-- ---------------- Alternative Way ----------------------

with groupby_post_type as (select post_type,SUM(reach) as Total_Reach from fact_content group by post_type)
,grand_total_reach as ( select SUM(reach) as grand_total from fact_content)

select c.post_type,c.Total_Reach, ROUND( (c.Total_Reach*100.0)/g.grand_total ,2) as Reach_Percentage
from groupby_post_type c,grand_total_reach g
order by Reach_Percentage DESC;

-- Create a report that includes the quarter, total comments, and total 
-- saves recorded for each post category. Assign the following quarter 
-- groupings:
-- The final output columns should consist of:
-- • post_category
-- • quarter
-- • total_comments
-- • total_saves

-- Query : 

SELECT 
	post_category,
    CONCAT('Q',QUARTER(date)) as Quarter,
    SUM(comments) as Total_Comments,
    SUM(saves) as Total_Saves 
FROM fact_content
GROUP BY post_category,Quarter;

-- List the top three dates in each month with the highest number of new 
-- followers. The final output should include the following columns:
-- • month
-- • date
-- • new_followers

-- Query : 

WITH top3dates AS (
SELECT  
    MONTH(date) as Month,
	DATE_FORMAT(date,'%M') as Month_name,
	date,
	SUM(new_followers) as Total_Followers,
    ROW_NUMBER() OVER(partition by MONTH(date) order by sum(new_followers) DESC) as Ranking
FROM fact_account
GROUP BY date
)

SELECT Month_name,date,Total_Followers 
FROM top3dates
WHERE Ranking<4
ORDER BY Month ASC,Total_followers DESC






