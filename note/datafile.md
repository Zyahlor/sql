# 14 - 09 - 2026
# Lộ trình học sql
# MỤC LỤC

**DANH MỤC HÌNH ẢNH**

## CHƯƠNG 1: TỔNG QUAN VỀ HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU

**Mục đích và yêu cầu**

**Nội dung**

- **1.1. Giới thiệu hệ quản trị cơ sở dữ liệu**
  - 1.1.1. Giới thiệu chung
  - 1.1.2. Một số khái niệm cơ bản
  - 1.1.3. Các tính năng và đặc điểm chính của HQT CSDL
  - 1.1.4. Hệ quản trị cơ sở dữ liệu Microsoft SQL Server 2008
  - 1.1.5. Các thành phần cơ bản của hệ quản trị cơ sở dữ liệu (HQT CSDL)
  - 1.1.6. Kiến trúc CSDL quan hệ (Relational Database Architecture)
  - 1.1.7. Các công cụ và trình tiện ích
- **1.2. Tạo và quản trị cơ sở dữ liệu**
  - 1.2.1. Cơ sở dữ liệu (CSDL) và các tập tin lưu trữ
  - 1.2.2. Quản trị database
- **1.3. Tạo và quản trị bảng**
  - 1.3.1. Kiểu dữ liệu
  - 1.3.2. Tạo bảng
  - 1.3.3. Quản trị bảng

**Bài tập Chương 1**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 2: SAO LƯU (BACKUP) - PHỤC HỒI (RESTORE) VÀ CHUYỂN ĐỔI DỮ LIỆU (IMPORT/EXPORT)

**Mục đích và yêu cầu**

**Nội dung**

- **2.1. Tổng quan về sao lưu và phục hồi dữ liệu**
  - 2.1.1. Mục đích của việc sao lưu và phục hồi dữ liệu
  - 2.1.2. Các cơ chế sao lưu dữ liệu
  - 2.1.3. Kịch bản sao lưu dữ liệu
- **2.2. Sao lưu dữ liệu (Backup)**
- **2.3. Phục hồi**
- **2.4. Attach và detach**
- **2.5. Import/Export data – Nhập hoặc trích xuất dữ liệu**
  - Import hoặc Export Wizard

**Bài tập Chương 2**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 3: THIẾT LẬP RÀNG BUỘC TOÀN VẸN (CONSTRAINTS)

**Mục đích và yêu cầu**

**Nội dung**

- **3.1. Giới thiệu**
  - 3.1.1. Định nghĩa ràng buộc toàn vẹn (RBTV)
  - 3.1.2. Các yếu tố của một RBTV
- **3.2. Phân loại các RBTV**
- **3.3. Cài đặt các ràng buộc toàn vẹn**
  - 3.3.1. Cài đặt RBTV miền giá trị
  - 3.3.2. Cài đặt RBTV liên bộ
  - 3.3.3. Ràng buộc tham chiếu – ràng buộc khóa ngoại (foreign key)
- **3.4. Xóa bỏ RBTV**
  - 3.4.1. Hủy bỏ các ràng buộc toàn vẹn CONSTRAINT
  - 3.4.2. Hủy bỏ các ràng buộc toàn vẹn RULE

**Bài tập Chương 3**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 4: QUẢN LÝ VÀ THAO TÁC DỮ LIỆU

**Mục đích và yêu cầu**

**Nội dung**

- **4.1. Truy vấn dữ liệu**
  - 4.1.1. Giới thiệu chung
  - 4.1.2. Tìm thông tin từ các cột của bảng – mệnh đề SELECT
  - 4.1.3. Chọn các dòng của bảng – mệnh đề WHERE
  - 4.1.4. Thứ tự thể hiện các bản ghi – mệnh đề ORDER BY
  - 4.1.5. Chọn các nhóm thỏa điều kiện – mệnh đề HAVING
- **4.2. Cập nhật dữ liệu**
  - 4.2.1. Lệnh INSERT
  - 4.2.2. Lệnh DELETE
  - 4.2.3. Lệnh UPDATE
- **4.3. Truy vấn lồng**
  - 4.3.1. Phân loại
  - 4.3.2. Cú pháp
  - 4.3.3. Ví dụ minh họa
