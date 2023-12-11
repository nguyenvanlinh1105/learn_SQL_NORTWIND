-- Toán tử Between : Chọn dữ liệu trong một khoảng nhất định;
/*
	SELECT column1, column2...
	FROM dbo.tabel_name
	WHERE columnN between value1 AND value2;


	==>Toán tử between là toán tử chọn các giá trị trong một phạm vi nhất định. Các giá trị có thể là số, văn bản hoặc ngày hoặc tháng,
	Toán tử BETWEEN bao gồm: giá trị bắt đầu và kết thúc 
	*/


	-- Ví dụ số 1: Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la 
	use NORTHWND;
	SELECT COUNT(*)
	FROM dbo.Products
	WHERE UnitPrice BETWEEN 10 AND 20;

	SELECT *
	FROM dbo.Products
	WHERE UnitPrice >= 10 AND UnitPrice<=20;


	-- Ví dụ 2:  Lấy ra danh sách các đơn đặt hàng được đặt từ ngày 1996-07-01 đến ngày 1996-07-31;
	-- dbo.Orders -- Làm việc với ngày tháng năm 
	SELECT OrderID, OrderDate
	FROM dbo.Orders 
	WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

	-- Ví dụ 3:  Tính tổng số tiền vận chuyển Freight của các đơn đặt hàng được đặt trong khoản thời gian từ ngày 1996-07-01 đến ngày 1996-07-31
	SELECT SUM(Freight) as "SumFreight"
	FROM dbo.Orders
	WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

	-- bài tập 1: Lấy dánh sahcs các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngày 1/1/1997 đến ngày 31/12/1997 và được vận chuyển bằng tàu thủy 
	SELECT *
	FROM dbo.Orders
	WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31' AND ShipVia =3;
	-- Bài tập 2: Lấy danh sách cacc




