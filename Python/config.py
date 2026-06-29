# ==========================================
# CollegeNet Analytics Project
# Configuration File
# ==========================================

# -------------------------------
# Number of Records to Generate
# -------------------------------
TOTAL_USERS = 100         
TOTAL_ITEMS = 300
TOTAL_TRADES = 50


# -------------------------------
# College Email Domain
# -------------------------------
EMAIL_DOMAIN = "@nits.ac.in"


# -------------------------------
# Date Range
# -------------------------------
START_DATE = "2024-01-01"
END_DATE = "2025-12-31"


# -------------------------------
# Random Seed
# -------------------------------
RANDOM_SEED = 42


# -------------------------------
# Department IDs
# (Must match SQL table)
# -------------------------------
DEPARTMENTS = {
    1: "Computer Science and Engineering",
    2: "Electronics and Communication Engineering",
    3: "Electronics and Instrumentation Engineering",
    4: "Electrical Engineering",
    5: "Mechanical Engineering",
    6: "Civil Engineering"
}


# -------------------------------
# Hostel IDs
# (Must match SQL table)
# -------------------------------
HOSTELS = {
    1: "BH-1",
    2: "BH-2",
    3: "BH-3",
    4: "GH-1",
    5: "GH-2"
}


# -------------------------------
# Department Codes
# Used for Roll Number Generation
# -------------------------------
DEPARTMENT_CODES = {
    1: "01",
    2: "02",
    3: "03",
    4: "04",
    5: "05",
    6: "06"
}

LOCATIONS = [

"Central Library",
"Main Library",
"Main Canteen",
"CSE Block",
"ECE Block",
"EIE Block",
"EE Block",
"Mechanical Block",
"Civil Block",
"Sports Complex",
"Auditorium",
"Admin Block",
"Health Centre",
"Main Gate",
"Parking Area",
"Student Activity Centre",
"BH-1",
"BH-2",
"BH-3",
"GH-1",
"GH-2"

]