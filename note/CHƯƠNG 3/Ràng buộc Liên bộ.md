# Ràng buộc Liên bộ

**Ràng buộc liên bộ** quy định mối quan hệ giữa các dòng trong cùng 1 bảng (đảm bảo các dòng không bị trùng lặp dữ liệu quan trọng).

---

## 1. Cài đặt `UNIQUE`
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

## 2. Phân biệt `UNIQUE` và `PRIMARY KEY`
- `PRIMARY KEY`: Định danh duy nhất dòng, **không trùng và không được `NULL`**. Mỗi bảng chỉ có **1 Khóa chính**.
- `UNIQUE`: Đảm bảo giá trị không trùng. Một bảng có thể có **nhiều `UNIQUE`**.

```sql
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY, -- Khóa chính
    CCCD VARCHAR(20) UNIQUE,      -- UNIQUE 1
    Email VARCHAR(100) UNIQUE     -- UNIQUE 2
);
```

---
* Liên quan: [[Xóa bỏ Ràng buộc toàn vẹn]]
* Quay lại: [[RÀNG BUỘC TOÀN VẸN]]
