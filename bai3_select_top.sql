-- SELECT-TOP: giới hạn số lượng dòng (hoặc %) được trả về khi gọi lệnh SELECT
-- Lấy ra 5 dòng đầu tiên trong bảng Customers

SELECT TOP 5 * -- lấy ra theo số dòng
FROM dbo.Customers;


-- Lấy ra theo dòng theo số %, hoặc số cột chỉ định
-- Lấy ra ra 30% nhân viên của công ty hiện tại
SELECT TOP 30 percent *
FROM dbo.Employees;

-- Ví dụ lấy ra các đơn hàng với quy định là mã khách hàng không đc trùng lặp , chỉ lấy 5 dòng dữ liệu đầu tiên 
SELECT DISTINCT TOP 5 * 
FROM dbo.Orders;
