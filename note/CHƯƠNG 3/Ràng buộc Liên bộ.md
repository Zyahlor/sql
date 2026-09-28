# Ràng buộc Liên bộ

**Ràng buộc liên bộ** quy định mối quan hệ giữa các dòng trong cùng 1 bảng (đảm bảo các dòng không bị trùng lặp dữ liệu quan trọng).

---

## 1. Cài đặt `PRIMARY KEY` (Khóa chính)
Khóa chính dùng để định danh duy nhất mỗi dòng trong bảng.

- **Khi tạo bảng:**
  ```sql
  CREATE TABLE SinhVien (
      MaSV VARCHAR(10),
      HoTen NVARCHAR(50),
      CONSTRAINT PK_SinhVien PRIMARY KEY (MaSV)
  );
  ```
- **Thêm vào bảng đã có:**
  ```sql
  ALTER TABLE SinhVien
  ADD CONSTRAINT PK_SinhVien PRIMARY KEY (MaSV);
  ```

---

## 2. Cài đặt `UNIQUE`
Đảm bảo giá trị của thuộc tính là duy nhất trong toàn bảng.

- **Khi tạo bảng:**
  ```sql
  CREATE TABLE SinhVien (
      MaSV VARCHAR(10),
      HoTen NVARCHAR(50),
      CONSTRAINT UQ_SinhVien_MaSV UNIQUE (MaSV)
  );
  ```
- **Thêm vào bảng đã có:**
  ```sql
  ALTER TABLE SinhVien
  ADD CONSTRAINT UQ_SinhVien_MaSV UNIQUE (MaSV);
  ```

---

## 3. Phân biệt `UNIQUE` và `PRIMARY KEY`

- `PRIMARY KEY`: 
  - Đảm bảo **Không trùng** và **Không NULL**.
  - Mỗi bảng chỉ có **1 Khóa chính**.
- `UNIQUE`: 
  - Đảm bảo **Không trùng**, nhưng **vẫn chấp nhận giá trị `NULL`** (nếu cột không được khai báo `NOT NULL`).
  - Một bảng có thể có **nhiều `UNIQUE`**.

> ⚠️ **Lưu ý:** `UNIQUE` không đồng nghĩa với `NOT NULL`. Nếu muốn một cột vừa duy nhất vừa bắt buộc nhập, phải dùng kết hợp: `UNIQUE NOT NULL`.

```sql
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,        -- Vừa không trùng, vừa không NULL
    CCCD VARCHAR(20) UNIQUE NOT NULL,    -- Duy nhất và bắt buộc phải nhập
    Email VARCHAR(100) UNIQUE            -- Duy nhất nhưng cho phép để NULL
);
```

---
* Liên quan: [[Xóa bỏ Ràng buộc toàn vẹn]]
* Quay lại: [[RÀNG BUỘC TOÀN VẸN]]
