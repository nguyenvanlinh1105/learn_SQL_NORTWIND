-- Cộng -trừ -nhân- chia-chia lấy dư 


--Ví dụ 1: Tính số lượng sản phẩm còn lại trong kho sau khi bán hết các sản phầm đã được đặt hàng(UnitsOnOrder)

SELECT ProductId, ProductName,
UnitsInStock, UnitsOnOrder,
(UnitsInStock - UnitsOnOrder) as[StockRemaining]
FROM dbo.Products;

-- Ví dụ 2: Tính giá trị đơn hàng chi tiết cho tất cả các sản phầm trong bảng OrderDetails
-- OrderDetailValue = UnitPrice x Quantity

SELECT *, 
	(UnitPrice * Quantity)as"OrderDetailValue"
FROM dbo.[Order Details];


-- Ví dụ 3: Tính tỉ lệ giá vận chuyển đơn đặt hàng Freight trung bình của các đơn đặt hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng đơn nhất 
SELECT  AVG(Freight)/MAX(Freight) as [FreightRatio]
FROM dbo.Orders;

-- Bài tập 1: hãy liệt kê danh sách các sản phẩm , với giá (UnitPrice) của từng sản phẩm sẽ được giảm đi 10%
-- Cách 1: dùng phép Nhân +Phép chia
-- Cách 2: Chỉ được dùng phép nhân

-- Giải cách 1:
SELECT *, (UnitPrice -(UnitPrice*10)/100) as "newPrice"
FROM dbo.Products;

SELECT *, (UnitPrice *0.9) as "new Price"
FROM dbo.Products;



