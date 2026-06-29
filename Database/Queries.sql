SELECT
    d.DepartmentName,
    COUNT(i.ItemID) AS LostItems
FROM items i
JOIN users u
ON i.UserID = u.UserID
JOIN departments d
ON u.DepartmentID = d.DepartmentID
WHERE i.ItemType = 'Lost'
GROUP BY d.DepartmentName
ORDER BY LostItems DESC;

SELECT
    u.UserID,
    u.FullName,
    COUNT(i.ItemID) AS TotalReports
FROM users u
JOIN items i
ON u.UserID = i.UserID
GROUP BY u.UserID, u.FullName
ORDER BY TotalReports DESC
LIMIT 10;

SELECT
    Location,
    COUNT(*) AS TotalLost
FROM items
WHERE ItemType = 'Lost'
GROUP BY Location
ORDER BY TotalLost DESC;


SELECT
    c.CategoryName,
    ROUND(AVG(i.EstimatedValue),2) AS AverageValue
FROM items i
JOIN categories c
ON i.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY AverageValue DESC;

SELECT
    c.CategoryName,
    COUNT(*) AS TotalItems,
    SUM(CASE WHEN i.Status='Recovered' THEN 1 ELSE 0 END) AS RecoveredItems,
    ROUND(
        SUM(CASE WHEN i.Status='Recovered' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS RecoveryRate
FROM items i
JOIN categories c
ON i.CategoryID=c.CategoryID
GROUP BY c.CategoryName
ORDER BY RecoveryRate DESC;

SELECT
    YEAR(ReportDate) AS Year,
    MONTH(ReportDate) AS Month,
    COUNT(*) AS Reports
FROM items
GROUP BY YEAR(ReportDate), MONTH(ReportDate)
ORDER BY Year, Month;

SELECT
    VerificationStatus,
    COUNT(*) AS TotalItems
FROM items
GROUP BY VerificationStatus;

SELECT
    ItemTitle,
    EstimatedValue,
    Location
FROM items
ORDER BY EstimatedValue DESC
LIMIT 5;

SELECT
    ItemID,
    ItemTitle,
    Location,
    ReportDate
FROM items
WHERE Status='Open'
ORDER BY ReportDate DESC;

SELECT
    TradeStatus,
    COUNT(*) AS TotalTrades
FROM trades
GROUP BY TradeStatus;

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

SELECT
    ROUND(AVG(DATEDIFF(RecoveredDate, ReportDate)),2)
    AS AverageRecoveryDays
FROM items
WHERE Status='Recovered';

SELECT DISTINCT
    c.CategoryName
FROM categories c
JOIN items i
ON c.CategoryID=i.CategoryID
WHERE i.Status<>'Recovered';


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

SELECT
    c.CategoryName,
    MAX(i.EstimatedValue) AS HighestValue
FROM items i
JOIN categories c
ON i.CategoryID=c.CategoryID
GROUP BY c.CategoryName;

SELECT
    ItemTitle,
    CategoryID,
    EstimatedValue,
    RANK() OVER(
        ORDER BY EstimatedValue DESC
    ) AS ItemRank
FROM items;

SELECT
    CategoryID,
    ItemTitle,
    EstimatedValue,
    DENSE_RANK() OVER(
        PARTITION BY CategoryID
        ORDER BY EstimatedValue DESC
    ) AS RankInCategory
FROM items;

SELECT
    ReportDate,
    COUNT(*) AS DailyReports,
    SUM(COUNT(*))
    OVER(
        ORDER BY ReportDate
    ) AS RunningTotal
FROM items
GROUP BY ReportDate;

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

SELECT
ItemTitle,
EstimatedValue,
Location
FROM items
WHERE ItemType='Lost'
ORDER BY EstimatedValue DESC
LIMIT 1;

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