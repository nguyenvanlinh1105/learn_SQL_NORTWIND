-- Luyên tập về SubQuery 
-- Bài tập 1: tìm những đơn hàng đặt có ngày đặt hàng gần nhất
 SELECT MAX(o.OrderDate)
 FROM dbo.Orders o 

 SELECT *
 FROM dbo.Orders as o 
 WHERE o.OrderDate =(SELECT MAX(o.OrderDate)
					FROM dbo.Orders o )

-- Bài tập 2: Liệt kê tất cả các sản phẩm (Product Name )
-- mà không có đơn đặt hàng nào mua chúng
SELECT DISTINCT ProductID
FROM dbo.[Order Details]
-- mã của của sản phẩm đã bị mua 

SELECT *
FROM dbo.Products as p
WHERE p.ProductID NOT IN (SELECT DISTINCT ProductID	
							FROM dbo.[Order Details])
-- Bài tập 2: Tìm ra nhũng thông tin đơn hàng ,
--và tên sản phẩm thuộc các đơn hàng chưa được giao cho khách 

SELECT OrderID 
FROM dbo.Orders o 
WHERE ShippedDate IS NULL;
-- Lấy ra các mã đơn hàng chưa được giao cho khách 

SELECT o.OrderID,p.ProductName
FROM dbo.Orders o
INNER JOIN dbo.[Order Details] as od
ON o.OrderID = od.OrderID
INNER JOIN dbo.Products as p
ON od.ProductID = p.ProductID
WHERE o.OrderID IN (SELECT OrderID 
					FROM dbo.Orders 
					WHERE ShippedDate IS NULL)


--- Bài tập 4: Lấy thông tin của sản phẩm 
--có số lượng tồn kho ít hơn số lượng tồn kho trung bình


SELECT AVG(p.UnitsInStock )
FROM dbo.Products  as p
-- Gia trị số lượng tồn kho trung bình của các sản phẩm 

SELECT *
FROM dbo.Products  
WHERE UnitsInStock<(SELECT AVG(p.UnitsInStock)
					FROM dbo.Products as p)


-- Bài tập:  Lấy thông tin các khách hàng có tổng giá trị đơn hàng lớn nhất

SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
FROM dbo.[Order Details]  as od 
GROUP BY OrderID
-- Tính tổng đơn hàng của các khách hàng 

SELECT  MAX(TotalFreight) as "MaxFreight"
FROM (SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
FROM dbo.[Order Details]  as od 
GROUP BY OrderID ) as TEMP

-- tính max giá đơn hàng
SELECT OrderID , TotalFreight
FROM (SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
FROM dbo.[Order Details]  as od 
GROUP BY OrderID ) as Temp
WHERE TotalFreight =(SELECT  MAX(TotalFreight) as "MaxFreight"
							FROM (SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
							FROM dbo.[Order Details]  as od 
							GROUP BY OrderID ) as TEMP)


SELECT c.*
FROM dbo.Customers as c
INNER JOIN Orders as o 
ON c.CustomerID = o.CustomerID
WHERE o.OrderID =(SELECT OrderID 
	FROM (SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
	FROM dbo.[Order Details]  as od 
	GROUP BY OrderID ) as Temp
	WHERE TotalFreight =(SELECT  MAX(TotalFreight) as "MaxFreight"
								FROM (SELECT od.OrderID, SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
								FROM dbo.[Order Details]  as od 
								GROUP BY OrderID ) as TEMP)

)
-- đầu tiên đi tính tất cả giá trị đơn hàng 
-- tìm max của giá đơn hàng
-- từ bảng giá và id đã tìm được khi sum  giá đơn hàng 
/*
SUM(od.UnitPrice* od.Quantity) as "TotalFreight"
							FROM dbo.[Order Details]  as od 
							GROUP BY OrderID ) as TEMP

Ta lấy được OrderID của sản phẩm có giá cao nhất với điều kiện max của giá vừa tính được 




*/
SELECT c.*
FROM Orders as o
INNER JOIN Customers as c
ON o.CustomerID=c.CustomerID 
WHERE o.OrderID IN 
	(SELECT OrderID
	FROM 
		(SELECT OrderID, SUM(UnitPrice*Quantity) AS Order_TotalPrice
		FROM [Order Details]
		GROUP BY OrderID) as temp
	WHERE temp.Order_TotalPrice= 
		(SELECT Max(temp.Order_TotalPrice) 
		FROM 
			(SELECT OrderID, SUM(UnitPrice*Quantity) AS Order_TotalPrice
			FROM [Order Details]
			GROUP BY OrderID)
		as temp));





