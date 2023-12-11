-- UNION/ UNION ALL  : Kết hợp các kết quả- giao nhau hay là hợp 
-- gom lại kết quả của 2 câu lệnh xong nó bỏ hoặc ko bỏ một số dòng trùng nhau trong table 

-- từ bảng Orders Details hãy liệt kê ra các đơn hàng có UnitPrice nằm trong phạm vi từ 100 đến 200
SELECT OrderID
FROM [dbo].[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200;
-- I1:22

-- Từ bảng Orders Details hãy leeya ra các đơn hàng có Quantity bằng 10 hoặc 20 
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10,20);
--I2:433

-- I3: từ bảng Orders Details hãy liệt kê các đơn đặt hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 và đơn hàng phải có quantity bangw 10 hoặc 20
SELECT OrderID 
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200 AND Quantity IN (10, 20)
--I3:7

-- I4: từ bảng Orders Details hãy liệt kê các đơn đặt hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 HOẶC đơn hàng phải có quantity bangw 10 hoặc 20

SELECT  OrderID
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200 OR Quantity IN (10, 20)
--I4:448 // còn trùng orderid ở 2 bảng 


--- I5: từ bảng Orders Details hãy liệt kê các đơn đặt hàng có UnitPrice nằm trong phạm vi từ 100 đến 200 HOẶC đơn hàng phải có quantity bangw 10 hoặc 20  , có sử dụng Distinct
SELECT DISTINCT OrderID
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200 OR Quantity IN (10,20)
-- I5 : 360;

/*
UNION: giúp cho chúng ta kết hợp nhiều kết quả của nhiều câu lệnh khác nhau 
Mỗi câu lệnh bên trong phải có cùng số lượng cột , 
các cột phải có kiểu dữ liệu tương tự 
các cột trong mỗi câu lệnh cũng phải theo cùng thứ tự 


SELECT column_name (s) FROM table1
UNION SELECT column_name(s) FROM table2;
// đối với UNION không cho phép các id có cùng giá trị lặp lại 
\\ Đối với UNION ALL : cho phép các giá trị bị lặp lại 


*/
SELECT OrderID
FROM [dbo].[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200
UNION
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10,20);

-- 4
SELECT OrderID
FROM [dbo].[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200
UNION ALL
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10,20);


-- Lấy tất cả quốc gia từ 2 table Suppliers và Customers;
SELECT DISTINCT country 
from dbo.suppliers
UNION
SELECT DISTINCT country 
from dbo.customers;
-- không chấp nhận trùng lặp 
-- distinct tất cả các dữ liệu 

SELECT DISTINCT country 
from dbo.suppliers
UNION ALL
SELECT DISTINCT country 
from dbo.customers;
-- châps  nhận trùng lặp ở một số dòng 


-- bài tập :
SELECT City, Country 
FROM dbo.Customers
WHERE Country LIKE 'U%'
UNION SELECT City , Country 
FROM dbo.Suppliers 
WHERE City = 'London'
UNION 
SELECT ShipCity , ShipCountry
FROM dbo.Orders
WHERE ShipCountry ='USA';
