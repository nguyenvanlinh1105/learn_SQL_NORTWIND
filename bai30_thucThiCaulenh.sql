-- Thứ tự thực thi trong câu truy vấn SQL và các vấn đề cần lưu í

/*
Thứ tư:
1- FROM 
2 - FULL/ R/L/OUTER JOIN 
3 - ON
4 - FULL /R /L
5 WHERE 
6 GROUP BY
7 HAVING
8 , ,
9 DISTINCT
10 ORDER BY 
11 TOP 


*/
-- VÍ dụ:
SELECT p.ProductID, p.ProductName--2
FROM dbo.products as p--1

SELECT p.ProductID, p.ProductName--3
FROM dbo.products as p--1
WHERE p.CategoryID = 1;--2

SELECT p.CategoryID, COUNT (p.ProductID) as "Total Products"
FROM dbo.products as p--1
WHERE p.CategoryID IN (1,2,3)--2
GROUP BY p.CategoryID

SELECT p.CategoryID, COUNT (p.ProductID) as "Total Products"--5
FROM dbo.products as p--1
WHERE p.CategoryID IN (1,2,3,4, 5, 6, 7,8)--2
GROUP BY p.CategoryID--3
HAVING COUNT (p.ProductID)>5---4-- [Total Products] chưa tồn tại 
ORDER BY [Total Products] ASC--6[Total Products] đã tồn tại 









