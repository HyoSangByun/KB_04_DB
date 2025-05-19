USE tabledb;

DROP TABLE IF EXISTS buyTBL, userTBL;

CREATE TABLE userTBL(
                        userID    CHAR(8) NOT NULL PRIMARY KEY,
                        name      VARCHAR(10) NOT NULL,
                        birthYear  INT NOT NULL
);


-- buyTbl의 userID 컬럼에 FK 제약 조건 설정(userTBL의 userID 컬럼 값 참조)
CREATE TABLE buyTBL(
                       num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
                       userID  CHAR(8) NOT NULL,
                       prodName CHAR(6) NOT NULL,
                       FOREIGN KEY(userID) REFERENCES userTBL(userID)
                           ON DELETE CASCADE
                           ON UPDATE CASCADE
);

-- 기존 테이블 삭제
DROP TABLE IF EXISTS buyTBL, userTBL;

-- userTBL 테이블 생성
CREATE TABLE userTBL (
                         userID     CHAR(8) NOT NULL PRIMARY KEY,      -- 고정문자, 기본키
                         name       VARCHAR(10) NOT NULL,              -- 가변문자, 필수
                         birthyear  INT NOT NULL,                      -- 정수, 필수
                         email      CHAR(30) UNIQUE                    -- 고정문자, 옵션, 중복 불가
);

DROP TABLE IF EXISTS userTBL;

-- 테이블 생성
CREATE TABLE userTBL (
                         userID     CHAR(8) PRIMARY KEY,
                         name       VARCHAR(10) NOT NULL,
                         birthYear  INT CHECK (birthYear >= 1900 AND birthYear <= 2023),
                         mobile     CHAR(3) NOT NULL
);

DROP TABLE IF EXISTS userTBL;

-- 테이블 생성
CREATE TABLE userTBL (
                         userID     CHAR(8) NOT NULL PRIMARY KEY,
                         name       VARCHAR(10) NOT NULL,
                         birthYear  INT NOT NULL DEFAULT -1,
                         addr       CHAR(2) NOT NULL DEFAULT '서울',
                         mobile1    CHAR(3),
                         mobile2    CHAR(8),
                         height     SMALLINT DEFAULT 170,
                         mDate      DATE
);

INSERT INTO userTBL(userID, name) VALUES ('user001', '홍길동');
INSERT INTO userTBL VALUES ('user002', '김영희', 1990, default, '010', '12345678', default, '2024-01-01');

-- 1. mobile1 컬럼 삭제
ALTER TABLE userTBL
    DROP COLUMN mobile1;

-- 2. name 컬럼 → uName 으로 이름 변경 (형식과 NULL 허용 그대로 유지)
ALTER TABLE userTBL
    CHANGE COLUMN name uName VARCHAR(10) NOT NULL;

-- 3. 기본키 제거
ALTER TABLE userTBL
    DROP PRIMARY KEY;

USE employees;
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
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no;

-- EMPLOYEES_INFO 뷰에서 **재직 중인 직원(현재 정보)**만 출력
SELECT *
FROM EMPLOYEES_INFO
WHERE t_to = '9999-01-01'
  AND s_to = '9999-01-01';

-- 뷰 정의
CREATE VIEW EMP_DEPT_INFO AS
SELECT
    e.emp_no,
    e.dept_no,
    d.dept_name,
    e.from_date,
    e.to_date
FROM
    dept_emp e
        JOIN
    departments d ON e.dept_no = d.dept_no;
