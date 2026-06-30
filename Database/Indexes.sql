CREATE INDEX idx_users_department
ON users(DepartmentID);

CREATE INDEX idx_users_semester
ON users(Semester);

CREATE INDEX idx_items_category
ON items(CategoryID);

CREATE INDEX idx_items_status
ON items(Status);

CREATE INDEX idx_items_reportdate
ON items(ReportDate);

CREATE INDEX idx_items_location
ON items(Location);

CREATE INDEX idx_trades_status
ON trades(TradeStatus);

CREATE INDEX idx_trades_requestdate
ON trades(RequestDate);