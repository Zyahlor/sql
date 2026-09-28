# Xóa bỏ Ràng buộc toàn vẹn

Khi không muốn duy trì kiểm tra toàn vẹn dữ liệu nữa, ta có thể xóa constraint hoặc rule.

---

## 1. Xóa Constraint (PRIMARY KEY, CHECK, DEFAULT, UNIQUE, FOREIGN KEY)

### Cú pháp chung
```sql
ALTER TABLE [TEN_BANG]
DROP CONSTRAINT [TEN_CONSTRAINT];
```

### Ví dụ cụ thể
```sql
-- Xóa PRIMARY KEY
ALTER TABLE SinhVien DROP CONSTRAINT PK_SinhVien;

-- Xóa CHECK
ALTER TABLE SinhVien DROP CONSTRAINT CK_SinhVien_Tuoi;

-- Xóa FOREIGN KEY
ALTER TABLE SinhVien DROP CONSTRAINT FK_SinhVien_Lop;

-- Xóa UNIQUE
ALTER TABLE SinhVien DROP CONSTRAINT UQ_SinhVien_MaSV;
```

---

## 2. Hủy bỏ `RULE`

Thực hiện theo 2 bước:
```sql
-- Bước 1: Gỡ RULE khỏi cột (Unbind)
EXEC sp_unbindrule 'SinhVien.Tuoi';

-- Bước 2: Xóa RULE khỏi DB
DROP RULE RL_Tuoi;
```

---
* Quay lại: [[RÀNG BUỘC TOÀN VẸN]]
