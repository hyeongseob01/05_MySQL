-- 1번 문제
DROP DATABASE tabledb;

CREATE DATABASE tabledb;

USE tabledb;

-- 2번 문제
CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL ,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile1 CHAR(3) NULL,
    mobile2 CHAR(8) NULL,
    height SMALLINT NULL,
    mDate DATE NULL
);

-- 3번 문제
CREATE TABLE buytbl(
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4) NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

-- 4번 문제
INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

-- 5번 문제
INSERT INTO buytbl VALUES (NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- 오류 발생 : userid 컬럼이 참조하는 usertbl테이블의 userID 컬럼에 'JYP'가 없음
# INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

-- 6번 문제
DROP TABLE IF EXISTS usertbl;
DROP TABLE IF EXISTS buytbl;

CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);

-- 7번 문제
DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl(
    prodCode CHAR(3) NOT NULL,
    prodID CHAR(4) NOT NULL ,
    prodDate DATETIME NOT NULL,
    prodCur CHAR(10) NULL,
    CONSTRAINT PK_prodTbl_prodCode_prodID
    PRIMARY KEY (prodCode, prodID)
);

DROP VIEW IF EXISTS v_usertbl;
-- 8번 문제
CREATE VIEW v_usertbl
AS
SELECT
    userID,
    name,
    addr
FROM
    usertbl, buytbl;

SELECT *
FROM v_usertbl;

-- buytbl 생성
CREATE TABLE buyTBL(
                       num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
                       userID  CHAR(8) NOT NULL,
                       prodName CHAR(6) NOT NULL,
                       FOREIGN KEY(userID) REFERENCES userTBL(userID)
                           ON DELETE CASCADE
                           ON UPDATE CASCADE
);

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화');
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북');
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지');

CREATE VIEW v_userbuytbl
AS
SELECT
    U.userid,
    U.name,
    B.prodName,
    U.addr,
    CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM
    usertbl U
        INNER JOIN
    buytbl B ON U.userid = B.userid;

SELECT *
FROM
    v_userbuytbl
WHERE
    name = '김범수';

