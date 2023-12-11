-- IN _ NOT IN:Tìm kiếm gái trị trong danh sách 

/*
SELECT column_name 
FROM table_name
WHERE column_name IN(value1, value2,..)


Có í nghĩa tương tụ như OR
cho phép kiểm tra với nhiều giá trị cùng lúc 


*** NOT IN : lấy giá trị khác với giá trị đã được chỉ định.
*/
-- Ví dụ 1: Hãy lọc ra tất cả các đơn hàng với điều kiện: 
-- a, Đơn hàng được giao đên Germany, UK , Brazil
-- b, Đơn hàng được giao đến các quốc gia khác Germany, UK , Brazil
SELECT * 
FROM dbo.Orders 
WHERE ShipCountry IN ('Germany','UK','Brazil');

SELECT * 
FROM dbo.Orders 
WHERE ShipCountry NOT IN ('Germany','UK','Brazil');


SELECT *
FROM dbo.Orders
WHERE NOT(ShipCountry = 'Germany');

-- Ví dụ 2: Lấy ra các sản phẩm có mã thể loại khác với 2,3 và 4
SELECT * 
FROM dbo.Products
WHERE SupplierID NOT IN (2, 3,4);

-- Ví dụ 3: Hãy liệt kế các nhân viên không phải là nữ từ bảng nhân viên.
-- Hãy liệt kê các nhân viên là nữ từ bảng nhân viên.
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy NOT IN('Mrs.','Ms.');-- Không phải là nữ 

SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy IN('Mrs.','Ms.');-- là nữ 

-- Bài tập : hãy lấy ra tất cả các khách hàng đến từ các thành phó sau đâu Berlin London Warszawa
SELECT *
FROM dbo.Customers
WHERE  City IN('Berlin', 'London','Warszawa');


/*
1.viết câu lệnh sql lấy ra tên của nhân viên có họ là Leverling,Peacock,Suyama
2.viết câu lệnh sql lấy ra quốc gia của khách hàng là Mexico,UK,Brazil
*/
SELECT *
FROM dbo.Employees
WHERE LastName IN('Leverling','Peacock','Suyama');