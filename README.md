# 🎓 CollegeNet Analytics

> A complete end-to-end Data Analytics project built using **SQL, Python, Excel, and Power BI** on a realistic college Lost & Found and Trading platform.

---

## 📌 Project Overview

**CollegeNet Analytics** is a data analytics project developed on top of a custom-designed college Lost & Found and Trading system.

Instead of using publicly available datasets, this project uses **synthetically generated data** created with Python to simulate real-world student activities such as reporting lost items, finding belongings, and trading items within a college campus.

The project demonstrates the complete data analytics lifecycle:

- Database Design
- Data Generation
- Data Cleaning
- Data Storage
- SQL Analysis
- Business Intelligence
- Dashboard Development

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| MySQL | Database Design & SQL Analytics |
| Python | Dummy Data Generation |
| Excel | Data Analysis & Dashboard |
| Power BI | Interactive Dashboard |
| Git & GitHub | Version Control |

---

# 📂 Project Structure

```
CollegeNet-Analytics/

│
├── Database/
│   ├── Create_Database.sql
│   ├── Create_Tables.sql
│   ├── Insert_Data.sql
│   ├── Constraints.sql
│   ├── Indexes.sql
│   ├── Queries.sql
│   ├── Views.sql
│   ├── Procedures.sql
│   └── Triggers.sql
│
├── Python/
│   ├── config.py
│   ├── names.py
│   ├── items.py
│   ├── generate_users.py
│   ├── generate_items.py
│   ├── generate_trades.py
│   └── generated_data/
│
└── README.md
```

---

# 🗄 Database Design

The database is fully normalized and designed using relational database principles.

## Tables

- Departments
- Hostels
- Categories
- Users
- Items
- Trades

---

## Relationships

```
Departments
      │
      │
Users ───── Items ───── Categories
  │            │
  │            │
  └──────── Trades
```

---

# 📊 Data Generation

Since no real dataset was available, realistic dummy data was generated using Python.

Generated datasets include:

- 👨‍🎓 Users
- 📦 Items
- 🔄 Trades

The generated data follows realistic business rules such as:

- Semester-based student registration
- Department-wise user allocation
- Hostel allocation
- Item categories
- Estimated item values
- Recovery dates
- Trade requests
- Verification status

---

# 🧠 SQL Features Implemented

## Database

- Database Creation
- Table Creation
- Foreign Keys
- Primary Keys
- Constraints

---

## SQL Queries

Business-focused SQL queries including:

- Total Users
- Total Items
- Recovery Rate
- Department Analysis
- Semester Analysis
- Category Analysis
- Monthly Reports
- Trade Statistics
- Location Analysis
- User Activity

---

## SQL Objects

Implemented:

- Views
- Stored Procedures
- Triggers
- Indexes

---

# 📈 Analytics Objectives

The project answers business questions such as:

- Which department reports the highest number of lost items?
- Which item categories are lost most frequently?
- What is the recovery rate?
- Which campus locations have the most lost items?
- Which students are the most active users?
- What are the monthly reporting trends?
- Which trades are completed successfully?

---

# 📊 Dataset Summary

| Dataset | Records |
|----------|--------:|
| Departments | 6 |
| Hostels | 5 |
| Categories | 20 |
| Users | 100+ |
| Items | 300+ |
| Trades | 30+ |

> The data generation scripts can easily be scaled to generate thousands of records.

---

# 🚀 Project Workflow

```
Python
   │
   ▼
Generate Dummy Data
   │
   ▼
CSV Files
   │
   ▼
MySQL Database
   │
   ▼
SQL Queries
   │
   ▼
Views & Procedures
   │
   ▼
Excel Dashboard
   │
   ▼
Power BI Dashboard
```

---

# 📌 Current Progress

- ✅ Database Design
- ✅ Relational Schema
- ✅ Dummy Data Generation
- ✅ Data Import into MySQL
- ✅ SQL Queries
- ✅ Views
- ✅ Stored Procedures
- ✅ Triggers

---

# 📸 Upcoming Features

- Executive Dashboard
- Lost & Found Dashboard
- User Analytics Dashboard
- Trade Analytics Dashboard
- Interactive Power BI Reports
- Excel Dashboard
- KPI Cards
- Pivot Tables
- Trend Analysis

---

# 🎯 Learning Outcomes

This project demonstrates practical knowledge of:

- Database Design
- SQL Programming
- Data Modeling
- Data Cleaning
- Python Automation
- Business Analytics
- Dashboard Development
- Data Visualization
- End-to-End Analytics Workflow

---

# 👨‍💻 Author

**Mahesh Bhukya**

B.Tech – Electronics & Communication Engineering

Aspiring Data Analyst | SQL | Python | Power BI | Excel

GitHub: https://github.com/bhukya-mahesh

---

## ⭐ If you found this project helpful, consider giving it a star!
