-- IS NULL , IS NOT NULL: Kiểm tra giá trị NULL

/*
	Cú pháp : SELECT column_name 
	FROM table_name
	WHERE column_name IS NOT NULL

*/
-- Ví dụ: lấy ra tất cả các đơn hàng chưa được giao hàng ShippedDate =NULL
SELECT COUNT(*)
FROM dbo.Orders
WHERE ShippedDate IS NULL;
-- Ví dụ 2: Lấy danh dách khách hàng có khu vục Region ko bị null
SELECT *
FROM dbo.Customers
WHERE Region IS NOT NULL;
-- Ví dụ 3: Lấy danh sách khách hàng không có tên công ty 
SELECT * 
FROM dbo.Customers
WHERE CompanyName IS NULL;

-- Bài tập: Hãy lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vục giao hàng không bị NULL
SELECT *
FROM dbo.Orders 
WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL;

/*
Câu 1: Lấy ra tất cả các loại mà tên loại từ bảng (Categorys) được để không được trống, nghĩa là tên loại phải không được rỗng.
Câu 2: Lấy ra tất cả những nhân viên mà không có phần báo cáo (ReportsTo) từ bảng (Employees), nghĩa là ở phần báo cáo của từng nhân viên phải rỗng.
*/
-- Câu 2:
SELECT *
FROM dbo.Employees
WHERE ReportsTO IS NULL;

