-- Bài tập 1:  Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần 
SELECT CustomerID, COUNT(OrderID) as[TotalOrders]
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >20
ORDER BY COUNT(OrderID) DESC;
-- Bài tập 2: hãy lọc ra các nhân viên EmployeeID có tổng đơn hàng lớn hơn hoặc bằng 100, sắp xếp theo tổng số đơn hàng giảm dần 
SELECT EmployeeID, COUNT(OrderID) as[TotalOrders]
FROM dbo.Orders
GROUP BY EmployeeID
HAVING  COUNT(OrderID)>100
ORDER By COUNT(OrderID) DESC;
-- Bài 3: hãy cho biết những thể loại nào (CategoryID ) có số sản phẩm khác nhau lớn hơn 11
SELECT CategoryID , COUNT(ProductID) as[TotalProductId]
FROM dbo.Products
GROUP BY CategoryID
HAVING COUNT(ProductID)>11

--bài 4: Hãy ho biết những thể loại nào (CategoryID) có tổng số lượng sản phẩm trong khó lớn hơn 350
SELECT CategoryID, SUM(UnitsInStock) as[TotalUnitsInStock]
FROM dbo.Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock)>350;

-- COUNT dùng đếm Id, SUM dùng đếm số lượng 

SELECT *
FROM dbo.Orders;
-- bài 5: hãy cho biết những quốc gia nào có nhiều hơn 7 đơn hàng 
SELECT ShipCountry , COUNT(OrderID) as[TotalOrderID]
FROM dbo.Orders
GROUP BY ShipCountry
HAVING   COUNT(OrderID) >7;

SELECT CustomerID
FROM dbo.Orders
GROUP BY CustomerID;

-- Bài tập 6: Cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao , sắp xếp tăng dần theo ngày giao hàng.

SELECT ShippedDate , COUNT(OrderID) as [TotalOrders]
FROM dbo.Orders
GROUP BY ShippedDate
HAVING COUNT(OrderID)>5
ORDER BY ShippedDate ASC;

--Bài tập 7:Hãy cho biết những quốc gia bắt đầu bằng chữ A hoặc chữ g
-- Và số lượng đơn hàng lớn hơn 29
SELECT ShipCountry , COUNT(*) as [TotalOrders]
FROM dbo.Orders
WHERE ShipCountry LIKE 'A%' OR ShipCountry LIKE 'G%'
GROUP BY ShipCountry 
HAVING COUNT(*) >29
ORDER BY COUNT(*) DESC;

-- Bài 8: hãy cho biết những thành phó nào có số lượng đơn hàng được giao là khá 1 va 2, ngày đặt hàng từ ngày'1997-04-01' đến '1997-08-31'
SELECT ShipCity, COUNT(OrderID) as[TotalOrderID]
FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-8-31'
GROUP BY ShipCity 
HAVING COUNT(OrderID) NOT IN (1, 2);
--GROUP BY ShipCity
--HAVING COUNT(*)  <> 1 AND COUNT(*) <> 2

