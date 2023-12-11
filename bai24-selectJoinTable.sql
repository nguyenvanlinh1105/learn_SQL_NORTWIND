-- bài 24: truy vấn dữ liệu từ nhiều bảng 

/*
Từ bảng Products và bảng Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' in ra các thông tin sau đây 
-- Mã thể loại 
-- Tên thể loại
-- mã sản phẩm 
- tên sản phẩm 
*/

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products as p, dbo.Categories as c 
WHERE c.CategoryID= p.CategoryID AND c.CategoryName='Seafood';


-- Bài tập 2: từ bảng Products và Suppliers , hãy tìm các sản phẩm thuộc được cung cấp từ nước Germany 
-- mã nhà cung cấp
-- quốc gia 
-- mã sản phẩm 
-- tên sản phẩm 
SELECT s.SupplierID, s.Country, p.ProductID, p.ProductName
FROM dbo.Products as p, dbo.Suppliers as s
WHERE s.SupplierID = p.SupplierID AND s.Country ='Germany';


-- Bài tập 3: Từ 3 bảng Orders, Customers, Shippers hay lấy ra các thông tin sau đây 
-- Mã đơn hàng 
-- Tên khách hàng, 
-- Tên công ty vận chuyển 
-- và chỉ in ra các đơn hàng của các khách hàng đến từ thành phố 'London'
SELECT o.OrderID, c.ContactName, c.CompanyName, c.City
FROM dbo.Orders as o, dbo.Customers as c, dbo.Shippers as s
WHERE o.CustomerID = c.CustomerID AND
		o.ShipVia = s.ShipperID AND 
		c.City='London';


-- bài tập 4: từ ba bản Orders , Customers, Shippers 
-- lấy ra mã đơn hàng 
-- tên khách hàng 
-- tên công ty vận chuyển 
-- ngày yêu cầu chuyển hang
-- ngày giao hàng
-- và chỉ in ra các đơn hàng bị giao muộn hơn quy đinh

SELECT o.OrderID, c.ContactName, c.CompanyName, o.RequiredDate, o.ShippedDate
FROM dbo.Orders as o, dbo.Customers as c, dbo.Shippers as s
WhERE o.CustomerID = c.CustomerID AND o.ShipVia = s.ShipperID  AND o.ShippedDate>o.RequiredDate;



-- Bài tập về nhà : từ bảng Orders, Customers, Shippers hãy lấy ra shipcountry, 
-- những khách hàng không đến từ USA 
-- chỉ chọn những nước có hơn 100 đơn 

SELECT o.ShipCountry, COUNT(o.OrderID) as [TotalOrderID]
FROM dbo.Orders as o, dbo.Customers as c, dbo.Shippers as s
WHERE o.CustomerID = c.CustomerID AND o.ShipVia = s.ShipperID AND o.ShipCountry <>'USA'
GROUP BY o.ShipCountry
HAVING COUNT(o.OrderID)>100;

