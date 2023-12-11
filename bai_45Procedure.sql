---Tạo một stored proc để lấy thông tin về sản phẩm dựa trên tên sản phẩm dudocj cung cấp 

CREATE PROC Proc_GetProductName 
  @tenSP varchar(100)
AS
BEGIN 
	SELECT * FROM dbo.Products AS P WHERE P.ProductName = @tenSP
END;

EXEC Proc_GetProductName 'Chai'
select * from dbo.Products;


-- Tạo procedure tính tổng doanh số bán hàng của một danh viên dựa trên EmployeeId
ALTER PROC proc_TinhTongdoanhSo 
	@EmployeeID int
AS
BEGIN 
	SELECT O.EmployeeID, SUM(OD.UnitPrice *OD.Quantity) AS DoanhThu
	FROM dbo.Orders AS O 
	JOIN dbo.[Order Details] AS OD ON O.OrderID = OD.OrderID
	WHERE O.EmployeeID = @EmployeeID
	GROUP BY O.EmployeeID
END;

EXEC proc_TinhTongdoanhSo 1

-- Tao proceure để thêm mới một khách hàng vào bảng Customers.
CREATE PROC AddCustomer
	@CustomerId nchar(5),
	@CompanyName nvarchar(25),
	@Contactname nvarchar(30),
	@ContactTitle nvarchar(30)
AS
BEGIN 
	INSERT INTO dbo.Customers(CustomerID,CompanyName,ContactName,ContactTitle)
	VALUES 
		(@CustomerId,@CompanyName,@Contactname,@ContactTitle)
END;

-- Tao mot proc de cap nhật giá của tất cả các sản phẩm thuộc một sản phẩm cụ thể .

CREATE PROC UpdatePrice 
	@ProductID Int,
	@PriceIncrease Decimal(10,2)
AS
BEGIN 
	UPDATE dbo.Products 
	SET UnitPrice = UnitPrice -UnitPrice*@PriceIncrease
	WHERE ProductID=@ProductID
END;

EXEC UpdatePrice @ProductID=2,@PriceIncrease= 0.1
select *FROM dbo.Products



--- Bài tập về nhà 
-- 1. Tạo  PROC để truy xuất danh sách các đơn đặt hàng cho một khách hàng dựa trên tên kahchs hàng 
-- Tham số đầu vào  là tên khách hàng và Proc sẽ trả về danh sách cac đơn đặt hàng liên quan 
CREATE PROC proc_GetDSOder
	@CustomerName nvarchar(200)
AS
BEGIN 
	SELECT *
	FROM dbo.Customers AS C 
	JOIN dbo.Orders AS O ON C.CustomerID = O.CustomerID
	JOIN dbo.[Order Details] AS OD ON OD.OrderID = O.OrderID
	WHERE C.CompanyName = @CustomerName
END;
EXEC proc_GetDSOder @CustomerName = 'Vins et alcools Chevalier'

-- 2. Tạo một proc 