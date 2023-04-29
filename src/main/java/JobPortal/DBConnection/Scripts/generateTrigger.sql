drop Trigger if exists update_employee_count;
drop Trigger if exists delete_employee_count;
drop Trigger if exists update_company_count;
drop Trigger if exists delete_company_count;
drop Trigger if exists insert_new_application;
drop Trigger if exists update_job_success;

-- Trigger for employee table
CREATE TRIGGER update_employee_count
    AFTER INSERT
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count + 1 WHERE month = MONTH(NOW());
END;

CREATE TRIGGER delete_employee_count
    AFTER DELETE
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count - 1 WHERE month = MONTH(NOW());
END;

-- Trigger for companies table
CREATE TRIGGER update_company_count
    AFTER INSERT
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count + 1 WHERE month = MONTH(NOW());
END;

CREATE TRIGGER delete_company_count
    AFTER DELETE
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count - 1 WHERE month = MONTH(NOW());
END;

-- Trigger for jobpost table
Create Trigger insert_new_application
    BEFORE INSERT
    ON appliedjobs
    FOR EACH ROW
BEGIN
    update report set application_count = application_count + 1 where month = month(now());
END;

-- Trigger for appliedjobs table
CREATE TRIGGER update_job_success
    BEFORE UPDATE
    ON appliedjobs
    FOR EACH ROW
BEGIN
    IF NEW.Approved = 'Yes' THEN
        update report set job_success = job_success + 1 where month = month(now());
    END IF;
END