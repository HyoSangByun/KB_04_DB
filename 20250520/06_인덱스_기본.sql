USE sqldb;

CREATE TABLE tbl1 (
                      a INT PRIMARY KEY,-- 이 열에 클러스터형 인덱스 자동 생성
                      b INT,
                      c INT
);

-- 인덱스 확인
SHOW INDEX FROM tbl1;

CREATE TABLE tbl2 (
                      a INT PRIMARY KEY,-- 클러스터형 인덱스
                      b INT UNIQUE,-- 보조 인덱스
                      c INT UNIQUE,-- 보조 인덱스
                      d INT
);

SHOW INDEX FROM tbl2;

CREATE TABLE tbl3 (
                      a INT UNIQUE,-- 보조 인덱스
                      b INT UNIQUE,-- 보조 인덱스
                      c INT UNIQUE,-- 보조 인덱스
                      d INT
);

SHOW INDEX FROM tbl3;

CREATE TABLE tbl4 (
                      a INT UNIQUE NOT NULL,-- 클러스터형 인덱스로 생성
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT
);

SHOW INDEX FROM tbl4;

CREATE TABLE tbl5 (
                      a INT UNIQUE NOT NULL,-- 클러스터형 인덱스로 생성
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT PRIMARY KEY
);

SHOW INDEX FROM tbl5;

CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
                        userID CHAR(8) NOT NULL PRIMARY KEY,
                        name VARCHAR(10) NOT NULL,
                        birthYear INT NOT NULL,
                        addr NCHAR(2) NOT NULL
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울');

SELECT * FROM usertbl;

ALTER TABLE usertbl DROP PRIMARY KEY;

--  name 컬럼에 pk_name이라는 제약조건명으로 기본키를 설정
ALTER TABLE usertbl
    ADD CONSTRAINT pk_name PRIMARY KEY(name);

SELECT * FROM usertbl;