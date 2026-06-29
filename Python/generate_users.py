import pandas as pd
from config import TOTAL_USERS
from names import FIRST_NAMES, LAST_NAMES
import os

from utils import (
    generate_full_name,
    generate_username,
    generate_email,
    generate_gender,
    generate_semester,
    generate_department,
    generate_hostel,
    generate_registration_date,
    generate_roll_number,
    generate_account_status
)

# ----------------------------------
# Store Generated Users
# ----------------------------------

users = []
used_usernames = set()

# Keeps track of serial numbers
roll_serial = {}

# ----------------------------------
# Generate Users
# ----------------------------------

for user_id in range(1, TOTAL_USERS + 1):
    gender = generate_gender()
    semester = generate_semester()
    department_id = generate_department()
    hostel_id = generate_hostel(gender)
    registration_date = generate_registration_date(semester)
    admission_year = registration_date.year
    key = (admission_year, department_id)
    if key not in roll_serial:
        roll_serial[key] = 1
    serial = roll_serial[key]
    scholar_id = generate_roll_number(
        admission_year,
        department_id,
        serial
    )
    roll_serial[key] += 1
    full_name = generate_full_name(
        FIRST_NAMES,
        LAST_NAMES
    )
    username = generate_username(full_name)
    while username in used_usernames:
        username = generate_username(full_name)
    used_usernames.add(username)
    email = generate_email(username)
    account_status = generate_account_status()
    users.append({
        "UserID": user_id,
        "DepartmentID": department_id,
        "HostelID": hostel_id,
        "ScholarID": scholar_id,
        "FullName": full_name,
        "UserName": username,
        "Gender": gender,
        "Semester": semester,
        "Email": email,
        "RegistrationDate": registration_date,
        "AccountStatus": account_status
    })

# ----------------------------------
# Export CSV
# ----------------------------------

df = pd.DataFrame(users)
os.makedirs("generated_data", exist_ok=True)
df.to_csv(
    "generated_data/users.csv",
    index=False
)

print("users.csv generated successfully!")