# Ràng buộc Miền giá trị

**Ràng buộc miền giá trị** quy định giá trị của 1 thuộc tính nằm trong phạm vi nào (Ví dụ: `Tuổi >= 18`, `Điểm từ 0 đến 10`, `Giới tính ('Nam', 'Nữ')`).

---

## Các cách cài đặt

### 1. `CHECK` (Kiểm tra điều kiện)
- **Khi tạo bảng:**
  ```sql
  CREATE TABLE SinhVien (
      MaSV VARCHAR(10),
      HoTen NVARCHAR(50),
      Tuoi INT CHECK (Tuoi >= 18),
      Diem FLOAT CHECK (Diem >= 0 AND Diem <= 10),
      GioiTinh VARCHAR(10) CHECK (GioiTinh IN ('Nam', 'Nu'))
  );
  ```
- **Thêm vào bảng đã có:**
  ```sql
  ALTER TABLE SinhVien
  ADD CONSTRAINT CK_SinhVien_Tuoi CHECK (Tuoi >= 18);
  ```

### 2. `DEFAULT` (Giá trị mặc định)
- **Khi tạo bảng:**
  ```sql
  CREATE TABLE SinhVien (
      MaSV VARCHAR(10),
      TrangThai NVARCHAR(20) DEFAULT N'Đang học'
  );
  ```
- **Thêm vào bảng đã có:**
  ```sql
  ALTER TABLE SinhVien
  ADD CONSTRAINT DF_TrangThai DEFAULT N'Đang học' FOR TrangThai;
  ```
> ⚠️ **Lưu ý về DEFAULT:**  
> `DEFAULT` chỉ có hiệu lực khi câu lệnh `INSERT` **không đề cập đến cột** đó.  
> - `INSERT INTO SinhVien (MaSV) VALUES ('SV01');` → `TrangThai` tự nhận `N'Đang học'`.  
> - `INSERT INTO SinhVien (MaSV, TrangThai) VALUES ('SV01', NULL);` → `TrangThai` nhận `NULL` (chứ không tự biến thành `Đang học`).

### 3. `NOT NULL` (Không cho phép trống)
- Không dùng `ADD CONSTRAINT`, khai báo trực tiếp ở cột:
  ```sql
  -- Khi tạo bảng
  CREATE TABLE SinhVien ( MaSV VARCHAR(10) NOT NULL );

  -- Thêm vào bảng đã có
  ALTER TABLE SinhVien ALTER COLUMN HoTen NVARCHAR(50) NOT NULL;
  ```
> ⚠️ **Cảnh báo khi sửa bảng:**  
> Khi chuyển một cột từ cho phép NULL sang `NOT NULL`, dữ liệu hiện tại của cột đó **không được chứa bất kỳ giá trị `NULL` nào**, nếu không lệnh `ALTER` sẽ báo lỗi.

### 4. `RULE` (Tạo quy tắc riêng & bind)
```sql
-- Bước 1: Tạo rule
CREATE RULE RL_Tuoi AS @Tuoi >= 18;

-- Bước 2: Bind vào cột
EXEC sp_bindrule 'RL_Tuoi', 'SinhVien.Tuoi';

-- Khi muốn gỡ bỏ RULE:
-- Bước 3: Unbind khỏi cột trước
EXEC sp_unbindrule 'SinhVien.Tuoi';

-- Bước 4: Sau đó mới xóa RULE khỏi database
DROP RULE RL_Tuoi;
```

---
* Liên quan: [[Xóa bỏ Ràng buộc toàn vẹn]]
* Quay lại: [[RÀNG BUỘC TOÀN VẸN]]
