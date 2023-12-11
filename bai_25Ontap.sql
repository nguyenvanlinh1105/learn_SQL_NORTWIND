-- OnTapbai25// chi lấy ra orderID để khỏi tránh trung lặp 
-- Cau 1: Từ bảng Order Details hãy liệt kê các đơn hàng ó Unit Price nằm trong phạm vi từ 100 đến 200
SELECT	od.OrderID
FROM dbo.[Order Details] as od
WHERE od.UnitPrice between 100 and 200 -- 22 dòng

-- từ bảng Orders hãy đưa ra các đơn hàng có Quantity từ 10 đến 20 
--UNION
SELECT od.OrderID
FROM dbo.[Order Details] as od 
WHERE od.Quantity in (10, 20) -- 433 dòng

-- Câu 3: từ bảng ordeer Detail hãy liệt kê ra nhũng đơn hàng có Unitprice từ 100 đến 200 và có số lượng là 10 hoặc 20 
SELECT od.OrderID FROM dbo.[Order Details] as od 
WHERE od.UnitPrice between 100 and 200 
	and Quantity in (10, 20)-- 7 dong

	 -- Câu 4 sửa điều kiên lại hoặc  có 448 dòng ở câu 1 và câu 2 chính là kết quả của câu 4 mặc dù là 455 dòng nhưng ở giữa hai bảng có phần giao nhau nên sql đã tự động thực hiện trừ đi những phần giao nhau đó 
	 --A U B = A +B - A^B toán rời rạc ... 
SELECT od.OrderID FROM dbo.[Order Details] as od 
WHERE od.UnitPrice between 100 and 200 
	or Quantity in (10, 20)
-- 448 dong

-- Câu 5 có sử dụng distinct cho 4  thì trong một o thì có những cái thỏa mãn cả hai cái thì mình loại, có những đơn chỉ thỏa mãn một trong 2 nhưng mà bị trùng orderID thì mình phải thực hiện DISTINCT nod đi '
-- thì còn lại số đơn hàng thỏa mãn điều kiện 1 hoặc điều kiện 2; 
SELECT DISTINCT od.OrderID FROM dbo.[Order Details] as od 
WHERE od.UnitPrice between 100 and 200 
	or Quantity in (10, 20)

-- 360 dong
