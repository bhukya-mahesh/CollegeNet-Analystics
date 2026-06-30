USE collegenet_analytics;

DROP PROCEDURE IF EXISTS sp_GetItemsByCategory;
DELIMITER $$
CREATE PROCEDURE sp_GetItemsByCategory(
    IN p_CategoryName VARCHAR(100)
)
BEGIN
    SELECT
        i.ItemID,
        i.ItemTitle,
        c.CategoryName,
        i.Status,
        i.Location,
        i.EstimatedValue,
        i.ReportDate
    FROM items i
    JOIN categories c
        ON i.CategoryID = c.CategoryID
    WHERE c.CategoryName = p_CategoryName;
END $$
DELIMITER ;

CALL sp_GetItemsByCategory('Laptop');


DROP PROCEDURE IF EXISTS sp_GetUserActivity;
DELIMITER $$
CREATE PROCEDURE sp_GetUserActivity(
    IN p_UserID INT
)
BEGIN
    SELECT
        ItemTitle,
        ItemType,
        Status,
        ReportDate
    FROM items
    WHERE UserID = p_UserID
    ORDER BY ReportDate DESC;
END $$
DELIMITER ;

CALL sp_GetUserActivity(10);


DROP PROCEDURE IF EXISTS sp_DepartmentSummary;
DELIMITER $$
CREATE PROCEDURE sp_DepartmentSummary()
BEGIN
    SELECT
        d.DepartmentName,
        COUNT(i.ItemID) AS TotalReports,
        ROUND(AVG(i.EstimatedValue),2) AS AverageItemValue
    FROM departments d
    LEFT JOIN users u
        ON d.DepartmentID = u.DepartmentID
    LEFT JOIN items i
        ON u.UserID = i.UserID
    GROUP BY d.DepartmentName
    ORDER BY TotalReports DESC;
END $$
DELIMITER ;

CALL sp_DepartmentSummary();


DROP PROCEDURE IF EXISTS sp_MonthlySummary;
DELIMITER $$
CREATE PROCEDURE sp_MonthlySummary()
BEGIN
    SELECT
        YEAR(ReportDate) AS ReportYear,
        MONTH(ReportDate) AS ReportMonth,
        COUNT(*) AS TotalReports,
        SUM(
            CASE
                WHEN Status='Recovered' THEN 1
                ELSE 0
            END
        ) AS RecoveredItems
    FROM items
    GROUP BY
        YEAR(ReportDate),
        MONTH(ReportDate)
    ORDER BY
        ReportYear,
        ReportMonth;
END $$
DELIMITER ;

CALL sp_MonthlySummary();


DROP PROCEDURE IF EXISTS sp_TradeStatistics;
DELIMITER $$
CREATE PROCEDURE sp_TradeStatistics()
BEGIN
    SELECT
        TradeStatus,
        COUNT(*) AS TotalTrades
    FROM trades
    GROUP BY TradeStatus;
END $$
DELIMITER ;

