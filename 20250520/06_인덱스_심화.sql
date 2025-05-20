USE sqldb;

SELECT * FROM usertbl;

SHOW INDEX FROM usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

-- addr 컬럼에 인덱스 만들기
CREATE INDEX idx_usertbl_addr
    ON usertbl (addr);

SHOW INDEX FROM usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

ANALYZE TABLE usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

-- 출생년도에 보조 인덱스 생성
CREATE UNIQUE INDEX idx_usertbl_birthYear
    ON usertbl (birthYear);

CREATE UNIQUE INDEX idx_usertbl_name
    ON usertbl (name);

SHOW INDEX FROM usertbl;

DROP INDEX idx_usertbl_name ON usertbl;

CREATE UNIQUE INDEX idx_usertbl_name_birthYear
    ON usertbl (name, birthYear);

SHOW INDEX FROM usertbl;

DROP INDEX idx_usertbl_name_birthYear ON usertbl;
DROP INDEX idx_usertbl_addr ON usertbl;

-- 심화 2
-- 데이터베이스 명
CREATE DATABASE scoula_db;

-- 사용자명 & 비밀번호
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- 권한 부여
GRANT ALL PRIVILEGES ON scoula_DB.* TO 'scoula'@'%';

-- 권한 관련 변경 사항 즉시 반영
FLUSH PRIVILEGES;