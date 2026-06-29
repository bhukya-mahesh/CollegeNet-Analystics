# ==========================================
# CollegeNet Analytics Project
# Utility Functions
# ==========================================

import random
from datetime import datetime, timedelta

from config import (
    EMAIL_DOMAIN,
    DEPARTMENT_CODES,
    RANDOM_SEED
)

random.seed(RANDOM_SEED)


# ------------------------------------------
# Generate Full Name
# ------------------------------------------
def generate_full_name(first_names, last_names):
    first = random.choice(first_names)
    last = random.choice(last_names)
    return f"{first} {last}"


# ------------------------------------------
# Generate Username
# ------------------------------------------
def generate_username(full_name):
    name = full_name.lower().replace(" ", "_")
    number = random.randint(100, 999)
    return f"{name}{number}"


# ------------------------------------------
# Generate Email
# ------------------------------------------
def generate_email(username):
    return username + EMAIL_DOMAIN


# ------------------------------------------
# Generate Semester
# ------------------------------------------
def generate_semester():

    semesters = [1,2,3,4,5,6,7,8]

    weights = [8,10,14,16,18,18,10,6]

    return random.choices(semesters, weights=weights, k=1)[0]


# ------------------------------------------
# Generate Gender
# ------------------------------------------
def generate_gender():

    return random.choice(["Male","Female"])


# ------------------------------------------
# Generate Department
# ------------------------------------------
def generate_department():

    departments = [1,2,3,4,5,6]

    weights = [24,20,12,14,18,12]

    return random.choices(
        departments,
        weights=weights,
        k=1
    )[0]


# ------------------------------------------
# Generate Hostel
# ------------------------------------------
def generate_hostel(gender):

    if gender == "Male":
        return random.choice([1,2,3])

    return random.choice([4,5])


# ------------------------------------------
# Generate Registration Date
# ------------------------------------------
def generate_registration_date(semester):

    if semester in [1,2]:
        year = 2025

    elif semester in [3,4]:
        year = 2024

    elif semester in [5,6]:
        year = 2023

    else:
        year = 2022

    start = datetime(year,7,1)

    end = datetime(year,9,30)

    random_days = random.randint(
        0,
        (end-start).days
    )

    return (
        start +
        timedelta(days=random_days)
    ).date()


# ------------------------------------------
# Generate Roll Number
# ------------------------------------------
def generate_roll_number(
    year,
    department_id,
    serial
):

    year = str(year)[-2:]

    department = DEPARTMENT_CODES[
        department_id
    ]

    return (
        f"{year}"
        f"{department}"
        f"{serial:03d}"
    )


# ------------------------------------------
# Generate Account Status
# ------------------------------------------
def generate_account_status():

    return random.choices(
        ["Active","Inactive"],
        weights=[95,5],
        k=1
    )[0]

