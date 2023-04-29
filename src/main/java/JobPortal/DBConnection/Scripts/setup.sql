CREATE TABLE companies
(
    ID       int AUTO_INCREMENT
        PRIMARY KEY,
    Username varchar(16)       NOT NULL,
    Name     varchar(45)       NOT NULL,
    About    varchar(1000)     NOT NULL,
    Email    varchar(45)       NOT NULL,
    Password varchar(32)       NOT NULL,
    Credit   int(10) DEFAULT 0 NOT NULL
);

CREATE DEFINER = root@localhost TRIGGER delete_company_count
    AFTER DELETE
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count - 1 WHERE month = MONTH(NOW());
END;

CREATE DEFINER = root@localhost TRIGGER update_company_count
    AFTER INSERT
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count + 1 WHERE month = MONTH(NOW());
END;

CREATE TABLE employee
(
    ID        int AUTO_INCREMENT
        PRIMARY KEY,
    Email     varchar(45)   NOT NULL,
    FirstName varchar(45)   NOT NULL,
    LastName  varchar(45)   NOT NULL,
    UserName  varchar(45)   NOT NULL,
    Password  varchar(45)   NOT NULL,
    About     varchar(1000) NOT NULL,
    Number    varchar(20)   NOT NULL,
    ComID     int           NULL,
    Role      int DEFAULT 0 NULL,
    CONSTRAINT employee_email_uindex
        UNIQUE (Email),
    CONSTRAINT employee_companies_cid_fk
        FOREIGN KEY (ComID) REFERENCES companies (ID)
            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE DEFINER = root@localhost TRIGGER delete_employee_count
    AFTER DELETE
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count - 1 WHERE month = MONTH(NOW());
END;

CREATE DEFINER = root@localhost TRIGGER update_employee_count
    AFTER INSERT
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count + 1 WHERE month = MONTH(NOW());
END;

CREATE TABLE jobpost
(
    ID          int AUTO_INCREMENT
        PRIMARY KEY,
    Location    varchar(50)   NOT NULL,
    Vacancy     int           NOT NULL,
    Iplace      varchar(45)   NOT NULL,
    Deadline    varchar(45)   NOT NULL,
    Salary      varchar(45)   NOT NULL,
    Title       varchar(45)   NOT NULL,
    Boosted     int(10)       NOT NULL,
    About       varchar(1000) NOT NULL,
    Requirement varchar(1000) NOT NULL,
    Type        varchar(45)   NOT NULL,
    ComID       int           NOT NULL,
    CONSTRAINT company_job_fk
        FOREIGN KEY (ComID) REFERENCES companies (ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE appliedjobs
(
    JobID    int         NOT NULL,
    EmpID    int         NOT NULL,
    Approved varchar(10) NOT NULL,
    CONSTRAINT employee_applied_fk
        FOREIGN KEY (EmpID) REFERENCES employee (ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT job_applied_fk
        FOREIGN KEY (JobID) REFERENCES jobpost (ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE DEFINER = root@localhost TRIGGER insert_new_application
    BEFORE INSERT
    ON appliedjobs
    FOR EACH ROW
BEGIN
    UPDATE report SET application_count = application_count + 1 WHERE month = MONTH(NOW());
END;

CREATE DEFINER = root@localhost TRIGGER update_job_success
    BEFORE UPDATE
    ON appliedjobs
    FOR EACH ROW
BEGIN
    IF NEW.Approved = 'Yes' THEN
        UPDATE report SET job_success = job_success + 1 WHERE month = MONTH(NOW());
    END IF;
END;

CREATE TABLE recommend
(
    JobID int         NOT NULL,
    RecID int         NOT NULL,
    Email varchar(45) NOT NULL,
    CONSTRAINT recommend_employee_eid_fk
        FOREIGN KEY (RecID) REFERENCES employee (ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT recommend_employee_email_fk
        FOREIGN KEY (Email) REFERENCES employee (Email)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT recommend_jobpost_jid_fk
        FOREIGN KEY (JobID) REFERENCES jobpost (ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE report
(
    month             int           NULL,
    employee_count    int DEFAULT 0 NULL,
    company_count     int DEFAULT 0 NULL,
    job_count         int DEFAULT 0 NULL,
    application_count int DEFAULT 0 NULL,
    job_success       int DEFAULT 0 NULL
);

CREATE TABLE review
(
    ID      int AUTO_INCREMENT,
    EmpID   int          NOT NULL,
    ComID   int          NOT NULL,
    Rating  int          NOT NULL,
    Comment varchar(700) NOT NULL,
    PRIMARY KEY (EmpID, ComID),
    CONSTRAINT review_id_uindex
        UNIQUE (ID),
    CONSTRAINT reviews_employee_cid_cid_fk
        FOREIGN KEY (ComID) REFERENCES companies (ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE sessions
(
    UserID varchar(5)  NOT NULL,
    Type   varchar(10) NOT NULL,
    Time   varchar(30) NOT NULL,
    PRIMARY KEY (Type, UserID)
);

