-- OrderBy 
/*
	SELECT column1, column2,...
	FROM table_name
	ORDER BY column1, column2,.. ASC|DESC;
	ASC: sắp xếp tăng dần(mặc định nếu không ghi)
	DESC: sắp xếp giảm dần.
*/

SELECT ProductID 
FROM dbo.Products
ORDER BY ProductID DESC;

-- Ví dụ liệu kê cac snhaf cung cấp theo thứ tự tên đơn vị companyName từ a->z
SELECT *
FROM dbo.Suppliers
ORDER BY CompanyName ASC;



-- Ví dụ 2: Bạn hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần.
--dbo.Product
SELECT *
FROM dbo.Products
ORDER BY ProductID DESC, UnitPrice DESC;

-- Ví dụ 3: Hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm từ a-z không dùng ASC|DESC
-- dbo.Employees
--cách 1
SELECT *
FROM dbo.Employees
ORDER BY LastName ASC, FirstName ASC; 

--cách 2
SELECT * 
FROM dbo.Employees
ORDER BY LastName, FirstName;

-- Ví dụ 4: hãy lấy ra số sản phẩm có số lượng bán cao nhất từ bảng [Order Details]
-- Yêu cầu không được dùng max
SELECT TOP 1 *
FROM dbo.[Order Details]
ORDER BY Quantity DESC

-- bài tập về nhà : Hãy liệt kê danh sahcs các đơn đặt hàng (OrderID) trong bảng Orders theo thứ tự giảm dần Của ngày đặt hàng (OrderDate)
-- Ngày giảm dần(DESC) : ngày mới nhất đến ngày cũ nhất, 
-- Ngày tăng dần ASC: ngày cũ nhất đến  ngày mới nhất,
SELECT OrderID , OrderDate
FROM dbo.Orders 
ORDER BY OrderDate DESC;


-- Bài tập 2: Hãy liệt kê tên, đơn giá , số lượng trong kho UnitsInStock của tất cả các sản phẩm trong bảng Products, theo thứ tự giảm dần của UnitsInStock;
-- dbo.Products;

SELECT ProductName, UnitPrice, UnitsInStock
FROM dbo.Products 
ORDER BY UnitsInStock DESC;

-- bài cmt 
-- Câu 1: Viết câu lệnh SQL liệt kê các nhà cung cấp theo yêu cầu là tên quốc gia của các nhà cung cấp (bảng Suppliers) theo chiều tăng A -> Z.
--Câu 2: Viết câu lệnh SQL liệt kê họ và tên, địa chỉ của nhân viên theo tiêu chí giảm dần ngày sinh của các nhân viên trong (bảng Employees).
-- ngày sinh giảm dần DESC, ngày sinh tăng dần ASC
-- câu 1:
SELECT *
FROM dbo.Suppliers
ORDER BY Country ASC;
-- câu 2:
SELECT LastName , FirstName, Address
FROM dbo.Employees
ORDER BY BirthDate DESC;