- **4.4. Một số vấn đề cần lưu ý khi thực hiện câu truy vấn** *(Ghi chú: Trong tài liệu gốc in nhầm thành 4.5)*

**Bài tập Chương 4**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 5: LẬP TRÌNH T-SQL

**Mục đích và yêu cầu**

**Nội dung**

- **5.1. Tổng quan về ngôn ngữ T-SQL**
  - 5.1.1. Giới thiệu
  - 5.1.2. Các thành phần cơ bản trong cú pháp của ngôn ngữ T-SQL
- **5.2. Biến và cách sử dụng biến trong T-SQL**
  - 5.2.1. Khái niệm biến
  - 5.2.2. Phân loại biến theo phạm vi hoạt động
  - 5.2.3. Khai báo và gán giá trị cho biến
- **5.3. Các cấu trúc điều khiển**
  - 5.3.1. Cấu trúc IF ... ELSE
  - 5.3.2. Cấu trúc WHILE
  - 5.3.3. Cấu trúc CASE
  - 5.3.4. Một số lệnh điều khiển khác
- **5.4. Batch**
- **5.5. Transact-SQL Scripts**

**Bài tập Chương 5**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 6: THỦ TỤC - HÀM

**Mục đích và yêu cầu**

**Nội dung**

- **6.1. Thủ tục (Stored Procedure - SP)**
  - 6.1.1. Tổng quan về thủ tục
  - 6.1.2. Thao tác trên thủ tục
  - 6.1.3. Sử dụng tham số trong thủ tục
- **6.2. Hàm (Function)**
  - 6.2.1. Khái niệm
  - 6.2.2. Phân loại hàm
  - 6.2.3. Tạo lập và sử dụng hàm

**Bài tập Chương 6**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 7: RÀNG BUỘC TOÀN VẸN CAO CẤP VỚI TRIGGER

**Mục đích và yêu cầu**

**Nội dung**

- **7.1. Giới thiệu**
  - 7.1.1. Khái niệm
  - 7.1.2. Phân loại
- **7.2. Quản lý Trigger**
  - 7.2.1. Tạo Trigger
  - 7.2.2. Nguyên tắc hoạt động và các bước cài đặt Trigger
  - 7.2.3. Sửa, Xóa một Trigger
- **7.3. Một số ví dụ về Trigger**
- **7.4. Trigger lồng**

**Bài tập Chương 7**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 8: CON TRỎ (CURSOR), KHUNG NHÌN (VIEW), CHỈ MỤC (INDEX), GIAO DỊCH (TRANSACTION) VÀ KHÓA (LOCK)

**Mục đích và yêu cầu**

**Nội dung**

- **8.1. Con trỏ (Cursor)**
  - 8.1.1. Khái niệm về Cursor
  - 8.1.2. Định nghĩa Cursor
  - 8.1.3. Mở Cursor
  - 8.1.4. Đọc và xử lý dữ liệu trong Cursor
  - 8.1.5. Đóng Cursor
- **8.2. Khung nhìn (View)**
  - 8.2.1. Khái niệm
  - 8.2.2. Phân loại View
  - 8.2.3. Tạo View
  - 8.2.4. Quản lý View
- **8.3. Chỉ mục (Index)**
  - 8.3.1. Khái niệm
  - 8.3.2. Phân loại
  - 8.3.3. Tạo Index
- **8.4. Giao tác (Transaction) và Khóa (Lock)**
  - 8.4.1. Khái niệm về Transaction
  - 8.4.2. Các lệnh thường sử dụng trong Transaction
  - 8.4.3. Khóa (Lock)

**Bài tập Chương 8**
- A. Câu hỏi
- B. Bài tập

---

## CHƯƠNG 9: BẢO MẬT (SECURITY)

**Mục đích và yêu cầu**

**Nội dung**

- **9.1. Cơ chế bảo mật trong SQL Server**
  - 9.1.1. Hai lớp bảo mật trong SQL Server
  - 9.1.2. Các khái niệm về bảo mật trong SQL Server
- **9.2. Tạo các tài khoản đăng nhập**

**Bài tập Chương 9**
- A. Câu hỏi
- B. Bài tập