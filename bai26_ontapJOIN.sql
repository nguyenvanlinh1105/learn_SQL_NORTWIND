-- Ôn Tập JOIN
-- Bài 1: INNER JOIN : Liệt kê tên sản phẩm và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng od=> một mã sản phẩm có thể mua nhiều lần nên phải thực hiên DISTINCT
-- Sử dụng INNER JOIN để kết hợp bảng Od với các bảng liên quan để lấy thông tin sản phẩm và nhà cung cấp 
SELECT DISTINCT od.ProductID,p.ProductName,s.CompanyName
FROM dbo.[Order Details] as od
INNER JOIN dbo.Products as p
ON od.ProductID = p.ProductID
INNER JOIN dbo.Suppliers as s 
ON p.SupplierID = s.SupplierID;

-- Bài tập 2: LEFT JOIN 
-- Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders. bao gồm cả các đơn hàng không có nhân viên phụ tracsc, Sử dụng LEFT JOIN để kết họp bảng Orders với bảng Employees để lấy thông tin về khách hàng và nhân viên phụ trách 
-- Employees nhân viên 
-- customers khách hàng 
-- Order Id 
SELECT c.ContactName, e.LastName+' '+e.FirstName as FullName , o.OrderID, c.CompanyName
FROM dbo.Orders as o
LEFT JOIN dbo.Customers as c
ON o.CustomerID = c.CustomerID
LEFT JOIN dbo.Employees as e
ON e.EmployeeID= o.EmployeeID;

-- bài 3: RIGHT JOIN : Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders.
-- bao gồm cả các khách hàng không có đơn hàng , 
-- sử dụng RIGHT JOIN để kết hợp bảng Orders với Bảng Customers để lấy thông tin khách hàng và nhân viên phj trách 
SELECT o.OrderID,c.ContactName, e.LastName+' '+e.FirstName as FullName ,c.CompanyName
FROM dbo.Orders as o
RIGHT JOIN dbo.Employees as e
ON e.EmployeeID= o.EmployeeID
RIGHt JOIN dbo.Customers as c
ON o.CustomerID = c.CustomerID


-- Bài 4: FULL JOIN 
-- Liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products, bao gồm cả các danh mục và nhà cung cấp không có tên sản phẩm, sử dụng FULL JOIN hoạc kết hợp LEFT JOIN  và RIGHT JOIN để lấy thông tin về danh mục và nhà cung cấp 

SELECT DISTINCT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
FROM dbo.Products as p
FULL JOIN dbo.Suppliers as s
ON p.SupplierID = s.SupplierID
FULL JOIN dbo.Categories as c
ON p.CategoryID = c.CategoryID;



-- Bài tập 5: INNER JOIN : Liệt kê tên khách hàng và tên sản phẩm đã được đặt hạng trong bảng Order và Order Details, sử dụng INNER JOIN để kết hợp bảng Orders và Ordes Details đẻ lấy thông tin khách hàng và sản phẩm đã đc đặt hàng
SELECT DISTINCT od.ProductID, c.ContactName, p.ProductName
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o
ON c.CustomerID = o.CustomerID
INNER JOIN  dbo.[Order Details] as od
ON od.OrderID = o.OrderID
INNER JOIN dbo.Products as p 
ON od.ProductID = p.ProductID;

-- nhu trên
 SELECT DISTINCT c.ContactName, p.ProductName
FROM dbo.Orders AS o
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN dbo.Customers AS c
ON o.CustomerID = c.CustomerID
INNER JOIN dbo.Products AS p
ON  od.ProductID = p.ProductID



-- Bài 6: FULL JOIN Liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng Orders , bao gồm cả các đơn không có nhân viên hoặc khách hàng tương ứng , sử dụng FULL JOIN hoặc kết hợp LEFT và RIGHT JOIN để kết hợp bảng Orders vs Employees, Customers để lấy thông tin về nhân viên và khách hàng 
SELECT e.LastName+' '+e.FirstName as FullName , c.ContactName, o.OrderID
FROM dbo.Employees as e
FULL JOIN dbo.Orders as o
ON o.EmployeeID = e.EmployeeID
FULL JOIN dbo.Customers as c 
ON o.CustomerID = c.CustomerID;