UserID,DepartmentID,HostelID,ScholarID,FullName,UserName,Gender,Semester,Email,RegistrationDate,AccountStatus
1,2,1,2502001,Mahesh Kumar,mahesh_kumar704,Male,1,mahesh_kumar704@nits.ac.in,2025-07-18,Active
2,1,3,2501001,Manisha Yadav,manisha_yadav833,Male,2,manisha_yadav833@nits.ac.in,2025-07-04,Active
3,4,4,2404001,Kavya Das,kavya_das384,Female,3,kavya_das384@nits.ac.in,2024-07-21,Active
4,2,5,2502002,Srichandana Nair,srichandana_nair926,Female,2,srichandana_nair926@nits.ac.in,2025-08-14,Active
5,6,5,2306001,Manisha Rao,manisha_rao949,Female,5,manisha_rao949@nits.ac.in,2023-07-11,Active
6,5,4,2305001,Ankit Rao,ankit_rao181,Female,5,ankit_rao181@nits.ac.in,2023-09-23,Active
7,3,2,2403001,Sneha Choudhary,sneha_choudhary314,Male,4,sneha_choudhary314@nits.ac.in,2024-07-21,Active
8,1,3,2301001,Akash Nayak,akash_nayak488,Male,5,akash_nayak488@nits.ac.in,2023-08-01,Active
9,5,1,2305002,Aditya Das,aditya_das510,Male,6,aditya_das510@nits.ac.in,2023-07-30,Active
10,4,3,2204001,Vikram Rathod,vikram_rathod505,Male,7,vikram_rathod505@nits.ac.in,2022-08-10,Active
11,1,5,2501002,Kavya Iyer,kavya_iyer470,Female,2,kavya_iyer470@nits.ac.in,2025-09-13,Active
12,1,1,2301002,Sai Gupta,sai_gupta911,Male,5,sai_gupta911@nits.ac.in,2023-07-15,Active
13,4,2,2404002,Aravind Sharma,aravind_sharma796,Male,4,aravind_sharma796@nits.ac.in,2024-09-06,Active
14,2,5,2302001,Akash Nayak,akash_nayak103,Female,6,akash_nayak103@nits.ac.in,2023-08-25,Inactive
15,5,4,2205001,Ajay Yadav,ajay_yadav256,Female,8,ajay_yadav256@nits.ac.in,2022-09-19,Active
16,5,3,2305003,Srichandana Das,srichandana_das600,Male,5,srichandana_das600@nits.ac.in,2023-07-01,Active
17,5,5,2205002,Rahul Verma,rahul_verma999,Female,7,rahul_verma999@nits.ac.in,2022-07-31,Active
18,3,1,2503001,Krishna Singh,krishna_singh775,Male,2,krishna_singh775@nits.ac.in,2025-09-07,Active
19,5,2,2405001,Keerthi Yadav,keerthi_yadav830,Male,3,keerthi_yadav830@nits.ac.in,2024-07-28,Active
20,3,4,2403002,Ankit Kumar,ankit_kumar446,Female,4,ankit_kumar446@nits.ac.in,2024-08-01,Active
21,1,3,2301003,Rahul Verma,rahul_verma169,Male,5,rahul_verma169@nits.ac.in,2023-09-19,Active
22,1,5,2501003,Keerthi Singh,keerthi_singh840,Female,1,keerthi_singh840@nits.ac.in,2025-07-28,Active
23,3,5,2403003,Mahesh Patel,mahesh_patel774,Female,3,mahesh_patel774@nits.ac.in,2024-07-25,Active
24,5,4,2405002,Mahesh Reddy,mahesh_reddy512,Female,4,mahesh_reddy512@nits.ac.in,2024-09-25,Active
25,1,2,2401001,Kavya Gupta,kavya_gupta385,Male,3,kavya_gupta385@nits.ac.in,2024-07-18,Active
26,5,3,2405003,Rahul Sharma,rahul_sharma195,Male,4,rahul_sharma195@nits.ac.in,2024-07-13,Active
27,3,1,2503002,Rahul Gupta,rahul_gupta488,Male,2,rahul_gupta488@nits.ac.in,2025-08-21,Active
28,5,5,2405004,Kavya Rathod,kavya_rathod258,Female,3,kavya_rathod258@nits.ac.in,2024-08-06,Active
29,4,3,2204002,Avinash Reddy,avinash_reddy151,Male,8,avinash_reddy151@nits.ac.in,2022-07-08,Active
30,3,1,2503003,Srichandana Kumar,srichandana_kumar791,Male,1,srichandana_kumar791@nits.ac.in,2025-07-09,Active
31,6,4,2506001,Srichandana Reddy,srichandana_reddy734,Female,2,srichandana_reddy734@nits.ac.in,2025-09-13,Active
32,1,5,2201001,Aravind Iyer,aravind_iyer234,Female,7,aravind_iyer234@nits.ac.in,2022-07-31,Active
33,6,4,2406001,Nandini Patel,nandini_patel175,Female,4,nandini_patel175@nits.ac.in,2024-07-02,Active
34,2,4,2502003,Sneha Rao,sneha_rao261,Female,2,sneha_rao261@nits.ac.in,2025-08-01,Active
35,6,4,2306002,Manisha Rao,manisha_rao779,Female,5,manisha_rao779@nits.ac.in,2023-09-24,Active
36,6,3,2406002,Sai Nair,sai_nair388,Male,3,sai_nair388@nits.ac.in,2024-09-09,Active
37,4,5,2404003,Shravani Nair,shravani_nair966,Female,3,shravani_nair966@nits.ac.in,2024-09-03,Active
38,1,5,2301004,Lavanya Nair,lavanya_nair265,Female,6,lavanya_nair265@nits.ac.in,2023-07-17,Active
39,1,4,2301005,Aditya Choudhary,aditya_choudhary696,Female,5,aditya_choudhary696@nits.ac.in,2023-09-08,Active
40,2,4,2502004,Vikram Verma,vikram_verma782,Female,2,vikram_verma782@nits.ac.in,2025-08-15,Active
41,5,4,2205003,Abhishek Joshi,abhishek_joshi125,Female,8,abhishek_joshi125@nits.ac.in,2022-07-21,Active
42,2,4,2302002,Akash Patel,akash_patel491,Female,6,akash_patel491@nits.ac.in,2023-08-04,Active
43,5,5,2405005,Ajay Verma,ajay_verma328,Female,3,ajay_verma328@nits.ac.in,2024-08-14,Active
44,2,1,2402001,Ananya Iyer,ananya_iyer795,Male,4,ananya_iyer795@nits.ac.in,2024-08-05,Inactive
45,1,5,2201002,Triveni Nair,triveni_nair139,Female,7,triveni_nair139@nits.ac.in,2022-07-23,Active
46,5,5,2405006,Aishwarya Patel,aishwarya_patel494,Female,4,aishwarya_patel494@nits.ac.in,2024-09-16,Active
47,5,1,2405007,Keerthi Yadav,keerthi_yadav472,Male,3,keerthi_yadav472@nits.ac.in,2024-09-05,Active
48,4,4,2304001,Aishwarya Rao,aishwarya_rao782,Female,5,aishwarya_rao782@nits.ac.in,2023-08-08,Active
49,3,4,2303001,Pooja Gupta,pooja_gupta730,Female,6,pooja_gupta730@nits.ac.in,2023-08-23,Active
50,1,5,2301006,Kavya Das,kavya_das576,Female,5,kavya_das576@nits.ac.in,2023-07-27,Active
51,5,3,2305004,Karthik Rao,karthik_rao627,Male,5,karthik_rao627@nits.ac.in,2023-07-22,Active
52,6,4,2506002,Ajay Verma,ajay_verma925,Female,2,ajay_verma925@nits.ac.in,2025-09-25,Active
53,6,3,2506003,Nandini Joshi,nandini_joshi744,Male,1,nandini_joshi744@nits.ac.in,2025-07-10,Active
54,2,4,2302003,Kavya Verma,kavya_verma280,Female,5,kavya_verma280@nits.ac.in,2023-07-14,Active
55,2,4,2502005,Krishna Nayak,krishna_nayak783,Female,1,krishna_nayak783@nits.ac.in,2025-08-28,Active
56,6,5,2206001,Swathi Gupta,swathi_gupta861,Female,8,swathi_gupta861@nits.ac.in,2022-09-09,Active
57,2,5,2402002,Shravani Verma,shravani_verma381,Female,3,shravani_verma381@nits.ac.in,2024-09-05,Active
58,2,4,2402003,Sai Verma,sai_verma492,Female,3,sai_verma492@nits.ac.in,2024-07-18,Active
59,2,3,2502006,Neha Reddy,neha_reddy311,Male,1,neha_reddy311@nits.ac.in,2025-08-29,Active
60,4,4,2204003,Pooja Rathod,pooja_rathod106,Female,7,pooja_rathod106@nits.ac.in,2022-09-12,Active
61,5,5,2305005,Keerthi Verma,keerthi_verma599,Female,6,keerthi_verma599@nits.ac.in,2023-09-07,Active
62,2,5,2302004,Nandini Singh,nandini_singh737,Female,5,nandini_singh737@nits.ac.in,2023-07-22,Active
63,4,4,2304002,Kavya Singh,kavya_singh987,Female,5,kavya_singh987@nits.ac.in,2023-09-21,Active
64,2,2,2402004,Priya Iyer,priya_iyer384,Male,3,priya_iyer384@nits.ac.in,2024-08-11,Active
65,1,4,2401002,Rahul Choudhary,rahul_choudhary329,Female,3,rahul_choudhary329@nits.ac.in,2024-09-08,Active
66,6,1,2306003,Anjana Singh,anjana_singh344,Male,6,anjana_singh344@nits.ac.in,2023-07-03,Active
67,1,3,2301007,Sneha Gupta,sneha_gupta720,Male,5,sneha_gupta720@nits.ac.in,2023-08-02,Active
68,1,2,2301008,Triveni Sharma,triveni_sharma419,Male,6,triveni_sharma419@nits.ac.in,2023-07-14,Active
69,5,4,2405008,Lavanya Verma,lavanya_verma204,Female,4,lavanya_verma204@nits.ac.in,2024-09-14,Active
70,4,4,2204004,Aditya Choudhary,aditya_choudhary645,Female,7,aditya_choudhary645@nits.ac.in,2022-09-11,Active
71,4,4,2504001,Shravani Patel,shravani_patel543,Female,1,shravani_patel543@nits.ac.in,2025-08-23,Inactive
72,2,5,2302005,Keerthi Rathod,keerthi_rathod576,Female,6,keerthi_rathod576@nits.ac.in,2023-09-17,Active
73,2,4,2402005,Swathi Verma,swathi_verma868,Female,4,swathi_verma868@nits.ac.in,2024-08-05,Active
74,3,5,2403004,Shravani Yadav,shravani_yadav463,Female,4,shravani_yadav463@nits.ac.in,2024-07-24,Active
75,4,5,2404004,Aarav Yadav,aarav_yadav187,Female,3,aarav_yadav187@nits.ac.in,2024-09-10,Active
76,5,5,2305006,Shravani Nayak,shravani_nayak911,Female,5,shravani_nayak911@nits.ac.in,2023-09-21,Active
77,4,5,2404005,Triveni Choudhary,triveni_choudhary584,Female,3,triveni_choudhary584@nits.ac.in,2024-09-23,Active
78,5,5,2405009,Nandini Nair,nandini_nair413,Female,4,nandini_nair413@nits.ac.in,2024-08-15,Active
79,2,3,2302006,Abhishek Yadav,abhishek_yadav321,Male,6,abhishek_yadav321@nits.ac.in,2023-09-07,Active
80,6,5,2306004,Harsha Rao,harsha_rao332,Female,6,harsha_rao332@nits.ac.in,2023-07-13,Active
81,3,5,2503004,Rahul Rao,rahul_rao814,Female,1,rahul_rao814@nits.ac.in,2025-07-06,Active
82,1,5,2501004,Meghana Nayak,meghana_nayak448,Female,2,meghana_nayak448@nits.ac.in,2025-08-30,Active
83,5,1,2405010,Divya Rathod,divya_rathod175,Male,3,divya_rathod175@nits.ac.in,2024-07-09,Active
84,5,2,2505001,Ganesh Patel,ganesh_patel671,Male,2,ganesh_patel671@nits.ac.in,2025-07-11,Active
85,2,2,2302007,Triveni Joshi,triveni_joshi412,Male,6,triveni_joshi412@nits.ac.in,2023-08-08,Active
86,5,1,2305007,Vikram Nair,vikram_nair776,Male,5,vikram_nair776@nits.ac.in,2023-09-19,Active
87,1,1,2501005,Swathi Rathod,swathi_rathod398,Male,2,swathi_rathod398@nits.ac.in,2025-08-22,Active
88,5,5,2305008,Ankit Nair,ankit_nair906,Female,6,ankit_nair906@nits.ac.in,2023-07-10,Active
89,3,3,2403005,Sandeep Singh,sandeep_singh173,Male,4,sandeep_singh173@nits.ac.in,2024-07-20,Active
90,5,5,2305009,Arjun Nayak,arjun_nayak805,Female,5,arjun_nayak805@nits.ac.in,2023-08-26,Active
91,3,5,2203001,Karthik Reddy,karthik_reddy542,Female,8,karthik_reddy542@nits.ac.in,2022-08-26,Active
92,1,4,2501006,Sandeep Reddy,sandeep_reddy881,Female,1,sandeep_reddy881@nits.ac.in,2025-09-25,Active
93,3,5,2303002,Triveni Joshi,triveni_joshi750,Female,5,triveni_joshi750@nits.ac.in,2023-07-24,Active
94,2,2,2402006,Mahesh Gupta,mahesh_gupta437,Male,4,mahesh_gupta437@nits.ac.in,2024-09-24,Active
95,6,4,2406003,Karthik Das,karthik_das358,Female,3,karthik_das358@nits.ac.in,2024-08-28,Active
96,5,4,2205004,Keerthi Nayak,keerthi_nayak523,Female,7,keerthi_nayak523@nits.ac.in,2022-09-23,Active
97,3,5,2303003,Vikram Nair,vikram_nair662,Female,5,vikram_nair662@nits.ac.in,2023-07-07,Active
98,4,4,2404006,Lavanya Verma,lavanya_verma826,Female,4,lavanya_verma826@nits.ac.in,2024-07-04,Active
99,1,1,2301009,Arjun Singh,arjun_singh610,Male,5,arjun_singh610@nits.ac.in,2023-08-29,Active
100,2,5,2302008,Ganesh Nayak,ganesh_nayak664,Female,5,ganesh_nayak664@nits.ac.in,2023-08-30,Active
 i have created this earlier itself what i have do know 

