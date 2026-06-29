import random
import os
from datetime import timedelta

import pandas as pd

from config import TOTAL_ITEMS, LOCATIONS
from items import (
    CATEGORIES,
    CATEGORY_WEIGHTS,
    ITEM_TITLES,
    PRICE_RANGES,
    CATEGORY_BRANDS,
    CATEGORY_COLORS,
    ITEM_TYPES,
    ITEM_TYPE_WEIGHTS,
    STATUS,
    STATUS_WEIGHTS,
    VERIFICATION_STATUS,
    VERIFICATION_WEIGHTS
)

# -------------------------------
# Read Users
# -------------------------------

users = pd.read_csv("generated_data/users.csv")

# -------------------------------
# Store Items
# -------------------------------

items = []

# -------------------------------
# Generate Items
# -------------------------------

for item_id in range(1, TOTAL_ITEMS + 1):

    # Select Random User
    user = users.sample(1).iloc[0]

    user_id = int(user["UserID"])

    registration_date = pd.to_datetime(user["RegistrationDate"])

    # ---------------------------
    # Category
    # ---------------------------

    category_id = random.choices(
        population=list(CATEGORY_WEIGHTS.keys()),
        weights=list(CATEGORY_WEIGHTS.values()),
        k=1
    )[0]

    category = CATEGORIES[category_id]

    # ---------------------------
    # Title
    # ---------------------------

    item_title = random.choice(
        ITEM_TITLES[category]
    )

    # ---------------------------
    # Description
    # ---------------------------

    location = random.choice(LOCATIONS)

     # ---------------------------
    # Item Type
    # ---------------------------

    item_type = random.choices(
        ITEM_TYPES,
        weights=ITEM_TYPE_WEIGHTS,
        k=1
    )[0]


    description = (
    f"{item_title} reported as "
    f"{item_type.lower()} "
    f"near {location}."
)

    # ---------------------------
    # Status
    # ---------------------------

    status = random.choices(
        STATUS,
        weights=STATUS_WEIGHTS,
        k=1
    )[0]

    # ---------------------------
    # Verification
    # ---------------------------

    verification = random.choices(
        VERIFICATION_STATUS,
        weights=VERIFICATION_WEIGHTS,
        k=1
    )[0]

    # ---------------------------
    # Brand
    # ---------------------------

    if category in CATEGORY_BRANDS:
        brand = random.choice(
            CATEGORY_BRANDS[category]
        )
    else:
        brand = None

    # ---------------------------
    # Color
    # ---------------------------

    if category in CATEGORY_COLORS:
        color = random.choice(
            CATEGORY_COLORS[category]
        )
    else:
        color = None

    # ---------------------------
    # Price
    # ---------------------------

    low, high = PRICE_RANGES[category]

    estimated_value = random.randint(
        low,
        high
    )

    # ---------------------------
    # Report Date
    # ---------------------------

    report_date = registration_date + timedelta(
        days=random.randint(1, 365)
    )

    # ---------------------------
    # Recovery Date
    # ---------------------------

    recovered_date = None

    if status == "Recovered":

        recovered_date = report_date + timedelta(
            days=random.randint(1, 30)
        )

    # ---------------------------
    # Store Record
    # ---------------------------

    items.append({

        "ItemID": item_id,

        "UserID": user_id,

        "CategoryID": category_id,

        "ItemTitle": item_title,

        "Description": description,

        "ItemType": item_type,

        "Status": status,

        "Location": location,

        "Brand": brand,

        "Color": color,

        "EstimatedValue": estimated_value,

        "ReportDate": report_date.date(),

        "RecoveredDate": (
            recovered_date.date()
            if recovered_date is not None
            else None
        ),

        "VerificationStatus": verification

    })

# -------------------------------
# Export CSV
# -------------------------------

df = pd.DataFrame(items)

os.makedirs("generated_data", exist_ok=True)

df.to_csv(
    "generated_data/items.csv",
    index=False
)

print("items.csv generated successfully!")