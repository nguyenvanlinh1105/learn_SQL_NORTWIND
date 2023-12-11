-- Toán tử Between : Chọn dữ liệu trong một khoảng nhất định;
/*
	SELECT column1, column2...
	FROM dbo.tabel_name
	WHERE columnN between value1 AND value2;


	==>Toán tử between là toán tử chọn các giá trị trong một phạm vi nhất định. Các giá trị có thể là số, văn bản hoặc ngày hoặc tháng,
	Toán tử BETWEEN bao gồm: giá trị bắt đầu và kết thúc 
	*/


	-- Ví dụ số 1: Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la 
	SELECT * 