Awesome! 🔥 Now we're entering the Advanced SQL section. These are the queries that interviewers really like because they involve business thinking, window functions, CTEs, and analytical SQL.

📁 Create
SQL/03_Advanced_Queries.sql
Query 21: Top 5 Departments by Total Reports
SELECT
    d.DepartmentName,
    COUNT(i.ItemID) AS TotalReports
FROM departments d
JOIN users u
ON d.DepartmentID = u.DepartmentID
JOIN items i
ON u.UserID = i.UserID
GROUP BY d.DepartmentName
ORDER BY TotalReports DESC
LIMIT 5;
Query 22: Average Recovery Time
SELECT
    ROUND(AVG(DATEDIFF(RecoveredDate, ReportDate)),2)
    AS AverageRecoveryDays
FROM items
WHERE Status='Recovered';
Query 23: Categories Never Recovered
SELECT DISTINCT
    c.CategoryName
FROM categories c
JOIN items i
ON c.CategoryID=i.CategoryID
WHERE i.Status<>'Recovered';
Query 24: Users Reporting More Than 3 Items
SELECT
    u.UserID,
    u.FullName,
    COUNT(i.ItemID) AS TotalReports
FROM users u
JOIN items i
ON u.UserID=i.UserID
GROUP BY u.UserID,u.FullName
HAVING COUNT(i.ItemID)>3
ORDER BY TotalReports DESC;
Query 25: Highest Value Item in Each Category
SELECT
    c.CategoryName,
    MAX(i.EstimatedValue) AS HighestValue
