-- Tìm min -max 
use NORTHWND;

/*
Cú pháp : SELECT MIN(column_name)
		FROM table_name;
*/

-- Ví dụ: viết câu lệnh SQL tìm giá trị thấp nhất của các sản phẩm trong bảng products
SELECT MIN(UnitPrice) as "Min price"
FROM dbo.Products;

 -- Ví dụ : Viết câu lệnh SQL lấy ra ngày đặt hàng gần nhất từ bảng orders
SELECT MAX(OrderDate) as"Ngày đặt hàng gần nhất"
FROM dbo.Orders;

-- Ví dụ 3: Viết câu lệnh SQL tìm ra sản phẩm ( lấy mã sản phẩm và tên sản phẩm) có số lượng hàng tồn kho lớn nhất 

SELECT ProductID, ProductName, UnitsInStock
FROM dbo.Products
WHERE UnitsInStock = (SELECT MAX(UnitsInStock) FROM dbo.Products);
-- Ví dụ 4: Viết câu lệnh SQL tìm ra số lượng hàng tồn kho lớn nhất
SELECT MAX(UnitsInStock) as "Giá trị hàng tồn kho lớn nhất"
FROM dbo.Products;



-- bài tâp Vè nhà: hãy cho biết tuổi dời của nhân viên lớn nhất ctrong công ti 
-- ai có ngày sinh càng nhỏ thì càng lớn tuổi 

SELECT LastName, FirstName, BirthDate
FROM dbo.Employees
WHERE 
BirthDate = (SELECT MIN(BirthDate)FROM dbo.Employees);
