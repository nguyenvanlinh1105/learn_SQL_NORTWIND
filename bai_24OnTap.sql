-- TRUY VÂN DỮ LIỆU TỪ NHIỀU BẢNG 
-- HIển thị thông tin của Employ  có mã Oder là  10248
SELECT * FROM dbo.Orders
SELECT e.LastName, e.FirstName, e.BirthDate, e.Address,e.HomePhone
FROM dbo.Employees as e , Orders as o
WHERE  e.EmployeeID= o.EmployeeID and o.OrderID = 10248

-- Ví dụ 1: Từ bảng Product và Catefories hãy in ra các thông tin sau đây: mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm.
SELECT c.CategoryID,c.CategoryName,p.ProductID,p.ProductName
FROM dbo.Products as p , dbo.Categories as c
WHERE p.CategoryID= c.CategoryID;

-- Ví dụ 2: từ bảng Employees và Orders, hãy in ra các thông tin sau đây:
-- Mã nhân viên
-- tên Nhân viên
-- Số lượng đơn hàng mà nhân viên đã bán được 
SELECT e.EmployeeID,e.LastName, e.FirstName, COUNT(o.OrderID) as TongSoDonHang
FROM dbo.Employees as e, dbo.Orders as o
WHERE e.EmployeeID=o.EmployeeID
GROUP BY  e.EmployeeID,e.LastName, e.FirstName
-- Ví dụ 3: từ bảng Customers và Orders, hãy in ra các thông tin sau đây 
-- mã số khách hàng
-- Tên công ty
-- Tên liên hệ
-- Số lượng đơn dã mua  điều kiện quốc gia là UK

SELECT c.CustomerID, c.CompanyName, c.ContactName,c.Country, COUNT(o.OrderID) as SoLuongMua
FROM dbo.Orders as o , dbo.Customers as c
WHERE o.CustomerID=c.CustomerID and c.Country='UK'
GROUP BY c.CustomerID, c.CompanyName, c.ContactName, c.Country
-- Vidu 4: Từ bảng orders và Shippers hãy in ra các thông tin sau:
-- mã nhà vận chuyển 
-- Tên công ty vận chuyển 
-- Tổng số tền được vận chuyển (SUM(Freight))
-- và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần 
SELECT s.ShipperID, s.CompanyName, SUM(o.Freight) as TotalFreight
FROM dbo.Orders as o, dbo.Shippers as s
WHERE o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC
-- Ví dụ 5: Từ bảng Products và bảng Suppliers hãy in ra các thông tin sau đây
-- mã nhà cung cấp
-- Tên công ty 
-- Tổng số các sản phẩm khác nhau đã cung cấp
-- và chỉ in ra màn hình một nhà cung cấp có số  lượng sản phẩm khác nhau nhiều nhất
SELECT TOP 1 s.SupplierID,s.CompanyName,COUNT(p.ProductID) as soLuongSanPham
FROM dbo.Suppliers as s, dbo.Products as p
WHERE s.SupplierID=p.SupplierID
GROUP BY s.SupplierID,s.CompanyName
ORDER BY COUNT(p.ProductID) DESC

--Ví dụ 6: Từ bảng Orders và bảng orders Detail,hãy in ra các thông tin sau đây : Mã đơn hàng
-- Tống số tiền sản phẩm của đơn hàng đó 
SELECT o.OrderID, sum(UnitPrice*Quantity) as toTalFreight
FROM dbo.Orders as o, dbo.[Order Details] as od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID

-- Vi dụ 7: Từ 3 bảng order Details, Employees, orders
-- hãy in ra các thông tin sau
-- Mã đơn hàng
-- tên nhân viên
-- tổng số tiền sản phẩm của đơn hàng
SELECT o.OrderID, e.LastName,e.FirstName , SUM(od.Quantity*od.UnitPrice) as TongTienHang
FROM [Order Details] od, Employees e, Orders as o
WHERE od.OrderID= o.OrderID and e.EmployeeID= o.EmployeeID
GROUP BY o.OrderID, e.LastName,e.FirstName
ORDER BY o.OrderID ASC
-- bai Tập từ 3 bảng trong hình hãy in ra các thông tin sau đâ
-- ORDERS, CUSTOMERS, SHIPPERS
--y : mã đơn hàng , tên khách hàng, tên công ty vận chuyển 
SELECT  o.OrderID, c.CompanyName, s.CompanyName, o.ShipCountry, ShippedDate
FROM dbo.Orders as o, dbo.Customers c, dbo.Shippers s
WHERE o.CustomerID= c.CustomerID and o.ShipVia = s.ShipperID
and o.ShipCountry='UK' and year(o.ShippedDate)= 1997;
-- TASK 2

--Bài tập 1: Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' in ra các thông tin sau đây :
-- Mã thể loại
-- Tên thể loại 
-- Mã sản phẩm 
-- Tên sản phẩm 

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products as p, dbo.Categories as c
WHERE p.CategoryID = c.CategoryID and c.CategoryName='Seafood'

-- Bài tập 2: từ bảng Products và Suppliers, hãy tìm các sản phẩm thuộc được cung cấp từ nước Germany:
-- mã nhà cung cấp
-- Quốc gia
-- mã sản phẩm 
-- tên sản phẩm 
SELECT s.SupplierID, s.Country, p.ProductID, p.ProductName
FROM dbo.Products as p, dbo.Suppliers as s
WHERE p.SupplierID= s.SupplierID and s.Country='Germany'


-- Bài 3: Từ 3 bảng là Orders, Customers, Shippers hãy in ra các thông tin sau đây:
--Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển 
-- Yêu cầu: và chỉ in ra các đơn hàng của các khách hàng đến từ thành phố LonDon
SELECT o.OrderID,c.CompanyName, s.CompanyName, c.City
FROM dbo.Orders as o, dbo.Customers as c, dbo.Shippers as s
WHERE o.CustomerID= c.CustomerID and o.ShipVia= s.ShipperID and c.City='LonDon'

-- Bài 4: Từ 3 bảng  Orders , Customers, Shippers  hãy in ra các thông tin sau
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Ngày yêu cầu chuyển hàng 
-- Ngày giao hàng
-- Và chỉ in ra các đơn hàng bị giao muộn hơn qui định là Required 
SELECT o.OrderID, c.CompanyName, s.CompanyName, o.RequiredDate, o.ShippedDate
FROM dbo.Orders as o, dbo.Customers as c, dbo.Shippers as s
WHERE o.CustomerID= c.CustomerID and o.ShipVia = s.ShipperID
	 and o.ShippedDate>RequiredDate
-- hiển thị shipCountry và số đơn đặt hàng  
-- chỉ in ra khi country đó khác US và tổng số đơn hàng phải lớn hơn 100
SELECT o.ShipCountry, COUNT(o.orderID)
FROM dbo.Orders as o 
WHERE o.ShipCountry not in ('US')
	-- not c.country like 'US'
GROUP BY o.ShipCountry
HAVING COUNT(o.OrderID)>100