FROM items i
JOIN categories c
ON i.CategoryID=c.CategoryID
GROUP BY c.CategoryName;
Query 26: Rank Items by Value
SELECT
    ItemTitle,
    CategoryID,
    EstimatedValue,
    RANK() OVER(
        ORDER BY EstimatedValue DESC
    ) AS ItemRank
FROM items;
Query 27: Dense Rank by Category
SELECT
    CategoryID,
    ItemTitle,
    EstimatedValue,
    DENSE_RANK() OVER(
        PARTITION BY CategoryID
        ORDER BY EstimatedValue DESC
    ) AS RankInCategory
FROM items;
Query 28: Running Total of Reports
SELECT
    ReportDate,
    COUNT(*) AS DailyReports,
    SUM(COUNT(*))
    OVER(
        ORDER BY ReportDate
    ) AS RunningTotal
FROM items
GROUP BY ReportDate;
Query 29: Monthly Recovery Rate
SELECT

YEAR(ReportDate) AS Year,

MONTH(ReportDate) AS Month,

COUNT(*) AS TotalReports,

SUM(
CASE
WHEN Status='Recovered'
THEN 1
ELSE 0
END
) AS Recovered,

ROUND(
SUM(
CASE
WHEN Status='Recovered'
THEN 1
ELSE 0
END
)*100.0/
COUNT(*),2
) AS RecoveryRate

FROM items

GROUP BY
YEAR(ReportDate),
MONTH(ReportDate)

ORDER BY
Year,
Month;
Query 30: Most Valuable Lost Item
SELECT

ItemTitle,

EstimatedValue,

Location

FROM items

WHERE ItemType='Lost'

ORDER BY EstimatedValue DESC

LIMIT 1;
⭐ Now the Really Interesting Part (CTEs)
Query 31: Department Performance
WITH DepartmentReports AS
(
SELECT

d.DepartmentName,

COUNT(*) AS Reports

FROM users u

JOIN departments d
ON u.DepartmentID=d.DepartmentID

JOIN items i
ON u.UserID=i.UserID

GROUP BY d.DepartmentName
)

SELECT *

FROM DepartmentReports

ORDER BY Reports DESC;
Query 32: Users Above Average Reporting
WITH UserReports AS
(
SELECT

UserID,

COUNT(*) AS Reports

FROM items

GROUP BY UserID
)

SELECT *

FROM UserReports

WHERE Reports >
(
SELECT AVG(Reports)

FROM UserReports
);
📊 Dashboard Value

These advanced queries directly support dashboards like:

Dashboard	Query
Executive KPI	22
Department Analysis	21, 31
Category Analysis	25, 27
Recovery Trend	29
High Value Items	30
User Leaderboard	24, 32
📈 Current Project Progress
Phase	Status
Database Design	✅
Data Generation (Python)	✅
Data Import	✅
Basic SQL	✅
Intermediate SQL	✅
Advanced SQL	✅
Views	🔜
Stored Procedures	🔜
Excel Dashboard	⏳
Power BI Dashboard	⏳

Overall Completion: ~75%

🎯 Here's what I want to improve

So far, we've been writing queries topic by topic.

From this point onward, I want to shift to a business case study approach.

Instead of saying:

"Write a JOIN query"

we'll ask questions like:

"Which department loses the highest-value items?"
"Which hostel has the best recovery rate?"
"How long does it take to recover a laptop compared to a wallet?"
"Which students are most active in reporting items?"
"Which locations should the college monitor more closely?"

These are the kinds of questions a hiring manager or interviewer expects a Data Analyst to answer.

🚀 Next Milestone

We'll build:

