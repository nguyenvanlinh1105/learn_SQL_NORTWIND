-- Sử dụng count , sum, AVG, 
/*
COUNT: đếm số lượng khác null, trong 1 cột, sử dụng COUNT * khi muốn đếm số lượng bản ghi 
	Cú pháp: SELECT COUNT(column_name) FROM table_name;

SUM : tính tông giá trị của một cột bất kì , nếu bất kì giá trị trong cột là null thì kết quả của hàm SUM sẽ là null 
	Cú pháp: SELECT SUM(column_name) FROM table_name;

AVG: Tính giá trị trung bình cho mỗi cột
		nếu tất cả các giá trị trong cột là null thì kết quả của hàm AVG sẽ là null. nêu chỉ một vài giá trị là null , AVG sẽ bỏ qua các giá trị NUll và tính trung bình



*/

-- Ví dụ 1: đếm số lượng khách hàng có trong bảng Customers
SELECT COUNT(CustomerID) as[NumberOfCustomers]
FROM dbo.Customers;

SELECT COUNT (*) as "NumberOfCustomers"
FROM dbo.Customers;

-- Ví dụ 2: Tính tổng số tiền vận chuyển của tất cả các đơn đặt hàng 

SELECT SUM(Freight) as[SumFreight]
FROM dbo.Orders;


--  Ví dụ 3: Tính trung bình số lượng đặt hàng QUantity của tất cả các sản phầm trong bảng Order Details
SELECT AVG(Quantity) as "AVG số lượng đặt hàng"
FROM [dbo].[Order Details]


-- Ví dụ 4: Đếm số lượng, tính tổng số lượng hàng tồn kho và trung bình các sản phẩm có trong bảng

SELECT COUNT(*)as "Số lượng", SUM(UnitsInStock)as "Số lượng hàng tồn kho",AVG(UnitPrice) as"Trung bình giá bán"
FROM dbo.Products;


-- Bài tập :  Hãy đếm số lượng đơnhàng từ bảng Orders với 2 cách 
			-- Cách 1: dùng *
			-- Cách 2: dùng mã đơn hàng 

SELECT COUNT(*) 
FROM dbo.Orders;

SELECT COUNT (OrderID)
FROM dbo.Orders;

-- Bài tập 2: Từ bảng Order Details hãy tính trung bình cho cột Unitprice và tỉnh tổng cho cột Quantity

SELECT AVG(UnitPrice) as "Trung bính giá ", SUM(Quantity) as"Tổng số lượng "
FROM dbo.[Order Details]

--3.tính tổng các CategoryID và tổng các CategoryID khác nhau từ bảng Products
SELECT SUM(CategoryID) as[All], 
		SUM(DISTINCT CategoryID) as "difference Id"
FROM dbo.Categories;

