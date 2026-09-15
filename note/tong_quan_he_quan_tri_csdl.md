# 15/09 - Tổng quan HQT CSDL

## 1. Giới thiệu
- `SQL`: ngôn ngữ truy vấn `CSDL` quan hệ (IBM, System R, giữa 197x) → chuẩn hiện nay
- `Database`: tập tin lưu trữ dữ liệu, ko hiển thị trực tiếp cho `user` → cần `app` để truy xuất và trình bày dữ liệu dễ hiểu
- `CSDL quan hệ` = dữ liệu tổ chức theo `bảng` (dòng-cột), các `bảng` liên kết qua `khóa`.
- `SQL` = ngôn ngữ truy vấn/thao tác dữ liệu trên CSDL quan hệ.
- `XML` = ngôn ngữ đánh dấu để lưu/trao đổi dữ liệu dạng cây, dùng tag tự đặt.


| Nhóm | Ý nghĩa| Ví dụ lệnh |
|---   |---     | ---       |
| DDL | Định nghĩa cấu trúc | CREATE, ALTER, DROP |
| DML | Thao tác dữ liệu    | SELECT, INSERT, UPDATE, DELETE |
| DCL | Phân quyền          | GRANT, REVOKE |

**chú thích:**
- DDL = Data Definition Language
- DML = Data Manipulation Language
- DCL = Data Control Language
---

## 2. Các tính năng và đặc điểm chính của HQT csdl
- tính năng :

| # | tính năng |
|-- | --        |
| 1 | khả năng quản lý dữ liệu tồn tại lâu dài |
| 2 | truy nhập khối lượng data lớn hiệu quả |
| 3 | hỗ trợ ít nhất 1 mô hình data \ trừu tượng toán học|
| 4 | đảm bảo tính độc lập dữ liệu |
| 5 | hỗ trợ ngôn ngữ cao cấp |
| 6 | quản lý giao dịch |
| 7 | điều khiển truy nhập |
| 8 | phục hồi dữ liệu |

-  đặc điểm :
+ Trừu tượng hóa = ẩn độ phức tạp lưu trữ thật, chia 3 mức: Vật lý → Logic → View, để user chỉ cần tương tác ở mức đơn giản nhất phù hợp

+ Ngôn ngữ CSDL = DDL (cấu trúc) + DML (dữ liệu) + DCL (quyền) + TCL (giao dịch), SQL là ngôn ngữ khai báo (non-procedural)

+ Xử lý yêu cầu truy vấn (Query Processing) - quá trình HQT CSDL biến 1 câu truy vấn sql thành kết quả trả về gồm:
 
 Parsing & Translation: kiểm tra cú pháp, dịch truy vấn sql -> biểu diễn nội bộ

 OPtimization : tìm kế hoạch thực thi (query plan) tối ưu nhất trong nhiều cách thực thi có thể

 Evaluation: thực thi kế hoạch đó trên dữ liệu thật -> trả kết quả

+ quản trị giao dịch (Transaction Management): là 1 chuỗi các hành động (đọc/ghi) trên csdl được coi là 1 đơn vị công việc duy nhất, 1 thực hiện thành công - 2 không làm gì cả

+ quản trị lưu trữ dữ liệu (Storge Management): chịu trách nhiệm lưu data vật lý trên đĩa, cung cấp interface để các thành phần khác truy xuất , ko cần biết chi tiết lưu trữ thật bên dưới

## 3. kiến trúc CSDL quan hệ
|        | CSDL hệ thống                           | CSDL user  |
|--|--|--|
| ai tạo | HQT CSDL tự tạo sẵn                     | user/admin tự tạo để lưu data |
|mục đích| lưu metadata,thông tin về hệ thống csdl | lưu dữ liệu thực tế của ứng dụng |
|SQL SERVER | master,model,msdb,tempdb |DB do bạn tạo: qlsv,..|
| MYSQL| information_schema,mysql,..| DB bạn tạo |
| xóa được không?| không nên xóa, sửa trực tiếp vì hệ thống hoạt động phụ thuộc vào nó| tự do |