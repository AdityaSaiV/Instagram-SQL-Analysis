# Tech Instagram Influencer Analysis

![Banner](https://via.placeholder.com/800x200.png?text=Tech+Instagram+Influencer+Analysis)  
*SQL-Driven Insights to Optimize Content Strategy and Boost Engagement*

## 📋 Project Overview

Welcome to the **Tech Instagram Influencer Analysis** project, completed during my internship as a Data Analyst at **AtliQ Technologies**. This project leverages **SQL** to analyze an Instagram influencer's performance data, answering 10 complex business questions to uncover trends, optimize content strategy, and drive audience growth. From identifying top-performing post types to crafting dynamic reports with stored procedures, this project showcases the power of data-driven decision-making in influencer marketing.

The dataset includes post details (e.g., type, category, impressions, likes) and account metrics (e.g., profile visits, new followers), enabling a deep dive into engagement patterns and content performance.

## 🎯 Objectives
- Analyze post performance across types, categories, and time periods.
- Derive actionable insights to enhance reach, engagement, and follower growth.
- Develop reusable SQL queries and procedures for dynamic reporting.
- Translate data findings into business recommendations for stakeholders.

## 🗄️ Dataset Description
The project uses two key tables:
- **fact_content**: Post-level data with fields like:
  - `date`: Posting date
  - `post_category`: Mobile, Smartwatch, Earphone, Laptop, Other Gadgets, Tech Tips
  - `post_type`: IG Video, IG Image, IG Reel, IG Carousel
  - `impressions`, `reach`, `likes`, `comments`, `saves`, `shares`: Engagement metrics
  - `video_duration`, `carousel_item_count`: Content attributes
- **fact_account**: Account-level metrics with fields like:
  - `date`, `month_name`, `week_no`, `weekday_weekend`: Time-related fields
  - `profile_visits`, `new_followers`: Account growth metrics

## 🔍 Key Questions & Insights
The project answers 10 business questions, each revealing critical insights:

1. **Unique Post Types**  
   - *Query*: Counted distinct `post_type` values.  
   - *Insight*: IG Videos (32%) and Images (26%) lead, followed by Reels (24%) and Carousels (18%).  
   - *Takeaway*: Prioritize Videos for consistent engagement.

2. **Highest/Lowest Impressions by Post Type**  
   - *Query*: Used `MAX` and `MIN` on `impressions` grouped by `post_type`.  
   - *Insight*: Reels hit 339K impressions; Carousels lag significantly.  
   - *Takeaway*: Focus on Reels for viral reach.

3. **Weekend Posts in March/April**  
   - *Query*: Filtered posts with `MONTH(date) IN (3,4)` and `DAYOFWEEK(date) IN (1,7)`, exported to CSV.  
   - *Insight*: Weekend posts show higher engagement.  
   - *Takeaway*: Schedule key content on weekends for Q1 impact.

4. **Monthly Account Statistics**  
   - *Query*: Summed `profile_visits` and `new_followers` by `MONTH_NAME`.  
   - *Insight*: May-June saw surges; July-September slumped.  
   - *Takeaway*: Capitalize on spring momentum with campaigns.

5. **Likes by Post Category in July (CTE)**  
   - *Query*: Used a CTE to sum `likes` for July, sorted descending.  
   - *Insight*: Other Gadgets (top) and Tech Tips outshine Smartwatches (lowest).  
   - *Takeaway*: Push high-performing categories; rethink Smartwatch content.

6. **Post Category Counts by Month**  
   - *Query*: Used `GROUP_CONCAT` and `COUNT` for categories per month.  
   - *Insight*: Diversity peaked in May (6 categories); Laptops dropped later.  
   - *Takeaway*: Evolve content mix to keep audience engaged.

7. **Reach Percentage by Post Type**  
   - *Query*: Calculated `reach` percentages with window functions.  
   - *Insight*: Reels dominate with 62% of total reach.  
   - *Takeaway*: Allocate budget to Reels for maximum visibility.

8. **Quarterly Comments and Saves**  
   - *Query*: Grouped `comments` and `saves` by `post_category` and `QUARTER`.  
   - *Insight*: Mobile leads; Q2 peaks in engagement.  
   - *Takeaway*: Time Mobile and Tech Tips content for Q2 boosts.

9. **Top 3 Dates for New Followers per Month**  
   - *Query*: Used `ROW_NUMBER` to rank dates by `new_followers`.  
   - *Insight*: May 8th exploded with 8,872 followers; June surged overall.  
   - *Takeaway*: Replicate viral content from peak days.

10. **Stored Procedure for Shares by Week**  
    - *Query*: Created a procedure to sum `shares` by `post_type` for a given `week_no`.  
    - *Insight*: Reels likely lead shares in high-traffic weeks.  
    - *Takeaway*: Use dynamic reports for agile content tweaks.

## 🛠️ Setup Instructions
To explore or replicate this project:
1. **Database**: Use a SQL-compatible database (e.g., MySQL, PostgreSQL).
2. **Data**: Import the `fact_content` and `fact_account` tables (schema as described above).
3. **Queries**: Run the SQL files (`question1.sql` to `question10.sql`) in sequence.
   - Ensure your database supports functions like `GROUP_CONCAT`, `ROW_NUMBER`, and stored procedures.
4. **Dependencies**: No additional libraries required; standard SQL syntax used.
5. **Output**: Some queries (e.g., Question 3) export to CSV; configure your database’s export path accordingly.

## 📂 Repository Structure
- `question1.sql` to `question10.sql`: SQL queries for each question.
- `presentation.pdf`: Slide deck for the project presentation.
- `video_link.txt`: Link to the presentation video [Insert Your Video Link Here].
- `README.md`: This file.

## 📊 Key Recommendations
- **Prioritize IG Reels**: Allocate resources to Reels for 62% reach and high impressions.
- **Focus on Mobile & Tech Tips**: These drive engagement, especially in Q2.
- **Leverage Spring Momentum**: Time campaigns for May-June; schedule weekend posts in March/April.
- **Evolve Content Mix**: Drop low-performers (e.g., Laptops); promote Other Gadgets.
- **Replicate Viral Success**: Analyze May 8th’s content for follower spikes.
- **Use Dynamic Reporting**: Stored procedures enable agile weekly adjustments.

## 🧠 Learnings
- **SQL Mastery**: Gained expertise in CTEs, window functions, and stored procedures, enhancing query readability and efficiency.
- **Business Translation**: Learned to craft stakeholder-friendly insights, turning data into actionable strategies.
- **Problem-Solving**: Overcame challenges like optimizing complex queries and formatting CSV exports.
- **Visualization Impact**: Pairing queries with charts (e.g., pie charts for reach) made insights compelling.

## 📬 Connect with Me
I’d love to hear your feedback or discuss data analytics! Reach out at:
- **Email**: adityacodecom@gmail.com
- **LinkedIn**: [Your LinkedIn Profile Link]
- **GitHub**: [https://github.com/AdityaSaiV](https://github.com/AdityaSaiV)

Thanks for checking out my project! 🌟 Let’s keep the data conversation going!
