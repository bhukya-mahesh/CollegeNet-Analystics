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
    
    SELECT * FROM vw_UserDetails;
    

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
    
SELECT * FROM vw_ItemDetails;



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
    
SELECT * FROM vw_TradeDetails;


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

SELECT * FROM vw_RecoveryAnalysis;


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
    
SELECT * FROM vw_MonthlyReports;

