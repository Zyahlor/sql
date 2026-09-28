# 28 - 09 - 2026
# **RESTORE**
## 1. `RESTORE` là gì?
- là **khôi phục** data từ file backup
## 2. `RESTORE` FULL BACKUP
 - **Cú pháp:**
 ```sql
RESTORE DATABASE [NAME_DATABASE] FROM DISK = 'PATH/TEN_FILE.BAK'
 ```

``` text
QLSV_full.bak
      │
      │ RESTORE
      ↓
QuanLySinhVien
```
## 3. `RESTORE` DIFFERENTIAL BACKUP
- muốn restore diferential thì phải restore full trước

```text
QLSV_full.bak
       ↓
QLSV_diff.bak
```

``` sql
-- 1. NORECOVERY - RESTORE NHƯNG KHÔNG ĐƯA DATABASE VÀO ACTIVE STATUS
RESTORE DATABASE [NAME_DATABASE] FROM DISK = 'PATH/TEN_FILE.BAK' WITH NORECOVERY;

-- 2. RECOVERY - RESTORE XONG VÀ ACTIVE STATUS
RESTORE DATABASE [NAME_DATABASE] FROM DISK = 'PATH/TEN_FILE.BAK' WITH RECOVERY
```

- **lưu ý:**  dùng `NORECOVERY` khi vẫn còn phải backup nữa

```text
Full
 ↓
NORECOVERY
 ↓
Differential
 ↓
RECOVERY
 ↓
Database hoạt động
```

## 4.  NẾU DATABASE ĐÃ TỒN TẠI KHI RESTORE?
- sql có thể báo lỗi vì database đang tồn tại 
``` sql
RESOTRE DATABASE [NAME_DATABASE] FROM DISK = 'PATH/TEN_FILE.BAK' WITH REPLACE;
```

 - `WITH REPLACE` cho phép ghi đè database hiện tại bằng [[backup]] , cẩn thận vì dữ liệu hiện tại có thể bị thay thế!
## 5. tóm tắt lệnh

|Lệnh|Ý nghĩa|
|---|---|
|`RESTORE DATABASE`|Khôi phục database|
|`FROM DISK`|Lấy backup từ file|
|`NORECOVERY`|Chưa hoàn tất restore, còn restore tiếp|
|`RECOVERY`|Hoàn tất restore|
|`WITH REPLACE`|Ghi đè database hiện tại|


```text
Full → Differential

Restore Full:
WITH NORECOVERY

Restore Differential cuối cùng:
WITH RECOVERY
```
