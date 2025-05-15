USE sqldb;

SELECT *
FROM usertbl u
INNER JOIN buytbl b
on u.userID = b.userID
WHERE b.userID = 'JYP';

SELECT u.userID, u.name, b.prodName, u.addr,
       concat(u.mobile1, u.mobile2) AS '연락처'
FROM usertbl u LEFT OUTER JOIN buytbl b
ON u.userID = b.userID
ORDER BY u.userID;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호'
FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 is null );

SELECT name, CONCAT(usertbl.mobile1, usertbl.mobile2) AS '전화번호'
FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL );