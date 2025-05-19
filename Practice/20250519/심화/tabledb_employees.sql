USE tabledb;

DROP TABLE IF EXISTS userTBL;
DROP TABLE IF EXISTS buyTBL;

-- 1번 문제
CREATE TABLE userTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL ,
    birthYear INT NOT NULL
);

-- 2번 문제
CREATE TABLE buyTBL(
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL ,
    FOREIGN KEY(userid) REFERENCES userTBL(userID)
);

-- 3번 문제
CREATE TABLE userTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL ,
    birthYear INT NOT NULL,
    email CHAR(30) NULL UNIQUE
);

-- 4번 문제
CREATE TABLE userTBL(
    userID    CHAR(8) PRIMARY KEY,
    name      VARCHAR(10) ,
    birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2023),
    mobile1    char(3) NULL,
    CONSTRAINT CK_name CHECK ( name IS NOT NULL)
);

-- 5번 문제
CREATE TABLE userTBL (
    userID      CHAR(8) NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthYear   INT NOT NULL DEFAULT -1,
    addr        CHAR(2) NOT NULL DEFAULT '서울',
    mobile1     CHAR(3) NULL,
    mobile2     CHAR(8) NULL,
    height      SMALLINT NULL DEFAULT 170,
    mDate       DATE NULL
);

-- 6번 문제
ALTER TABLE userTBL
    DROP COLUMN mobile1;

ALTER TABLE userTBL
    CHANGE COLUMN name UName VARCHAR(20) NULL;

ALTER TABLE userTBL
    DROP PRIMARY KEY;

------------------------------------------------------------------------

-- 7번 문제
USE employees;

DROP VIEW IF EXISTS EMPLOYEES_INFO;

CREATE VIEW EMPLOYEES_INFO AS
SELECT
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    t.title,
    t.from_date AS t_from,
    t.to_date AS t_to,
    s.salary,
    s.from_date AS s_from,
    s.to_date AS s_to
FROM employees e
         JOIN titles t ON e.emp_no = t.emp_no
         JOIN salaries s ON e.emp_no = s.emp_no;

-- 8번 문제
SELECT *
FROM EMPLOYEES_INFO
WHERE t_to = '9999-01-01'
  AND s_to = '9999-01-01';

-- 9번 문제
CREATE VIEW EMP_DEPT_INFO AS
SELECT
    de.emp_no,
    de.dept_no,
    d.dept_name,
    de.from_date,
    de.to_date
FROM dept_emp de
         JOIN departments d ON de.dept_no = d.dept_no;

-- 10번 문제
SELECT *
FROM EMP_DEPT_INFO
WHERE to_date = '9999-01-01';




