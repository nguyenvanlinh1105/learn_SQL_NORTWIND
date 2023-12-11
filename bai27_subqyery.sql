-- SUB QUERY 
-- NESTED QUERY
--- Truy vấn con/ truy vấn lòng nhau 
/*
Subquery (câu truy vấn con) trong SQL là một truy vấn SELECT được viết bên trong một truy vấn SELECT được viết bên trong một truy vấn SELECT, UPDATE< INSERT hoặc DELETE khác
Subquery hoạt động như một bảng ảo tạm thời, nó được sử dụng để trích xuất thông tin từ các bảng hoặc tập tin dữ liệu khác trong cùng một câu truy vấn 
*/
/*
NESTED QUERY ;
*/

-- SubQuery 
-- Ví dụ 1:
-- Liệt kê ra toàn bộ sản phẩm
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products;

-- Tìm gái trung bình của các sản phẩm 
SELECT AVG(UnitPrice)
FROM dbo.Products;


-- Lọc những sản phẩm có giá lơn hơn giá trung bình 

SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice> (SELECT AVG(UnitPrice)  FROM dbo.Products);

-- Lọc ra những khách hàng có số đơn hàng >10
SELECT c.CustomerID , c.CompanyName, COUNT (o.OrderID)
FROM dbo.Customers as c
LEFT JOIN dbo.Orders as o 
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID , c.CompanyName
HAVING COUNT (o.OrderID)>10;


-- Cach 2:
SELECT CustomerID
FROM dbo.Orders as o 
GROUP BY o.CustomerID
HAVING COUNT (o.OrderID) >10;



SELECT * 
FROM dbo.Customers as c
WHERE c.CustomerID IN(SELECT CustomerID
FROM dbo.Orders as o 
GROUP BY o.CustomerID
HAVING COUNT (o.OrderID) >10);
 


 -- Tổng tiền cho từng đơn hàng
 -- Cách 1
SELECT od.OrderID,SUM( od.Quantity *od.UnitPrice )as TotalPrice 
FROM dbo.[Order Details] as od 
GROUP BY od.OrderID;

-- Cách 2 
SELECT * ,( SELECT SUM(od.Quantity*od.UnitPrice)
		 FROM dbo.[Order Details] as od 
		 WHERE o.OrderId = od.OrderID
		 ) as [Total]
FROM dbo.Orders o ;



-- Ví dụ 4: Lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm 
-- Products 
-- Order Details 
-- Cách 1: 
SELECT p.ProductID ,p.ProductName 
		, (SELECT COUNT (od.OrderID)
		FROM dbo.[Order Details] as od
		WHERE od.ProductID = p.ProductID) as "Total"
FROM dbo.Products as p

-- biến thành sub quaery 
SELECt ProductName, Total
FROM (SELECT p.ProductID ,p.ProductName 
		, (SELECT COUNT (od.OrderID)
		FROM dbo.[Order Details] as od
		WHERE od.ProductID = p.ProductID) as "Total"
FROM dbo.Products as p) as "TEMP"


-- Cách 2:
SELECT p.ProductID, p.ProductName, COUNT(od.OrderId) as "Total"
FROM dbo.Products as p
INNER JOIN dbo.[Order Details] as od 
ON p.ProductID =od.ProductID
GROUP BY p.ProductID, p.ProductName


-- Bài tập: hãy in ra mã đơn hàng và tổng giá trị của đơn hàng đó.
SELECT od.OrderID ,SUM(od.Quantity*od.UnitPrice) as"Total"
FROM dbo.[Order Details] as od 
GROUP BY OrderID;


-- cách 2:

SELECT o.OrderID, (SELECT SUM(od.Quantity* od.UnitPrice)
		FROM dbo.[Order Details] as od 
		WHERE od.OrderID = o.OrderID
		)
FROM dbo.Orders o




