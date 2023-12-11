--- GROUP BY
/*
Cú pháp : 
SELECT column_name(s) 
FROM table_name
WHERE condition
GROUP By column_name (s)
ORDER BY column_name (s)
==> chức năng dùng để nhóm các dòng dữ liệu có cùng giá trị, Thường được dùng với các hàm COUNT(), MAX(), MIN, SUM(), AGV()
*/

-- Ví dụ 1: Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
SELECT CustomerID, COUNT(OrderID) as [Total Order]
FROM dbo.Orders
GROUP BY CustomerID;
SELECT *
FROM dbo.Employees;

-- Ví dụ 2: Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
SELECT SupplierId, AVG(UnitPrice) as"PriceRatio"
FROM dbo.Products
GROUP BY  SupplierId;

--Ví dụ 3: hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phầm trong kho
SELECT CategoryID, SUM(UnitsinStock) as"TotalSTock"
FROM dbo.Products
GROUP BY CategoryID;

-- Ví dụ 4: hãy cho biết giá vận chuyển thấp nhất và lớn nhất của cac đơn hàng theo từng thành phố và quốc gia khác nhau.
-- Order 
SELECT ShipCountry, ShipCity,
		MIN(Freight) as[MinFreight],
		MAX(Freight) as[MaxFreight]
FROM dbo.Orders
GROUP BY ShipCountry, ShipCity
ORDER BY  ShipCountry ASC, ShipCity ASC;

-- Bài tập: Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau 
SELECT Country, COUNT(EmployeeID)
FROM dbo.Employees
GROUP BY Country;