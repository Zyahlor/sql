# Ràng buộc Tham chiếu

**Ràng buộc tham chiếu** quy định mối quan hệ giữa các bảng. Dữ liệu cột khóa ngoại ở bảng con phải tồn tại ở bảng cha.

---

## Cài đặt `FOREIGN KEY`

### 1. Khi tạo bảng (Bảng cha tạo trước, bảng con tạo sau)
```sql
-- Bảng cha (Lop)
CREATE TABLE Lop (
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop NVARCHAR(50)
);

-- Bảng con (SinhVien) chứa Foreign Key
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(50),
    MaLop VARCHAR(10),

    CONSTRAINT FK_SinhVien_Lop
    FOREIGN KEY (MaLop)
    REFERENCES Lop(MaLop)
);
```

### 2. Thêm vào bảng đã có
```sql
ALTER TABLE SinhVien
ADD CONSTRAINT FK_SinhVien_Lop
FOREIGN KEY (MaLop)
REFERENCES Lop(MaLop);
```

---
* Liên quan: [[Xóa bỏ Ràng buộc toàn vẹn]]
* Quay lại: [[RÀNG BUỘC TOÀN VẸN]]
