-- SELECT TABLE từ nhiều bảng 
-- Ví dụ 1: từ bảng Products và Categories, hãy in ra các thông tin sau đây: 
-- Mã thể loại 
-- Tên thể loại 
-- Mã sản phẩm 
-- Tên sản phẩm 
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName 
FROM dbo.Products as p, dbo.Categories as c
WHERE c.CategoryID = p.CategoryID;


/*
 Ví dụ 2: từ bảng Employees và Orders, hãy in ra các thông tin sau đây: 
	 -Mã nhân viên
	 - tên nhân viên
	 - Số lượng đơn hàng mà nhân viên đã bán được 

*/



SELECT e.EmployeeID, e.LastName +' '+ e.FirstName as "FullName", COUNT (o.OrderID) as [TotalOrderID]
FROM dbo.Employees as e, dbo.Orders as o
WHERE e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName;
-- phải group by thêm e.lastname và e.firstName thì mới có thể thực hiện được việc tính tổng count của cột đã chọn.

/*
từ -bảng customers và orders, hãy in ra các thông tin sau đây: 
-mã số khách hàng 
- tên công ty
- tên liên hệ 
- Số lượng đơn hàng đã mua 
 với điều kiện quốc gia của khách hàng là UK 
 */
 SELECT c.CustomerID, c.CompanyName , c.ContactName, COUNT(o.OrderID) as [TotalOrderID], c.Country
 FROM dbo.Customers as c, dbo.Orders as o
 WHERE c.CustomerID = o.CustomerID AND c.Country='UK'
 GROUP BY c.CustomerID,c.CompanyName, c.ContactName ,c.Country;
 /*
 Từ bảng Orders và Shippers , hãy in ra các thông tin sau đây
 -- Mã nhà vận chuyển 
 -- tên công ty
 -- Tổng số tiền đc vận chuyển sum Freight 
 -- và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần 

 */

SELECT  s.ShipperID, s.CompanyName , SUM(o.Freight) as [TotalFreight]
FROM dbo.Orders as o, dbo.Shippers as s
WHERE o.ShipVia= s.ShipperID
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(Freight) DESC;

/*
Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây 
-- mã nhà cung cấp 
-- tên công ty 
-- tổng số các sản phẩm khác nhau đã cung câp s
và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất
*/

SELECT TOP 1 s.SupplierID, s.CompanyName,COUNT(p.ProductID) as [TotalProductID]
FROM dbo.Products as p, dbo.Suppliers  as s
WHERE s.SupplierID= p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY COUNT(p.ProductID) DESC;


/*
-- Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây:
-- Mã đơn hàng 
-- Tổng số tiền sản phẩm của đơn hàng đó 

*/

SELECT o.OrderID , SUM(od.UnitPrice *od.Quantity ) as [TotalPrice]
FROM dbo.Orders as o, dbo.[Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID;

/*
Ví dụ 7: từ 3 bảng trong hình hãy in ra các thông tin sau đây 
-- mã đơn hàng 
-- tên nhân viên 
-- tổng số tiền sản phẩm của đơn hàng 

*/

SELECT o.OrderID, e.LastName+' ' +e.FirstName as FullName, SUM(od.UnitPrice*od.Quantity) as "Total Price"
FROM dbo.[Order Details] as od, dbo.Orders as o, dbo.Employees as e
WHERE od.OrderID = o.OrderID AND o.EmployeeID = e.EmployeeID
GROUP BY o.OrderID, e.LastName ,e.FirstName ;


/*
bài tâp 1: từ 3 bảng trong hình hãy in ra các thông tin sau đây 
-- mã đơn hàng 
-- tên khách hàng
-- tên công ty vận chuyển 
Và chỉ in ra các đơn hàng được giao đến trong năm 1997


*/
SELECT o.OrderID, c.ContactName, c.CompanyName, o.ShipCountry, o.RequiredDate
FROM dbo.Orders as o, dbo.Shippers as s, dbo.Customers as c
WHERE o.CustomerID = c.CustomerID AND o.ShipVia = s.ShipperID AND o.ShipCountry ='UK' AND YEAR(o.RequiredDate) ='1997'
GROUP BY o.OrderID, c.ContactName, c.CompanyName, o.ShipCountry, o.RequiredDate;





