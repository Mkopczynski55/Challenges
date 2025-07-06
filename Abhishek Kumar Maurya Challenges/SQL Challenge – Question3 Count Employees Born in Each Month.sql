CREATE SCHEMA IF NOT EXISTS challenges;

USE challenges;

CREATE TABLE IF NOT EXISTS employee (
	Name VARCHAR(255),
    DOB DATE
);

INSERT INTO employee VALUES('Anand', '1983-01-15');
INSERT INTO employee VALUES('Animesh', '1984-02-23');
INSERT INTO employee VALUES('Aniket', '1982-05-25');
INSERT INTO employee VALUES('Mayur', '1982-05-27');
INSERT INTO employee VALUES('Mahesh', '1983-06-20');
INSERT INTO employee VALUES('Nikita', '1989-04-06');
INSERT INTO employee VALUES('Nayan', '1983-06-11');
INSERT INTO employee VALUES('Nilesh', '1989-12-30');
INSERT INTO employee VALUES('Kanika', '1986-08-07');
INSERT INTO employee VALUES('Arushi', '1985-03-25');
INSERT INTO employee VALUES('Tanya', '1984-10-29');
INSERT INTO employee VALUES('Tanya', '1982-09-08');
INSERT INTO employee VALUES('Tanya', '1985-01-18');
INSERT INTO employee VALUES('Shubham', '1989-07-24');
INSERT INTO employee VALUES('Sonam', '1985-11-04');
INSERT INTO employee VALUES('Dinesh', '1980-08-29');
INSERT INTO employee VALUES('Dinesh', '1988-12-13');
INSERT INTO employee VALUES('Suhail', '1986-08-19');
INSERT INTO employee VALUES('Sarthak', '1988-03-23');
INSERT INTO employee VALUES('Shiva', '1989-09-27');
INSERT INTO employee VALUES('Kamlesh', '1985-01-26');
INSERT INTO employee VALUES('Karan', '1981-08-27');
INSERT INTO employee VALUES('Komal', '1987-06-09');
INSERT INTO employee VALUES('Harish', '1987-06-02');
INSERT INTO employee VALUES('Jacky', '1984-10-09');
INSERT INTO employee VALUES('Jacky', '1987-04-06');
INSERT INTO employee VALUES('Julie', '1984-04-09');
INSERT INTO employee VALUES('Junaid', '1987-03-10');
INSERT INTO employee VALUES('Jon', '1984-01-26');
INSERT INTO employee VALUES('Rajesh', '1986-10-10');
INSERT INTO employee VALUES('Ramanesh', '1989-04-04');
INSERT INTO employee VALUES('Nikita', '1980-01-05');
INSERT INTO employee VALUES('Jacky', '1983-03-05');
INSERT INTO employee VALUES('Jacky', '1981-04-05');
INSERT INTO employee VALUES('Judy', '1984-03-06');
INSERT INTO employee VALUES('Julia', '1986-07-26');
INSERT INTO employee VALUES('Puneet', '1987-02-04');
INSERT INTO employee VALUES('Puneet', '1987-10-28');
INSERT INTO employee VALUES('Patty', '1986-12-11');
INSERT INTO employee VALUES('Richa', '1982-09-01');
INSERT INTO employee VALUES('Richa', '1981-11-29');
INSERT INTO employee VALUES('Richa', '1986-06-12');

SELECT * FROM employee;

WITH cte AS (
SELECT MONTH(DOB) AS MonthNum, LEFT(UPPER(MONTHNAME(DOB)), 3) AS Month, COUNT(Name) AS Count
FROM employee
GROUP BY MonthNum, Month
ORDER BY MonthNum ASC
)
SELECT cte.Month, cte.Count
FROM cte;
