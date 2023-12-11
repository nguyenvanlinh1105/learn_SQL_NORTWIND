-- TRIGGER : là môt đoạn thủ tục  SQl được thực thi tự động khi một sự kiện cụ thể xảy ra trên một bảng hoạc dạng view 
/*
	DML Triggers 
	DDL Triggers
	Logon Triggers

	-- > Các sự kiện có thể kích hoạt trigger bao gồm  
	Insert 
	Update 
	Delete 
	DDL (Data Definition Language)
	DML (Data Manipulation Language) 
	-- > Trigerrs được chia thành 2 loại chính 
	Trigger Before : Thực thi trước khi sự kiện xảy ra
	Trigger After: Thực thi sau khi sự kiện xảy ra 


	-- cú pháp tạo trigger 
	CREATE TRIGGER Trigger_name
	ON table_name
	FOR{INSERT|UPDATE|DELETE}
	AS
	BEGIN
		--- Code thực thi khi sự kiện xảy ra 
	END;
*/


-- 1. Trigger khi insert sẽ chuyển ProductName về viết hoa toàn bộ 
CREATE TRIGGER MakeProductNameUppercase 
ON dbo.Products
AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON ;
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i-- Đại diện cho dòng dữ liệu bạn vừa thêm vào.
	WHERE Products.ProductID = i.ProductID;
END;

INSERT INTO dbo.Products(ProductName,SupplierID,CategoryID)
VALUES ('testname1',1,1)

-- check
select * from dbo.Products

----2. Chặn không cho phép cập nhật số lượng nhỏ hơn 0;

ALTER TRIGGER PreventNegativeDiscount
ON Products 
FOR UPDATE 
AS
BEGIN 
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM inserted WHERE Discontinued!=0 and Discontinued !=1)
	BEGIN 
		ROLLBACK;
		RAISERROR('Discontinued khong the cap nhat be hon 0',16,1)
	END
	ELSE 
	BEGIN 
		 UPDATE dbo.Products
        SET Discontinued = i.Discontinued
        FROM inserted i
        WHERE Products.ProductID = i.ProductID
	END
END;

UPDATE dbo.Products
Set Discontinued =1
WHERE ProductID = 77;
select * from dbo.Products WHERE ProductID = 77;



-- 3. UPdate số lượng sản phẩm trong kho sau khi có người đặt hàng
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN 
	UPDATE dbo.Products 
	SET UnitsInStock = UnitsInStock - i.Quantity
	FROM inserted i
	WHERE i.ProductID = Products.ProductID
END;

INSERT INTO dbo.[Order Details]([OrderID],[ProductID],[UnitPrice],[Quantity])
VALUES ('10248',1,1,5)
select * from dbo.Products where ProductID =1
select * from [Order Details] where OrderID =1031;
select * from dbo.Orders



-- Bài tập về nhà : 
-- Bài 1: Bổ sung thêm cột LastModified và tạo một trigger để sau khi một sản phẩm được thêm hoặc cập nhật vào bảng "Product"
-- tự động cập nhật trường LastMdodified với ngày và giờ hiện tại 
ALTER TABLE dbo.Products 
ADD LastModified DateTime;
-- Cách 1: 
CREATE TRIGGER Trig_UpDateLastModifiedProducts
ON dbo.Products
AFTER UPDATE 
AS
BEGIN 
	UPDATE dbo.Products
	SET LastModified = getDate()
	FROM inserted i
	WHERE i.ProductID = Products.ProductID

END;

-- Cách 2: 
ALTER TRIGGER tg_UpdateLastModifiedWhenChangeProduct
ON dbo.Products
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE dbo.Products SET LastModified = GETDATE()
	FROM dbo.Products p
	INNER JOIN Inserted i 
	ON i.ProductID = p.ProductID
END

select * from dbo.Products
insert into dbo.Products ([ProductName],[SupplierID],[CategoryID])
Values ('test_124',1,1)