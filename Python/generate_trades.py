import os
import random
from datetime import timedelta

import pandas as pd

from config import TOTAL_TRADES

# ----------------------------
# Read CSV Files
# ----------------------------

users = pd.read_csv("generated_data/users.csv")
items = pd.read_csv("generated_data/items.csv")

# ----------------------------
# Keep Only Trade Items
# ----------------------------

trade_items = items[
    items["ItemType"] == "Trade"
]

trades = []

statuses = [
    "Pending",
    "Accepted",
    "Rejected",
    "Completed",
    "Cancelled"
]

weights = [
    20,
    25,
    15,
    30,
    10
]

# ----------------------------
# Generate Trades
# ----------------------------

for trade_id in range(1, TOTAL_TRADES + 1):

    item = trade_items.sample(1).iloc[0]

    item_id = int(item["ItemID"])

    owner_id = int(item["UserID"])

    requester = users.sample(1).iloc[0]

    requester_id = int(requester["UserID"])

    while requester_id == owner_id:

        requester = users.sample(1).iloc[0]

        requester_id = int(requester["UserID"])

    report_date = pd.to_datetime(
        item["ReportDate"]
    )

    request_date = report_date + timedelta(
        days=random.randint(1, 20)
    )

    status = random.choices(
        statuses,
        weights=weights,
        k=1
    )[0]

    accepted_date = None
    completed_date = None

    if status in ["Accepted", "Completed"]:

        accepted_date = request_date + timedelta(
            days=random.randint(1, 5)
        )

    if status == "Completed":

        completed_date = accepted_date + timedelta(
            days=random.randint(1, 10)
        )

    trades.append({

        "TradeID": trade_id,

        "ItemID": item_id,

        "RequesterID": requester_id,

        "OwnerID": owner_id,

        "TradeStatus": status,

        "RequestDate": request_date.date(),

        "AcceptedDate":
            accepted_date.date()
            if accepted_date is not None
            else None,

        "CompletedDate":
            completed_date.date()
            if completed_date is not None
            else None

    })

# ----------------------------
# Export
# ----------------------------

df = pd.DataFrame(trades)

os.makedirs(
    "generated_data",
    exist_ok=True
)

df.to_csv(
    "generated_data/trades.csv",
    index=False
)

print("trades.csv generated successfully!")