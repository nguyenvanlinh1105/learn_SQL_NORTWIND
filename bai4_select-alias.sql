-- bài 4 bí danh alias , vì sao cần đặt bí danh ?

-- Cú pháp: SELECT column_nam AS alias_name
-- alias đặt ngắn gọn dễ hiểu, rõ ràng, đơn giản 
-- có thể ko sử dụng từ khóa as nhma khuyên nên sử dụng và alias thay thể đc đặt trong một "" hoặc là []
-- Viết câu lệnh SQL lấy CompanyName và đặt tên thay thế là Công ty;  PostalCode và đặt tên thay thế là mã bưu điên
use NORTHWND;
SELECT CompanyName as "Công ty", PostalCode as MaBuuDien, City "Thành phố"
FROM dbo.Customers;

-- Ví dụ 2 : Employees
SELECT LastName "HỌ", FirstName as "Tên"
FROM dbo.Employees;
-- Ví dụ 3 viết câu lệnh SQL lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Orders, đặt tên thay thế cho bảng Orders là o
SELECT TOP 15 *
FROM dbo.Orders as "o";

SELECT TOP 15 [o].*
FROM dbo.Orders as [o];


-- Bài tập : Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như sao 
/*
	ProductName => tên sản phẩm 
	SupplierID=> Mã nhà cung cấp
	CategoryId =>Mã thể loại 
	Và đặt tên thay thể cho bảng Product là "p", sử dụng tên they thi khi thay thế các cột trên và chỉ lấy ra 5 sản phầm đẩu tiên trong bảng 
*/
SELECT TOP 5 p.ProductName as "Tên sản phẩm ", p.SupplierID as "mã nhà cung cấp", p.CategoryID as [Mã thể loại]
FROM dbo.Products as "p";

SELECT * 
FROM dbo.Products;
