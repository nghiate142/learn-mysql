USE dbqlct;
# Hiển thị toàn bộ nội dung của bảng Architect
SELECT * FROM architect;

# Hiển thị danh sách gồm họ tên và giới tính của kiến trúc sư
SELECT name,sex FROM architect;

# Hiển thị những năm sinh có thể có của các kiến trúc sư
SELECT birthday FROM architect;

# Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh tăng dần)
SELECT name,birthday FROM architect ORDER BY birthday;

# Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh giảm dần)
SELECT name,birthday FROM architect ORDER BY birthday DESC;

# Hiển thị danh sách các công trình có chi phí từ thấp đến cao. Nếu 2 công trình có chi phí bằng nhau sắp xếp tên thành phố theo bảng chữ cái building
SELECT * FROM building;
SELECT name,cost FROM building ORDER BY cost, name;

# Hiển thị tất cả thông tin của kiến trúc sư &quot;le thanh tung&quot;
SELECT * FROM architect WHERE name="le thanh tung";

# Hiển thị tên, năm sinh các công nhân có chuyên môn hàn hoặc điện
SELECT * FROM worker;
SELECT name, birthday FROM worker WHERE skill IN ("han", "dien");

# Hiển thị tên các công nhân có chuyên môn hàn hoặc điện và năm sinh lớn hơn 1948
SELECT name, birthday, skill FROM worker WHERE skill IN ("han", "dien") && birthday>1948;

# Hiển thị những công nhân bắt đầu vào nghề khi dưới 20 (birthday + 20 &gt; year)
SELECT * FROM worker WHERE year< (birthday + 20);

# Hiển thị những công nhân có năm sinh 1945, 1940, 1948 (Bằng 2 cách)
SELECT * FROM worker WHERE birthday IN  (1945, 1940, 1948); 
SELECT * FROM worker WHERE birthday=1945 OR birthday=1940 OR birthday=1948;

# Tìm những công trình có chi phí đầu tư từ 200 đến 500 triệu đồng (Bằng 2 cách)
SELECT * FROM building WHERE cost BETWEEN 200 AND 500; 
SELECT * FROM building WHERE cost>=200 AND cost<=500;

# Tìm kiếm những kiến trúc sư có họ là nguyen: % chuỗi
SELECT name FROM architect WHERE name LIKE"%nguyen%";

# Tìm kiếm những kiến trúc sư có tên đệm là anh
SELECT name FROM architect WHERE name LIKE"% anh %";

# Tìm kiếm những kiến trúc sư có tên bắt đầu th và có 3 ký tự
SELECT name FROM architect WHERE name LIKE"% th_";

# Tìm chủ thầu không có phone
SELECT * FROM contractor WHERE phone='';

# Thống kê tổng số kiến trúc sư
SELECT COUNT(name)AS "tổng số kiến trúc sư"  FROM architect;

# Thống kê tổng số kiến trúc sư nam
SELECT COUNT(name)AS "tổng số kiến trúc sư nam" FROM architect WHERE sex=1;

# Tìm ngày tham gia công trình nhiều nhất của công nhân
SELECT MAX(total) FROM work;

# Tìm ngày tham gia công trình ít nhất của công nhân
SELECT MIN(total) FROM work;

# Tìm tổng số ngày tham gia công trình của tất cả công nhân
SELECT SUM(total) FROM work;

# Tìm tổng chi phí phải trả cho việc thiết kế công trình của kiến trúc sư có Mã số 1
SELECT architect.id=1, architect.name, design.architect_id=1, SUM(cost) FROM architect, design, building;

# Tìm trung bình số ngày tham gia công trình của công nhân
SELECT AVG(total) FROM work;

# Hiển thị thông tin kiến trúc sư: họ tên, tuổi
SELECT name, YEAR(CURRENT_TIMESTAMP) - birthday AS "age" FROM architect;

# Tính thù lao của kiến trúc sư: Thù lao = benefit * 1000


