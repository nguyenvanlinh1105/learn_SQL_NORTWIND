/*
HAVING : Lọc dữ liệu sau GROUP BY :  nhưng cột mới sau khi GROUP BY như Total thì ta không thể để vào where
mà ta phải để vào HAVING
Cú pháp :
SELECT column_name(s)
FROM table-name
WHERE condition 
GROUP BY column_name(s)
HAVING condition 
ORDER BY column_name(s)

*/
-- Ví dụ : Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
SELECT CustomerID, COUNT(OrderID) as [Total]
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID)>20
ORDER BY [Total] DESC;
--ví dụ 2: Hãy lọc ra những nahf cung cấp sản phẩm có tổng số lượng hàng trong kho UnitsInStock lớn hơn 30 và có trung bình đơn giá UnitPrice có giá trị dưới 50
SELECT SupplierID , SUM(UnitsInStock) As[TotalUnitsInStock],
	AVG(UnitPrice) as[AVGPirce]
FROM dbo.Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock)>30 AND AVG(UnitPrice)<50;
--Ví dụ 3: Hãy cho biết tổng số tiền vận chuyển của từng tháng , trong nữa năm sau của năm 1996, sắp xếp theo tháng tăng dần 
SELECT MONTH(ShippedDate) as [MONTH], SUM(Freight) as [TotalFreight]
FROM dbo.Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate) 
ORDER BY  MONTH(ShippedDate) ASC;
--Ví dụ 3: Hãy cho biết tổng số tiền vận chuyển >1000 của từng tháng , trong nữa năm sau của năm 1996, sắp xếp theo tháng tăng dần 
SELECT MONTH(ShippedDate) as [MONTH], SUM(Freight) as [TotalFreight]
FROM dbo.Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate) 
HAVING SUM(Freight)>1000
ORDER BY  MONTH(ShippedDate) ASC;

-- bài tập về nhà : Hãy lọc ra những thành phố có số lượng đơn hàng >16 và sắp xếp theo tổng số lượng giảm dân f
SELECT ShipCity , COUNT (OrderId) as[TotalOrders]
FROM dbo.Orders
GROUP BY ShipCity
HAVING  COUNT (OrderId) >16
ORDER BY  COUNT (OrderId) DESC;