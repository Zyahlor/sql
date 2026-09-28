 # 28 - 09 - 2026
 ## **Attach và Detach**
## 1. `Attach` là gì?
- gắn các file database vào sql server để nhận database đó
- các file thường gặp: `.mdf` , `.ndf`, `.ldf`

``` sql
-- 1. tạo database cần attach
CREATE DATABASE [NAME_DATABASE] 
ON 
( -- 2. add PATH file primary data file
 FILENAME = 'PATH/TEN_FILE.MDF'
),
(
 FILENAME = 'PATH/TEN_FILE.LDF' 
 )
 FOR ATTACH;

```

```text
Quanlysinhvien.mdf + Quanlysinhvien.ldf
     ↓
   ATTACH
     ↓
SQL Server nhận database
     ↓
Quanlysinhvien
```

## 2. `DETACH` là gì?
- tháo database ra khỏi sql server nhưng ko xóa các file `.mdf` , `.ndf`, `.ldf`

``` sql
-- 1. USE MASTER - DATABASE DEFAULT CUA SQL
USE MASTER

-- CHINH SUA DATABASE = ALTER
ALTER DATABASE [NAME_DATABASE] SET OFFLINE;

-- cách 2 - dùng T-SQL
USE MASTER;
EXEC sp_detach_db '[NAME_DATABASE]'  

```

```text
SQL Server
    │
    │ DETACH
    ↓
Database không còn được SQL Server quản lý
    │
    ├── QuanLySinhVien.mdf
    └── QuanLySinhVien_log.ldf
```


| |Attach|Detach|
|---|---|---|
|Ý nghĩa|Gắn DB vào SQL Server|Tháo DB khỏi SQL Server|
|File `.mdf/.ldf`|Đưa vào sử dụng|Vẫn giữ lại|
|Database xuất hiện trong SSMS|✅|❌|
|Có phải Backup không?|❌|❌|
> **Attach = có file DB → gắn vào SQL Server.**  
**Detach = tháo DB khỏi SQL Server nhưng giữ file DB.**

```text
BACKUP
Database
   ↓
.bak
   ↓
RESTORE
Database


ATTACH
.mdf + .ldf
   ↓
Database


DETACH
Database
   ↓
.mdf + .ldf
```