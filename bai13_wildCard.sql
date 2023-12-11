/*
WILD Card: kí tự đại diện 
%:đại diện cho  không, một hoặc nhiều kí tự 
_: đại diện cho một kí tự và bắt buộc chổ đó phải có một kí tự 
[]:đại diện cho một trong những kí tự xuất hiện ở trong ngoặc vuông này  ví dụ h[oa]t nó sẽ kiếm hot và hat 
^: tìm ra các dữ liệu tránh các (nhưng mà không )chứa kí tự truyền vào  ví dụ h[^oa]t nó sẽ tìm thấy hit, và không tìm thấy hot hay là hat
-: đại diện cho bất kì một khoảng kí tự  , ví dụ: c[a-b]t nó sẽ tìm từ cat đến cbt;

-- Ví dụ: Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đâu bằng chữ 'A'
*/
use NORTHWND;
SELECT * 
FROM dbo.Customers
WHERE ContactName LIKE 'A%';

 -- Ví dụ 2: Hãy lọc ra tất cả khách hàng có tên liên hệ bắt đâu bằng chữ 'H' và có chữ thứ 2 là bất kì kí tự nào 
 SELECT *
 FROM dbo.Customers
 WHERE ContactName LIKE 'H_%';

 -- Ví dụ 3: Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố bắt đầu là 'L' chữ cái thứ hai là u hoặc là o
 SELECT *
 FROM dbo.Orders
 WHERE ShipCity LIKE 'L[u,o]%';

 -- Ví dụ 4: Hãy lọc ra tất cả các đơn hàng được gửi đênt thành phố có chữ cái bắt đầu là L và chữ cái thứ 2 không phải là u và o 
 SELECT * 
 FROM dbo.Orders
 WHERE ShipCity LIKE 'L[^u,o]%';

 -- Ví dụ 5: Hãy lọc ra tất cả các đơn hàng được gửi đênt thành phố có chữ cái bắt đầu là L và chữ cái thứ 2 là các kí tự từ a đến e
 SELECT OrderID, ShipCity
 FROM dbo.Orders
 WHERE ShipCity LIKE 'L[a-e]%';
 -- Bài tập về nhà :Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và không chứa kí tự b
 SELECT * 
 FROM dbo.Suppliers
 WHERE CompanyName LIKE 'A%[^b]%';