USE sqldb;

DESCRIBE buytbl;

SELECT *
FROM buytbl;

SELECT *
FROM usertbl;

-- 1번 문제
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl
GROUP BY userID;

-- 2번 문제
SELECT userID '사용자 아이디', SUM(price) '총 구매액'
FROM buytbl
GROUP BY userID; 

-- 3번 문제
SELECT AVG(amount) '평균 구매 개수'
FROM buytbl;

-- 4번 문제
SELECT userID, AVG(amount) '평균 구매 개수'
FROM buytbl
GROUP BY userID;

-- 5번 문제
SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);

-- 6번 문제
SELECT COUNT(mobile1) '휴대폰이 있는 사용자'
FROM usertbl;

-- 7번 문제
SELECT userID '사용자', SUM(price) '총구매액'
FROM buytbl
GROUP BY userID;

-- 8번 문제
SELECT userID '사용자'
FROM buytbl
GROUP BY userID
HAVING SUM(price) >= 1000;

------------------------------------------------------------------

USE world;

SHOW tables;

SELECT *
FROM country;

SELECT *
FROM city;

SELECT *
FROM countrylanguage;

-- 9번 문제
SELECT Name, SUM(Population) '인구수 총합'
FROM city
WHERE CountryCode = 'KOR'
GROUP BY Name;

-- 10번 문제
SELECT Name, Population AS '최소값'
FROM city
WHERE CountryCode = 'KOR'
ORDER BY Population ASC
LIMIT 1;

-- 11번 문제
SELECT Name, AVG(Population)
FROM city
WHERE CountryCode='KOR'
GROUP BY Name;

-- 12번 문제
SELECT Name, Population '최대값'
FROM city
WHERE CountryCode = 'KOR'
ORDER BY Population desc
LIMIT 1;

-- 13번 문제
SELECT Name, CHAR_LENGTH(Name) '글자 수'
FROM country;

-- 14번 문제
SELECT UPPER(LEFT(Name,3)) '앞 세 글자 대문자'
FROM country;

-- 15번 문제
SELECT Name, ROUND(LifeExpectancy,1) '기대수명(반올림)'
FROM country;

-----------------------------------------------------------------------

USE employees;

SHOW TABLES;

DESCRIBE dept_manager;
SELECT *
FROM current_dept_emp;

SELECT *
FROM employees;

-- 16번 문제
SELECT
    d.dept_name AS 부서명,
    e.first_name AS 이름,
    e.last_name AS 성,
    dm.from_date AS 시작일,
    dm.to_date AS 종료일
FROM dept_manager dm
         JOIN departments d ON dm.dept_no = d.dept_no
         JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01';

-- 17번 문제
SELECT
    dm.dept_no AS 부서번호,
    e.first_name AS 이름,
    e.last_name AS 성,
    dm.from_date AS 시작일,
    dm.to_date AS 종료일
FROM dept_manager dm
         JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.dept_no = 'd005' AND dm.to_date = '9999-01-01';

-- 18번 문제
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 20 OFFSET 140;

-- 19번 문제
SELECT COUNT(*)
FROM salaries
WHERE to_date = '9999-01-01';

-- 20번 문제
SELECT AVG(salary)
FROM salaries
WHERE to_date = '9999-01-01';

-- 21번 문제
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
         JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND s.salary > (
    SELECT AVG(salary)
    FROM salaries
    WHERE to_date = '9999-01-01'
);


-- 22번 문제
SELECT dept_no, COUNT(*) AS num_employees
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no ASC;