-- SELECT DISTINCT : lấy ra nhưng dữ liệu riêng biệt không bị trùng lặp 
-- chức năng lọc ra những dữ liệu không trùng lặp ở những ô dữ liệu trùng lặp thì nó chỉ lấy một giá trị dữ liệ 
SELECT CustomerID, CompanyName,COUNT(CustomerID) as [Total]
FROM dbo.Customers
GROUP BY CustomerID,CompanyName
Having count(customerID)>20;


SELECT DISTINCT Country
FROM dbo.Customers;

SELECT DISTINCT CompanyName, Country
FROM dbo.CustomerS;
-- Ví dụ như ở câu lệnh trên thì CompanyName có các tên khác nhau nên Country ko thể lấy ra những dữ liệu khác nhau

-- Ví dụ 2: Viết câu lệnh SQL lấy ra tên các mã số bưu điện (PostalCode) khác nhau từ bảng nhà cung cấp Suppliers;
SELECT DISTINCT PostalCode 
From dbo.Suppliers;

-- Ví dụ 3 từ bảng nhân viên hãy lấy ra các dữ liệu khác nhau về họ của nhân viên và cách gọi danh hiệu lịch sử(TitleOfCourtesy) của nhân viên từ bảng Employees
SELECT DISTINCT  TitleOfCourtesy,LastName
FROM dbo.Employees;

-- bài tập: Viết câu lệnh SQL lấy ra mã đơn vị vận chuyển (ShipVia) khác nhau của các đơn hàng Orders
SELECT DISTINCT [ShipVia]
FROM dbo.Orders;


