# 15 - 09 - 2026
# **TABLE**
## table là gì?
- đơn vị lưu trữ dữ liệu cơ bản trong csdl quan hệ, tổ chức theo dạng dòng (row/record) và cột (column/field)
- Mỗi cột có 1 kiểu cố định, mỗi dòng là 1 bản ghi dữ liệu.

``` text
┌─────────────────────────────────┐
│           SinhVien              │  ← Table
├──────┬──────────┬───────────────┤
│ MaSV │   Ten    │     Tuoi      │  ← Column (cột)
├──────┼──────────┼───────────────┤
│  1   │   BAO    │     19        │  ← Row (dòng/bản ghi)
│  2   │   AN     │     20        │
└──────┴──────────┴───────────────┘
```
- khái niệm liên quan:

Primary Key (PK): Cột (hoặc nhóm cột) xác định duy nhất 1 dòng, không trùng, không NULL

Foreign Key (FK): Cột tham chiếu đến Primary Key của 1 bảng khác → tạo quan hệ giữa 2 bảng

Constraint: Ràng buộc dữ liệu (NOT NULL, UNIQUE, CHECK, DEFAULT...)

Schema: "Khung" mô tả cấu trúc bảng: có cột gì, kiểu gì, ràng buộc gì

## CÚ PHÁP
1. TẠO BẢNG
``` sql
CREATE TABLE NAME_TABLE(
    TEN_COLUMN DATATYE
    ....
)
```
``` sql
CREATE TABLE SINHVIEN(
    MASV INT,
    HOSV NVARCHAR(20),
    TENSV NVARCHAR(20),
    NGAYSINH DATE
)
```

**các ràng buộc:**
| constraint | ý nghĩa|
|---|---|
| PRIMARY KEY | KHÓA CHÍNH |
| NOT NULL | CỘT BUỘC PHẢI CÓ GIÁ TRỊ|
| UNIQUE| GIÁ TRỊ KHÔNG ĐƯƠ TRÙNG (CHO PHÉP NULL)|
| CHECK(...) | RÀNG BUỘC ĐIỀU KIỆN LOGIC|
| DEFAULT| GIÁ TRỊ MẶC ĐỊNH NẾU KO NHẬP|
| FOREIGN KEY ... REFERENCES| LIÊN KẾT TỚI KHÓA CHÍNH BẢNG KHÁC |

- LƯU Ý: lỗi hay gặp là tạo bảng con trước khi có bảng cha nên ko thể làm khóa phụ đc

- chỉnh sửa cấu trúc bảng đã tạo:

thêm cột:
``` sql
ALTER TABLE NAME_TABLE ADD NAME_COLUMN DATATYPE
```
``` sql
ALTER TABLE SINHVIEN ADD DIACHI NVARCHAR(100)
```

SỬA DATATYPE COLUMN:
``` sql
ALTER TABLE NAME_TABLE ALTER COLUMN NAME_COLUMN DATATYPE
```
``` sql
ALTER TABLE SINHVIEN ALTER COLUMN TEN NVARCHAR(200)
```

xóa cột:
``` sql
ALTER TABLE NAME_TABLE DROP COLUMN NAME_COLUMN
```
``` sql
ALTER TABLE SINHVIEN DROP COLUMN DIACHI
```

thêm constraint sau khi bảng đã tồn tại:
``` sql
ALTER TABLE NAME_TABLE ADD CONSTRAINT (TEN_CONSTRAINT)_(NAME_COLUMN) (LOAI CONSTRAINT(RANG_BUOC))
```
``` sql
ALTER TABLE SINHVIEN ADD CONSTRAINT CK_TUOI CHECK (TUOI >=18);
```

xóa constraint:
``` sql
ALTER TABLE NAME_TABLE DROP CONSTRAINT (TEN_CONSTRAINT)_(NAME_COLUMN)
```
``` sql
ALTER TABLE SinhVien DROP CONSTRAINT CK_Tuoi;
```

đổi tên bảng:
``` sql
EXEC sp_rename 'old_name', 'new_name';
```
``` sql
EXEC sp_rename 'SinhVien', 'SinhVien_Moi';
```

xóa bảng:
``` sql
drop TABLE NAME_TABLE
```
``` sql
DROP TABLE SINHVIEN

-- xóa hết data, giữ nguyên lại cấu trúc bảng
TRUNCATE TABLE SINHVIEN
```
