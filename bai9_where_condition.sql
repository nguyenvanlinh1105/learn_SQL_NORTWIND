-- Lọc dư liệu trong truy vấn 
/*
	Cú pháp : SELECT column1, column2,... 
		FROM table_name
		WHERE condition ;
WHERE để được sử dụng để đọc bản ghi 
Nó được sử dụng để trích xuất những bản ghi , đáp ứng một điều kiện cụ thể .
	Các phép so sánh
*/


-- Ví dụ 1: Hãy liệt kê tất cả các  nhân viên đến từ thành phó London 

SELECT *
FROM dbo.Employees
WHERE City = 'LonDon'
ORDER BY LastName ASC;

-- Ví dụ 2: Hãy liệt kê tất cả các đơn hàng bị giao muộn, biết rằng ngày giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
SELECT COUNT (*) As "Số đơn giao hàng muộn" 
FROM dbo.Orders
WHERE ShippedDate>RequiredDate;


-- Ví dụ 3: 
--Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
SELECT COUNT (*)
FROM dbo.[Order Details]
WHERE Discount>0.1;

-- Lấy ra các đơn hàng giảm giá từ 10 đến 20%
SELECT  COUNT (*) 
FROM dbo.[Order Details]
WHERE Discount between 0.1 and 0.2;


-- bài tập về nhà: Hãy liệt kê tất cả các đơn hàng được gủi đến quốc gia là France

SELECT * 
FROM dbo.Orders
WHERE  ShipCountry = 'France';

-- Bài tập về nhà : Hãy liệt kê các sản phẩm có số lượng hàng trong kho lớn hơn 20 
SELECT *
FROM dbo.Products
WHERE UnitsInStock > 20;
/*
Challenges:
1. Liệt kê những nhà cung cấp có mã FAX khác NULL
2. Liệt kê tất cả khách hàng có ContactTitle là Sales Manager

*/
SELECT * 
FROM dbo.Customers
WHERE Fax!= null;

SELECT * 
FROM dbo.Customers
WHERE ContactTitle ='Sales Manager';