DELETE FROM report;
INSERT INTO jobportal.report (month, employee_count, company_count, job_count, application_count, job_success)
values (1, 8, 6, 8, 8, 7),
       (2, 5, 5, 7, 10, 8),
       (3, 5, 8, 10, 9, 5),
       (4, 9, 10, 9, 8, 6),
       (5, 8, 9, 10, 9, 6),
       (6, 7, 10, 9, 9, 5),
       (7, 5, 6, 9, 9, 9),
       (8, 7, 8, 7, 7, 5),
       (9, 8, 6, 5, 8, 6),
       (10, 9, 7, 7, 10, 9),
       (11, 5, 5, 7, 10, 7),
       (12, 6, 5, 5, 8, 5);