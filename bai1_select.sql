-- Viết câu lệnh SQL để lấy ra hết tên của sản phẩm 
use NORTHWND;
SELECT ProductName 
FROM dbo.Products;
-- Viết câu lệnh SQL lấy ra tên sản phẩm, Giá bán trên mỗi đơn vị, và số lượng sản phẩm trên đơn vị
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM dbo.Products;
-- Viết câu lệnh SQL lấy ra tên công ty của khách hàng và quốc gia của các khách hàng đó 
SELECT CompanyName, Country
FROM dbo.Customers;
-- Viết câu lệnh SQL lấy ra tên và số điện thoại của tất cả nhà cung cấp hàng 
SELECT companyName, Phone
FROM dbo.Suppliers;
-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng nhân viên -Employees
SELECT * 
FROM [dbo].[CustomerDemographics];
-- Viết ra câu lệnh SQL lấy ra ngày sinh, thành phố hiện tại và số điện thoại nhà của các nhân viên
SELECT LastName, FirstName, BirthDate, City, HomePhone
FROM dbo.Employees;
-- Viết câu lệnh SQl lấy ra tất cả dữ liệu từ bảng products
SELECT *
FROM dbo.Products;