Views (reusable SQL objects)
Stored Procedures
Dashboard Queries (optimized specifically for Excel and Power BI)
Finally, we'll build the Excel Dashboard and Power BI Dashboard on top of those queries.

At this stage, your project is no longer just a SQL practice project—it's becoming a complete analytics case study that you can confidently explain in interviews.

next rembere that  all Queries i wrote in on file itselt 

Yes, I remember. 👍

I also saw your folder structure in the screenshot.

Database/
│── Constraints.sql
│── Create_Database.sql
│── Create_Tables.sql
│── Indexes.sql
│── Insert_Data.sql
│── Procedures.sql
│── Queries.sql      ✅
│── Triggers.sql
│── Views.sql

I actually like this structure better than creating 10 different SQL files.

For a GitHub project, having one well-organized Queries.sql file is cleaner and easier for recruiters to browse.

📌 New Plan

We'll keep all SQL queries inside Queries.sql, but organize them with comments.

Example:

/*====================================================
          BASIC SQL QUERIES
====================================================*/

-- Query 1
SELECT ...

-- Query 2
SELECT ...



/*====================================================
      AGGREGATE & GROUP BY QUERIES
====================================================*/

-- Query 11
SELECT ...



/*====================================================
        JOIN QUERIES
====================================================*/

-- Query 21
SELECT ...



/*====================================================
      WINDOW FUNCTION QUERIES
====================================================*/

-- Query 31
SELECT ...



/*====================================================
        DASHBOARD QUERIES
====================================================*/

-- Query 41
SELECT ...

This looks much more professional.

🚀 Now We Build the Real Business Queries

So far, we've written technical SQL queries.

From now on, every query will answer a business question.

📊 Section 1 — Executive Dashboard
Query 1

Total Users

SELECT COUNT(*) AS TotalUsers
FROM users;
Query 2

Total Items

SELECT COUNT(*) AS TotalItems
FROM items;
Query 3

Recovered Items

SELECT COUNT(*) AS RecoveredItems
FROM items
WHERE Status='Recovered';
Query 4

Recovery Percentage

SELECT
ROUND(
COUNT(CASE
WHEN Status='Recovered'
THEN 1
END)*100.0/
COUNT(*),2
) AS RecoveryPercentage
FROM items;
Query 5

Total Trade Requests

SELECT COUNT(*) AS TotalTrades
FROM trades;
📍 Section 2 — Location Analysis
Query 6

Top Lost Locations

SELECT

Location,

COUNT(*) AS LostItems

FROM items

WHERE ItemType='Lost'

GROUP BY Location

ORDER BY LostItems DESC;
Query 7

Top Found Locations

SELECT

Location,

COUNT(*) AS FoundItems

FROM items

WHERE ItemType='Found'

GROUP BY Location

ORDER BY FoundItems DESC;
Query 8

Recovery Rate by Location

SELECT

Location,

COUNT(*) AS TotalItems,

SUM(
CASE
WHEN Status='Recovered'
THEN 1
ELSE 0
END
) AS Recovered,

ROUND(
SUM(
CASE
WHEN Status='Recovered'
THEN 1
ELSE 0
END
)*100/
COUNT(*),2
) RecoveryRate

FROM items

GROUP BY Location

ORDER BY RecoveryRate DESC;
🎓 Section 3 — Student Analysis
Query 9

Department-wise Reports

SELECT

d.DepartmentName,

COUNT(*) AS Reports

FROM users u

JOIN departments d

ON u.DepartmentID=d.DepartmentID

JOIN items i

ON u.UserID=i.UserID

GROUP BY d.DepartmentName

ORDER BY Reports DESC;
Query 10

Semester-wise Reports

SELECT

Semester,

COUNT(*) AS Reports

FROM users u

JOIN items i

ON u.UserID=i.UserID

GROUP BY Semester

ORDER BY Semester;
💡 Here's what I want to change

Earlier, I suggested writing 60 random SQL queries.

After seeing your project, I think we can do something much better.

Instead of writing random SQL, we'll create a complete analytics case study.

We'll organize the queries into six business modules:

📌 1. Executive KPIs (10 queries)
Total users
Total items
Recovery %
Trade count
Active users
📌 2. User Analytics (10 queries)
Department analysis
Semester analysis
Hostel analysis
Most active users
📌 3. Item Analytics (15 queries)
Category analysis
Value analysis
Status analysis
Verification analysis
📌 4. Location Analytics (10 queries)
Hotspots
Recovery by location
Trends
📌 5. Trade Analytics (10 queries)
Trade success rate
Pending trades
Average completion time
📌 6. Time Analytics (10 queries)
Monthly reports
Weekly trends
Recovery time
Seasonal analysis

That gives us 65+ business-focused SQL queries, all directly tied to the dashboards you'll build later.

🏆 This will make your project feel like a real analytics solution rather than just a collection of SQL exercises.

I recommend we follow this structure from now on, because every query we write will have a clear purpose and can be directly used in your Excel and Power BI dashboards.

i will do it next move next 

Perfect! 👍 That's exactly what I wanted to hear.

Don't worry about writing all 65 SQL queries now. We can complete them gradually.

🚀 Next Phase: Views

Now let's create Views.

Why?

Because in real companies:

Power BI rarely connects directly to raw tables.
It usually connects to Views.
Views simplify complex joins and make dashboards easier to build.

We'll create 5 professional views.

View 1 — User Details

Save in Views.sql

USE collegenet_analytics;

CREATE VIEW vw_UserDetails AS
SELECT
    u.UserID,
    u.ScholarID,
    u.FullName,
    u.UserName,
    u.Gender,
    u.Semester,
    u.Email,
    u.AccountStatus,
    d.DepartmentName,
    h.HostelName
FROM users u
JOIN departments d
    ON u.DepartmentID = d.DepartmentID
