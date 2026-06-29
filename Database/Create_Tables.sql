USE collegenet_analytics; 

CREATE TABLE Departments
(
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE

);

CREATE TABLE Hostels
(
    HostelID INT AUTO_INCREMENT PRIMARY KEY,
    HostelName VARCHAR(50) NOT NULL UNIQUE,
    HostelType ENUM('Boys','Girls') NOT NULL
);


CREATE TABLE Users
(
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentID INT NOT NULL,
    HostelID INT,
    ScholarID VARCHAR(20) NOT NULL UNIQUE,
    UserName VARCHAR(50) NOT NULL UNIQUE,
    Gender ENUM('Male','Female','Other') NOT NULL,
    Semester TINYINT NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL,
    CONSTRAINT chk_semester
        CHECK (Semester BETWEEN 1 AND 8),
    CONSTRAINT fk_user_department
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID),
    CONSTRAINT fk_user_hostel
        FOREIGN KEY (HostelID)
        REFERENCES Hostels(HostelID)
);

ALTER TABLE users
CHANGE COLUMN RollNumber ScholarID VARCHAR(20) NOT NULL;

ALTER TABLE users
ADD COLUMN FullName VARCHAR(100) NOT NULL
AFTER ScholarID;

ALTER TABLE users
ADD COLUMN AccountStatus
ENUM('Active','Inactive')
NOT NULL
DEFAULT 'Active'
AFTER RegistrationDate;


CREATE TABLE Categories
(
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Items
(
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    CategoryID INT NOT NULL,
    ItemTitle VARCHAR(150) NOT NULL,
    Description TEXT,
    ItemType ENUM
    (
        'Lost',
        'Found',
        'Trade',
        'Wanted'
    ) NOT NULL,
    Status ENUM
    (
        'Open',
        'Matched',
        'Recovered',
        'Closed',
        'Cancelled'
    ) NOT NULL DEFAULT 'Open',
    Location VARCHAR(100) NOT NULL,
    Brand VARCHAR(50),
    Color VARCHAR(30),
    EstimatedValue DECIMAL(10,2),
    ReportDate DATE NOT NULL,
    RecoveredDate DATE,
    VerificationStatus ENUM
    (
        'Pending',
        'Verified',
        'Rejected'
    ) DEFAULT 'Pending',
    CONSTRAINT chk_item_value
        CHECK (EstimatedValue >= 0),
    CONSTRAINT chk_recovery_date
        CHECK
        (
            RecoveredDate IS NULL
            OR
            RecoveredDate >= ReportDate
        ),
    CONSTRAINT fk_item_user
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),
    CONSTRAINT fk_item_category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


CREATE TABLE Trades
(
    TradeID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT NOT NULL,
    RequesterID INT NOT NULL,
    OwnerID INT NOT NULL,
    TradeStatus ENUM
    (
        'Pending',
        'Accepted',
        'Rejected',
        'Completed',
        'Cancelled'
    ) DEFAULT 'Pending',
    RequestDate DATE NOT NULL,
    AcceptedDate DATE,
    CompletedDate DATE,
    CONSTRAINT chk_trade_users
        CHECK (RequesterID <> OwnerID),
    CONSTRAINT chk_accept_date
        CHECK
        (
            AcceptedDate IS NULL
            OR
            AcceptedDate >= RequestDate
        ),
    CONSTRAINT chk_complete_date
        CHECK
        (
            CompletedDate IS NULL
            OR
            CompletedDate >= AcceptedDate
        ),
    CONSTRAINT fk_trade_item
        FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID),
    CONSTRAINT fk_trade_requester
        FOREIGN KEY (RequesterID)
        REFERENCES Users(UserID),
    CONSTRAINT fk_trade_owner
        FOREIGN KEY (OwnerID)
        REFERENCES Users(UserID)
);

SELECT COUNT(*) AS Departments FROM departments;
SELECT COUNT(*) AS Hostels FROM hostels;
SELECT COUNT(*) AS Categories FROM categories;
SELECT COUNT(*) AS Users FROM users;
SELECT COUNT(*) AS Items FROM items;
SELECT COUNT(*) AS Trades FROM trades;