-- And // Or // Not
use NORTHWND;
/*
And - và 
SELECT column1, column2,... 
FROM table_name
WHERE condition1 AND condition2 AND condition3;

==> chức năng hiển thị một bản  ghi nếu tất cả các diều kiện được phân tách bằng AND đều có giá trị true;

* NOT - phủ đinh
SELECT column1, column2,... 
FROM table_name
WHERE not Condition;

==> chức năng hiển thị một bản ghi nếu điều kiện có giá trị không đúng- False 


* OR - hoặc
SELECT column1, column2,... 
FROM table_name
WHERE condition1 OR condition2 OR condition3;

==> chức năng hiển thị một bản ghi nếu một trong những số diều kiện có giá trị TRUE
*/

--Ví dụ 1: Bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100 

SELECT *
FROM dbo.Products
WHERE UnitsInStock>100 OR UnitsInStock <50;

-- Ví dụ 2:  Bạn hãy liệt kê tất cả các đơn hàng được giao đến Brazil, đã bị giao muộn, biết rằng Ngày cần phải giao hàng là RequiredDate , ngày giao hàng thực tế là ShippedDate
SELECT * 
FROM dbo.Orders
WHERE ShipCountry ='Brazil' AND ShippedDate >RequiredDate;

-- Ví dụ 3: lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1 ;
-- Dùng not.
SELECT * 
FROM dbo.Products
WHERE UnitPrice<100 AND NOT(CategoryID='1')

-- Bài tập  : liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50, 100] đô la 

SELECT *
FROM dbo.Orders
WHERE Freight between 50 and 100;

SELECT *
FROM dbo.Orders
WHERE Freight>50 AND Freight<100;

-- Bài tập 2: hãy liệt kê các sản phẩm có số lượng hàng trong kho UnitsInStock lớn hơn 20 và số lượng hàng trong đơn hàng nhỏ hơn 20
SELECT * 
FROM dbo.Products
WHERE UnitsInStock >20 AND UnitsOnOrder<20;