LEFT JOIN hostels h
    ON u.HostelID = h.HostelID;
Test
SELECT * FROM vw_UserDetails;
View 2 — Item Details
CREATE VIEW vw_ItemDetails AS
SELECT
    i.ItemID,
    u.FullName,
    c.CategoryName,
    i.ItemTitle,
    i.ItemType,
    i.Status,
    i.Location,
    i.EstimatedValue,
    i.ReportDate,
    i.RecoveredDate,
    i.VerificationStatus
FROM items i
JOIN users u
    ON i.UserID = u.UserID
JOIN categories c
    ON i.CategoryID = c.CategoryID;

Test:

SELECT * FROM vw_ItemDetails;
View 3 — Trade Details
CREATE VIEW vw_TradeDetails AS
SELECT
    t.TradeID,
    i.ItemTitle,
    owner.FullName AS Owner,
    requester.FullName AS Requester,
    t.TradeStatus,
    t.RequestDate,
    t.AcceptedDate,
    t.CompletedDate
FROM trades t
JOIN items i
    ON t.ItemID = i.ItemID
JOIN users owner
    ON t.OwnerID = owner.UserID
JOIN users requester
    ON t.RequesterID = requester.UserID;
View 4 — Recovery Analysis
CREATE VIEW vw_RecoveryAnalysis AS
SELECT
    c.CategoryName,
    COUNT(*) AS TotalItems,
    SUM(CASE
            WHEN i.Status='Recovered'
            THEN 1
            ELSE 0
        END) AS RecoveredItems,
    ROUND(
        SUM(CASE
                WHEN i.Status='Recovered'
                THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
        2
    ) AS RecoveryRate
FROM items i
JOIN categories c
    ON i.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
View 5 — Monthly Reports
CREATE VIEW vw_MonthlyReports AS
SELECT
    YEAR(ReportDate) AS ReportYear,
    MONTH(ReportDate) AS ReportMonth,
    COUNT(*) AS TotalReports
FROM items
GROUP BY
    YEAR(ReportDate),
    MONTH(ReportDate);
📊 Why these Views?

These five views are enough to build almost your entire Power BI dashboard.

View	Dashboard Use
vw_UserDetails	Student Dashboard
vw_ItemDetails	Item Dashboard
vw_TradeDetails	Trade Dashboard
vw_RecoveryAnalysis	Recovery KPIs
vw_MonthlyReports	Trend Charts
🚀 After Views

We'll implement Stored Procedures.

Examples:

sp_GetItemsByCategory
sp_GetUserHistory
sp_GetDepartmentReport
sp_GetMonthlySummary
sp_GetTradeStatistics

These will make your project look much more professional.

📅 Project Roadmap
Phase	Status
Database Design	✅
Data Generation (Python)	✅
SQL Import	✅
SQL Queries	🟡 In Progress
Views	🔜
Stored Procedures	🔜
Triggers	🔜
Excel Dashboard	🔜
Power BI Dashboard	🔜
Documentation	🔜
🎯 My Recommendation

From this point onward, we should stop thinking of this as "just a SQL project."

Let's treat it as a complete Data Analytics Portfolio Project with:

SQL for data storage and analysis.
Python for synthetic data generation.
Excel for quick reporting.
Power BI for executive dashboards.
GitHub with clean documentation and screenshots.

That combination is much stronger for placements than a standalone SQL project, and it aligns well with the skills companies expect from entry-level Data Analysts.

next 

Awesome! 🔥 We're entering the final SQL development phase.

At this point, here's what we've completed:

✅ Database Design
✅ Tables
✅ Constraints
✅ Indexes
✅ Python Data Generation
✅ CSV Import
✅ SQL Queries (started)
✅ Views

Now let's implement Stored Procedures.

📁 Procedures.sql

We'll create useful procedures that a real CollegeNet admin could use.

Procedure 1 — Get Items by Category
USE collegenet_analytics;

DELIMITER $$

CREATE PROCEDURE sp_GetItemsByCategory(
    IN p_CategoryName VARCHAR(100)
)
BEGIN

SELECT
    i.ItemID,
    i.ItemTitle,
    c.CategoryName,
    i.Status,
    i.Location,
    i.EstimatedValue
FROM items i
JOIN categories c
ON i.CategoryID=c.CategoryID
WHERE c.CategoryName=p_CategoryName;

END $$

DELIMITER ;
Execute
CALL sp_GetItemsByCategory('Laptop');
Procedure 2 — Get User History
DELIMITER $$

CREATE PROCEDURE sp_GetUserHistory(
    IN p_UserID INT
)
BEGIN

SELECT
    ItemTitle,
    ItemType,
    Status,
    ReportDate
FROM items
WHERE UserID=p_UserID
ORDER BY ReportDate DESC;

END $$

DELIMITER ;

Execute

CALL sp_GetUserHistory(10);
Procedure 3 — Department Summary
DELIMITER $$

CREATE PROCEDURE sp_DepartmentSummary()
BEGIN

SELECT

d.DepartmentName,

COUNT(i.ItemID) AS TotalReports,

ROUND(AVG(i.EstimatedValue),2) AverageValue

FROM departments d

LEFT JOIN users u

ON d.DepartmentID=u.DepartmentID

LEFT JOIN items i

ON u.UserID=i.UserID

GROUP BY d.DepartmentName

ORDER BY TotalReports DESC;

END $$

DELIMITER ;
Procedure 4 — Monthly Summary
DELIMITER $$

CREATE PROCEDURE sp_MonthlySummary()
BEGIN

SELECT

YEAR(ReportDate) Year,

MONTH(ReportDate) Month,

COUNT(*) Reports,

SUM(
CASE
WHEN Status='Recovered'
THEN 1
ELSE 0
END
) Recovered

FROM items

GROUP BY

YEAR(ReportDate),

MONTH(ReportDate)

ORDER BY

Year,

Month;

END $$

DELIMITER ;
Procedure 5 — Trade Summary
DELIMITER $$

CREATE PROCEDURE sp_TradeSummary()
BEGIN

SELECT

TradeStatus,

COUNT(*) TotalTrades

FROM trades

GROUP BY TradeStatus;

END $$

DELIMITER ;
📌 Test Them

Run:

CALL sp_GetItemsByCategory('Laptop');

CALL sp_GetUserHistory(5);

CALL sp_DepartmentSummary();

CALL sp_MonthlySummary();

CALL sp_TradeSummary();
🚀 Next: Triggers

We'll keep them practical.

Trigger 1 — Prevent Invalid Semester
DELIMITER $$

CREATE TRIGGER trg_CheckSemester
BEFORE INSERT ON users
FOR EACH ROW
BEGIN

IF NEW.Semester < 1 OR NEW.Semester > 8 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Semester must be between 1 and 8';

END IF;

END $$

DELIMITER ;
Trigger 2 — Prevent Negative Estimated Value
DELIMITER $$

CREATE TRIGGER trg_CheckEstimatedValue
BEFORE INSERT ON items
FOR EACH ROW
BEGIN

IF NEW.EstimatedValue < 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Estimated value cannot be negative';

END IF;

END $$

DELIMITER ;
Trigger 3 — Ensure Recovery Date is Valid
DELIMITER $$

CREATE TRIGGER trg_CheckRecoveryDate
BEFORE INSERT ON items
FOR EACH ROW
BEGIN

IF NEW.RecoveredDate IS NOT NULL
AND NEW.RecoveredDate < NEW.ReportDate THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Recovered date cannot be before report date';

END IF;

END $$

DELIMITER ;
📌 Constraints.sql

Since you already have a separate Constraints.sql file, add checks like:

ALTER TABLE users
ADD CONSTRAINT chk_semester
CHECK (Semester BETWEEN 1 AND 8);
ALTER TABLE items
ADD CONSTRAINT chk_estimated_value
CHECK (EstimatedValue >= 0);
📌 Indexes.sql
CREATE INDEX idx_items_category
ON items(CategoryID);

CREATE INDEX idx_items_status
ON items(Status);

CREATE INDEX idx_items_reportdate
ON items(ReportDate);

CREATE INDEX idx_users_department
ON users(DepartmentID);

CREATE INDEX idx_trades_status
ON trades(TradeStatus);
🎯 Where We Are
Phase	Status
Database	✅
Tables	✅
Constraints	✅
Indexes	✅
Data Generation	✅
Data Import	✅
SQL Queries	✅
Views	✅
Stored Procedures	✅
Triggers	✅
🚀 The Final Phase (Most Exciting)

After this, we stop writing SQL code and start the analytics:

📊 Excel Dashboard

We'll build:

KPI cards
Pivot Tables
Pivot Charts
Slicers
Interactive dashboard
📈 Power BI Dashboard

We'll create:

Executive Dashboard
Lost & Found Analysis
User Analysis
Department Analysis
Trade Analysis
Time Trend Analysis
⭐ Before we move on

I want us to spend one session cleaning up the SQL project:

Add comments to each SQL file.
Organize the queries into sections.
Add a professional README.md explaining the database, schema, and analytics objectives.

This polishing step is what turns a working project into a portfolio-quality project that looks impressive on GitHub and during interviews. After that, we'll move to Excel and then Power BI.

views also not done 

You're right. 👍 And I'm glad you stopped me.

We shouldn't skip steps.

Let's complete the project properly.

📍 Current Status
Module	Status
Database	✅
Tables	✅
Constraints	⏳
Indexes	⏳
Queries	🟡
Views	❌
Procedures	❌
Triggers	❌
Excel	❌
Power BI	❌

So Views come next, then Procedures, then Triggers.

📄 Views.sql

We'll create 5 professional views that will later be used in Power BI.

View 1 — User Details
USE collegenet_analytics;

DROP VIEW IF EXISTS vw_UserDetails;

CREATE VIEW vw_UserDetails AS
SELECT
    u.UserID,
    u.ScholarID,
    u.FullName,
    u.UserName,
    u.Gender,
    u.Semester,
    u.Email,
    u.AccountStatus,
    d.DepartmentName,
    h.HostelName
FROM users u
JOIN departments d
    ON u.DepartmentID = d.DepartmentID
LEFT JOIN hostels h
    ON u.HostelID = h.HostelID;

Test:

SELECT * FROM vw_UserDetails;
View 2 — Item Details
DROP VIEW IF EXISTS vw_ItemDetails;

CREATE VIEW vw_ItemDetails AS
SELECT
    i.ItemID,
    u.FullName,
    c.CategoryName,
    i.ItemTitle,
    i.Description,
    i.ItemType,
    i.Status,
    i.Location,
    i.Brand,
    i.Color,
    i.EstimatedValue,
    i.ReportDate,
    i.RecoveredDate,
    i.VerificationStatus
FROM items i
JOIN users u
    ON i.UserID = u.UserID
JOIN categories c
    ON i.CategoryID = c.CategoryID;

Test:

SELECT * FROM vw_ItemDetails;
View 3 — Trade Details
DROP VIEW IF EXISTS vw_TradeDetails;

CREATE VIEW vw_TradeDetails AS
SELECT
    t.TradeID,
    i.ItemTitle,
    owner.FullName AS OwnerName,
    requester.FullName AS RequesterName,
    t.TradeStatus,
    t.RequestDate,
    t.AcceptedDate,
    t.CompletedDate
FROM trades t
JOIN items i
    ON t.ItemID = i.ItemID
JOIN users owner
    ON t.OwnerID = owner.UserID
JOIN users requester
    ON t.RequesterID = requester.UserID;

Test:

SELECT * FROM vw_TradeDetails;
View 4 — Recovery Analysis
DROP VIEW IF EXISTS vw_RecoveryAnalysis;

CREATE VIEW vw_RecoveryAnalysis AS
SELECT
    c.CategoryName,
    COUNT(*) AS TotalItems,
    SUM(CASE
            WHEN i.Status='Recovered' THEN 1
            ELSE 0
        END) AS RecoveredItems,
    ROUND(
        SUM(CASE
                WHEN i.Status='Recovered' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
        2
    ) AS RecoveryRate
FROM items i
JOIN categories c
    ON i.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

Test:

SELECT * FROM vw_RecoveryAnalysis;
View 5 — Monthly Reports
DROP VIEW IF EXISTS vw_MonthlyReports;

CREATE VIEW vw_MonthlyReports AS
SELECT
    YEAR(ReportDate) AS ReportYear,
    MONTH(ReportDate) AS ReportMonth,
    COUNT(*) AS TotalReports,
    SUM(CASE
            WHEN Status='Recovered' THEN 1
            ELSE 0
        END) AS RecoveredItems
FROM items
GROUP BY
    YEAR(ReportDate),
    MONTH(ReportDate);

Test:

SELECT * FROM vw_MonthlyReports;
📊 Why These Views?

These are not random views.

Each one is created specifically for analytics.

View	Purpose
vw_UserDetails	User dashboard
vw_ItemDetails	Item dashboard
vw_TradeDetails	Trade dashboard
vw_RecoveryAnalysis	KPI cards
vw_MonthlyReports	Trend analysis

These are exactly the kinds of views that Power BI can connect to directly.

🚀 After Views

The order will be:

✅ Views
✅ Procedures
✅ Triggers
✅ Constraints
✅ Indexes
✅ Excel Dashboard
✅ Power BI Dashboard
✅ GitHub Documentation
🎯 One More Suggestion

Before we move to Procedures, execute each view immediately after creating it:

SELECT * FROM vw_UserDetails LIMIT 10;

SELECT * FROM vw_ItemDetails LIMIT 10;

SELECT * FROM vw_TradeDetails LIMIT 10;

SELECT * FROM vw_RecoveryAnalysis;

SELECT * FROM vw_MonthlyReports;

This helps us verify that each view is correct before building the next layer. If any view has a join or column issue, we'll fix it immediately rather than discovering it later in Power BI.

next

Excellent! 🔥

Now that we've completed Views, let's move to Stored Procedures.

This is where your project starts looking like an industry-level SQL project, because companies use stored procedures to encapsulate reusable business logic.

📂 Procedures.sql

Add the following procedures one by one.

Procedure 1 — Get Items by Category
USE collegenet_analytics;

DROP PROCEDURE IF EXISTS sp_GetItemsByCategory;

DELIMITER $$

CREATE PROCEDURE sp_GetItemsByCategory(
    IN p_CategoryName VARCHAR(100)
)
BEGIN

    SELECT
        i.ItemID,
        i.ItemTitle,
        c.CategoryName,
        i.Status,
        i.Location,
        i.EstimatedValue,
        i.ReportDate
    FROM items i
    JOIN categories c
        ON i.CategoryID = c.CategoryID
    WHERE c.CategoryName = p_CategoryName;

END $$

DELIMITER ;
Test
CALL sp_GetItemsByCategory('Laptop');
Procedure 2 — User Activity
DROP PROCEDURE IF EXISTS sp_GetUserActivity;

DELIMITER $$

CREATE PROCEDURE sp_GetUserActivity(
    IN p_UserID INT
)
BEGIN

    SELECT
        ItemTitle,
        ItemType,
        Status,
        ReportDate
    FROM items
    WHERE UserID = p_UserID
    ORDER BY ReportDate DESC;

END $$

DELIMITER ;
Test
CALL sp_GetUserActivity(10);
Procedure 3 — Department Summary
DROP PROCEDURE IF EXISTS sp_DepartmentSummary;

DELIMITER $$

CREATE PROCEDURE sp_DepartmentSummary()
BEGIN

    SELECT
        d.DepartmentName,
        COUNT(i.ItemID) AS TotalReports,
        ROUND(AVG(i.EstimatedValue),2) AS AverageItemValue
    FROM departments d
    LEFT JOIN users u
        ON d.DepartmentID = u.DepartmentID
    LEFT JOIN items i
        ON u.UserID = i.UserID
    GROUP BY d.DepartmentName
    ORDER BY TotalReports DESC;

END $$

DELIMITER ;
Test
CALL sp_DepartmentSummary();
Procedure 4 — Monthly Summary
DROP PROCEDURE IF EXISTS sp_MonthlySummary;

DELIMITER $$

CREATE PROCEDURE sp_MonthlySummary()
BEGIN

    SELECT
        YEAR(ReportDate) AS ReportYear,
        MONTH(ReportDate) AS ReportMonth,
        COUNT(*) AS TotalReports,
        SUM(
            CASE
                WHEN Status='Recovered' THEN 1
                ELSE 0
            END
        ) AS RecoveredItems
    FROM items
    GROUP BY
        YEAR(ReportDate),
        MONTH(ReportDate)
    ORDER BY
        ReportYear,
        ReportMonth;

END $$

DELIMITER ;
Test
CALL sp_MonthlySummary();
Procedure 5 — Trade Statistics
DROP PROCEDURE IF EXISTS sp_TradeStatistics;

DELIMITER $$

CREATE PROCEDURE sp_TradeStatistics()
BEGIN

    SELECT
        TradeStatus,
        COUNT(*) AS TotalTrades
    FROM trades
    GROUP BY TradeStatus;

END $$

DELIMITER ;

CALL sp_TradeStatistics();