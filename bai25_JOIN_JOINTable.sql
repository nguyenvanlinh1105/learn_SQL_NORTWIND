-- JOIN : Trả về tất cả các hàng khi có ít nhất một giá trị ở cả hai bảng 

/*
SELECT column_name (s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

*/
-- ví dụ: Sử dụng INNER JOIN, hãy in ra các thông tin sau đây
-- mã đơn hàng 
--tên công ty khách hàng 
SELECT o.OrderID, c.ContactName
FROM dbo.Orders as o
INNER JOIN dbo.Customers as c
ON o.CustomerID = c.CustomerID;
-- Sử dụng INNER JOIN : Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
-- mã thể loại
-- tên thể loại 
-- Mã sản phẩm 
-- tên sản phẩm 


SELECT p.CategoryID,c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products as p
INNER JOIN dbo.Categories as c
ON p.CategoryID = c.CategoryID;

-- ví dụ 3: Sử dụng INNER JOIN , từ bảng Products và Categories, hãy đưa ra các thông tin sau đâ
-- Mã thế loại 
-- Tên thể loại 
-- Số lượng sản phẩm 
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM dbo.Products as p
INNER JOIN dbo.Categories as c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName

/*
LEFT JOIN 
==> Trả lại tất cả các dòng từ bảng bên trái , và các dòng đứng điều kiện từ bảng bên phải. 
Cú phap
SELECT column_name(s)
FROM dbo. table1
LEFT JOIN table 2
ON table1.column_name = table2.column_name;

*/
-- ví dụ 4: từ ví dụ 3 hãy sử dụng LEFT JOIN để thực hiện đếm số sản phẩm dựa trên mã thể loại 
-- INNER JOIN 

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM dbo.Categories as c
INNER JOIN dbo.Products as p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;
-- Lấy những thông tin chỉ tồn tại ở hai bảng khi so sánh qua categoryID ,


SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM dbo.Categories as c
LEFT JOIN dbo.Products as p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;
-- Lấy hết tất cả CategoryID từ bảng categories(bên trái) rồi lấy thêm phần giao 

/*
RIGHT JOIN lấy toàn bộ những phần ở bảng bên phải mặc dù nó không nằm ở bảng bên trái ,  rồi mới lấy phần giao 


*/

--Ví dụ 6: sử dụng RIGHT JOIN , hãy in ra các thông tin sau đây
-- Mã đơn hàng
-- tên công ty khách hàng 
SELECT o.OrderID, c.CompanyName, COUNT (o.OrderID)
FROM dbo.Orders as o
RIGHT JOIN dbo.Customers as c
ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CompanyName;


/*
FULL JOIN 
=>>> tất hợp tất cả JOIN 
==>> trả về tất cả các dòng đúng với 1 trong các bảng 

Cú pháp :
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition ;

*/
-- ví dụ 8 Sử dụng FULL JOIN 
-- Từ bảng Products và Categories hãy in ra các thông tin 
-- Mã thể loại 
-- Tên thể loại 
-- mã sản phẩm 
-- Tên sản phẩm 
SELECT c.CategoryID , c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products as p
FULL OUTER JOIN  dbo.Categories as c
ON c.CategoryID = p.CategoryID 
/*
Bài tập 1: INNER JOIN hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng Order 
Bài tập 2: LEFT JOIN hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng Products bao gồm cả các sản phẩm không có nhà cung cấp 
bài tập 3: RIGHT JOIN Hãy liệt kê tên khách hàng và tên đơn hàng của đơn hàng trong bảng Orders , bao gồm cả các khách hàng không có đơn hàng 
Bài tập 4 FULL JOIN Hãy liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products , bao gồm cả các danh mục và nhà cung câp không có sản phẩm 
*/
-- Bài tập 1:
SELECT e.LastName+' ' +e.FirstName as FullName, c.ContactName, o.OrderID
FROM dbo.Orders as o
INNER JOIN dbo.Customers as c
ON o.CustomerID= c.CustomerID
INNER JOIN dbo.Employees as e
ON e.EmployeeID = o.EmployeeID;

-- Bài tập 2: 
SELECT p.ProductID,s.CompanyName, p.ProductName
FROM dbo.Products as p
LEFT JOIN dbo.Suppliers as s
ON p.SupplierID = s.SupplierID;

--bài tập 3: RIGHT JOIN Hãy liệt kê tên khách hàng và tên đơn hàng của đơn hàng trong bảng Orders , bao gồm cả các khách hàng không có đơn hàng 
 SELECT c.ContactName, o.ShipName
 FROM dbo.Orders as o
 RIGHT JOIN dbo.Customers as c
 ON o.CustomerID = c.CustomerID;

 --Bài tập 4 FULL JOIN Hãy liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products , bao gồm cả các danh mục và nhà cung câp không có sản phẩm 

 SELECT c.CategoryID,s.CompanyName, p.ProductName
 FROM dbo.Products as p
 FULL OUTER JOIN dbo.Categories as c
 ON p.CategoryID = c.CategoryID
 FULL OUTER JOIN dbo.Suppliers as s
 ON p.SupplierID = s.SupplierID

 -- Thử thách:- Thử thách 
-- 1. In ra tên nhân viên , tổng số đơn nhân viên đó bán được  (Bảng Employees , Bảng Orders)
-- Dùng LEFT JOIN 
-- Bao gồm nhân viên chưa bán được hàng (Mới thêm vào)


SELECT e.EmployeeID, e.LastName +' '+ e.FirstName as FullName , COUNT(o.OrderID)
FROM dbo.Employees as e 
LEFT JOIN dbo.Orders as o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName

