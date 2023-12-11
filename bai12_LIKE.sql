/*
Toán tử >, <, =, <=,>= dùng để so sánh các kiểu dữ liệu kiểu số 
Toán tử LIKE dùng để so sánh các kiểu dữ liệu kiểu chuỗi
Cú pháp: SELECT column1, column2,...
		FROM table_name
		WHERE columnN LIKE pattern 
==> Có hai kí tự đại diện thường được sử dụng cùng với LIKE :
	Dấu %: đại diện cho không , một hoặc nhiều kí tự,
	Dấu _ : đại diện cho một kí tự đơn 
	*/


use NORTHWND;

-- Ví dụ 1: Lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
SELECT *
FROM dbo.Customers
WHERE Country LIKE 'A%';

-- Ví dụ 2: lấy Danh sách các đơn đặt hàng được gửi đến thành phố có chứa chữ a
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE '%a%';

-- Lọc ra tất cả các đơn hàng với điều kiện shipCountry LIKE 'U_'
								-- ShipCountry LIKE 'U%';

SELECT *
FROM dbo.Orders
WHERE ShipCountry LIKE 'U_';--=> kết quả chỉ lấy ra được 2 kí tự là U +1 kí tự đơn 

SELECT *
FROM dbo.Orders
WHERE ShipCountry LIKE 'U%';--=> kết quả lấy ra được có thể là 2 hoặc nhiều hơn 2 kí tự 

-- Bài tập : lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty 
-- Suppliers
SELECT * 
FROM dbo.Suppliers
WHERE CompanyName LIKE '%b%';

/*
Câu 1: Lấy ra tất cả nhân viên mà trong tên có chữ ‘D’ trong tên của họ.
Câu 2: Lấy ra tất cả các sản phẩm mà tên sản phẩm có chữ cái ‘x’.
*/
-- Câu 1: 
SELECT * 
FROM dbo.Employees
WHERE FirstName LIKE '%D%';

-- câu 2: 
SELECT * 
FROM dbo.Products
WHERE ProductName LIKE 'x';