# ==========================================
# Item Categories
# ==========================================

CATEGORIES = {
    1: "Laptop",
    2: "Mobile Phone",
    3: "Wallet",
    4: "Keys",
    5: "ID Card",
    6: "Books",
    7: "Notebook",
    8: "Calculator",
    9: "Watch",
    10: "Earphones",
    11: "Water Bottle",
    12: "Backpack",
    13: "Documents",
    14: "Clothing",
    15: "Sports Equipment",
    16: "Umbrella",
    17: "Power Bank",
    18: "USB Drive",
    19: "Spectacles",
    20: "Jewellery"
}

PRICE_RANGES = {
    "Laptop": (35000, 90000),
    "Mobile Phone": (8000, 70000),
    "Wallet": (300, 3000),
    "Keys": (100, 800),
    "ID Card": (100, 300),
    "Books": (250, 2000),
    "Notebook": (50, 400),
    "Calculator": (300, 2000),
    "Watch": (500, 10000),
    "Earphones": (500, 5000),
    "Water Bottle": (150, 1500),
    "Backpack": (500, 4000),
    "Documents": (50, 300),
    "Clothing": (500, 5000),
    "Sports Equipment": (1000, 15000),
    "Umbrella": (200, 1500),
    "Power Bank": (700, 4000),
    "USB Drive": (300, 2000),
    "Spectacles": (800, 12000),
    "Jewellery": (1000, 50000)
}

ITEM_TITLES = {
    "Laptop":[
        "Dell Laptop",
        "HP Laptop",
        "Lenovo Laptop",
        "MacBook",
        "Asus Laptop"
    ],
    "Mobile Phone":[
        "Samsung Phone",
        "iPhone",
        "OnePlus Phone",
        "Realme Phone",
        "Motorola Phone"
    ],
    "Wallet":[
        "Brown Wallet",
        "Black Wallet"
    ],
    "Keys":[
        "Bike Keys",
        "Scooter Keys",
        "Room Keys"
    ],
    "ID Card":[
        "Student ID Card"
    ],
    "Books":[
        "Engineering Textbook",
        "Programming Book",
        "Mathematics Book"
    ],
    "Notebook":[
        "Class Notebook"
    ],
    "Calculator":[
        "Scientific Calculator"
    ],
    "Watch":[
        "Digital Watch",
        "Analog Watch"
    ],
    "Earphones":[
        "Wireless Earphones",
        "Wired Earphones"
    ],
    "Water Bottle":[
        "Steel Water Bottle",
        "Plastic Bottle"
    ],
    "Backpack":[
        "College Backpack"
    ],
    "Documents":[
        "Important Documents"
    ],
    "Clothing":[
        "Jacket",
        "Hoodie",
        "Lab Coat"
    ],
    "Sports Equipment":[
        "Cricket Bat",
        "Football",
        "Badminton Racket"
    ],
    "Umbrella":[
        "Black Umbrella"
    ],
    "Power Bank":[
        "10000mAh Power Bank"
    ],
    "USB Drive":[
        "32GB USB Drive",
        "64GB USB Drive"
    ],
    "Spectacles":[
        "Reading Glasses"
    ],
    "Jewellery":[
        "Gold Ring",
        "Silver Chain"
    ]
}

CATEGORY_BRANDS = {
    "Laptop":["Dell","HP","Lenovo","Apple","Asus"],
    "Mobile Phone":["Samsung","Apple","OnePlus","Realme","Motorola"],
    "Earphones":["Boat","Sony","JBL"],
    "Watch":["Titan","Casio","Fastrack"],
    "Backpack":["Skybags","Wildcraft","American Tourister"],
    "Power Bank":["Mi","Ambrane","Boat"],
    "USB Drive":["SanDisk","HP","Kingston"],
    "Sports Equipment":["SG","MRF","Cosco"],
    "Spectacles":["Lenskart"],
    "Wallet":["Wildcraft"],
    "Water Bottle":["Milton","Cello"]
}

CATEGORY_WEIGHTS = {
    1:5,
    2:5,
    3:14,
    4:16,
    5:18,
    6:10,
    7:8,
    8:2,
    9:3,
    10:4,
    11:7,
    12:6,
    13:2,
    14:1,
    15:1,
    16:1,
    17:2,
    18:1,
    19:2,
    20:1
}

CATEGORY_COLORS = {
    "Laptop":["Black","Silver","Grey"],
    "Mobile Phone":["Black","Blue","White"],
    "Wallet":["Black","Brown"],
    "Backpack":["Black","Blue","Grey"],
    "Earphones":["Black","White"],
    "Watch":["Black","Silver"],
    "Water Bottle":["Blue","Red","Black"],
    "Power Bank":["Black","White"],
    "USB Drive":["Black"],
    "Umbrella":["Black","Blue"],
    "Spectacles":["Black","Brown"]
}


ITEM_TYPES = ["Lost", "Found", "Trade", "Wanted"]
ITEM_TYPE_WEIGHTS = [45, 30, 15, 10]
STATUS = ["Recovered", "Open", "Matched", "Cancelled"]
STATUS_WEIGHTS = [65, 20, 10, 5]
VERIFICATION_STATUS = ["Verified", "Pending", "Rejected"]
VERIFICATION_WEIGHTS = [85, 10, 5]