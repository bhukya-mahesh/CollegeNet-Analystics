USE collegenet_analytics;

DROP TRIGGER IF EXISTS trg_CheckSemester;
DELIMITER $$
CREATE TRIGGER trg_CheckSemester
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF NEW.Semester < 1 OR NEW.Semester > 8 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Semester must be between 1 and 8';
    END IF;
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS trg_CheckEstimatedValue;
DELIMITER $$
CREATE TRIGGER trg_CheckEstimatedValue
BEFORE INSERT ON items
FOR EACH ROW
BEGIN
    IF NEW.EstimatedValue < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estimated Value cannot be negative';
    END IF;
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS trg_CheckRecoveryDate;
DELIMITER $$
CREATE TRIGGER trg_CheckRecoveryDate
BEFORE INSERT ON items
FOR EACH ROW
BEGIN
    IF NEW.RecoveredDate IS NOT NULL
       AND NEW.RecoveredDate < NEW.ReportDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recovered Date cannot be before Report Date';
    END IF;
END $$
DELIMITER ;




DROP TRIGGER IF EXISTS trg_PreventSelfTrade;
DELIMITER $$
CREATE TRIGGER trg_PreventSelfTrade
BEFORE INSERT ON trades
FOR EACH ROW
BEGIN
    IF NEW.RequesterID = NEW.OwnerID THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Requester and Owner cannot be the same';
    END IF;
END $$
DELIMITER ;




DROP TRIGGER IF EXISTS trg_CheckCompletedDate;
DELIMITER $$
CREATE TRIGGER trg_CheckCompletedDate
BEFORE INSERT ON trades
FOR EACH ROW
BEGIN
    IF NEW.CompletedDate IS NOT NULL
       AND NEW.AcceptedDate IS NOT NULL
       AND NEW.CompletedDate < NEW.AcceptedDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Completed Date cannot be before Accepted Date';
    END IF;
END $$
DELIMITER ;

