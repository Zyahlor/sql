# 28 - 09 - 2026
# **BACKUP**
## 1. các loại BACKUP
| loại                   | ý nghĩa                                           |
| ---------------------- | ------------------------------------------------- |
| `FUll Backup`          | sao lưu toàn bộ database                          |
| `Diferential Backup`   | sao lưu những thay đổi kể từ full backup gấn nhất |
| Transaction Log Backup |  sao lưu các transaction trong log                |
``` text
minh họa backup

T2: full backup
T3: Differential
T4: Differential
T5: DIfferential
```
các differential đều dựa trên full backup của T2
còn log backup thì theo transaction log, dùng để khôi phục chi tiết hơn

``` text
01:00  -> full backup
02:00 -> Differential backup
03:00 -> Differential backup
04:00 -> Differential backup
05:00 -> Differential backup
```
- nếu database 04:30:
``` text
FUll backup
	|
	V
restore
	|
	V
Datanbase được khôi phục
```
- nếu có log backup
``` text
Full
 ↓
Differential
 ↓
Log 1
 ↓
Log 2
 ↓
Log 3
```
- có thể khôi phục theo chuỗi backup này
## 2. BACKUP

1. FULL BACKUP
> **cú pháp:**
``` text
BACKP DATABASE [NAME_DATABASE] TO DISK = 'PATH/ten_file.bak'
```
- ý nghĩa:
``` text
NAMEDATABASE
	| BACKUP DATABASE
	v
FILE_BACKUP.BAK
```
>**lưu ý:**file.bak là file backup, không phải database đẻ sql trực tiếp sử dụng

2. DIFFERENTIAL BACKUP
- backup dựa trên full backup gần nhất, backup bán phần
>**cú pháp:**
``` sql
BACKUP DATABASE [NAME_DATABASE] TO DISK = 'PATH/FILE_NAME.BAK'
WITH DIFFERENTIAL;
```
- ví dụ:
``` text
Full Backup
    │
    ├── thay đổi A
    ├── thay đổi B
    └── thay đổi C
          ↓
   Differential Backup
```

3. so sánh giũa full và differential

| |Full|Differential|
|---|---|---|
|Sao lưu|Toàn bộ DB|Thay đổi từ Full gần nhất|
|Dung lượng|Lớn hơn|Thường nhỏ hơn|
|Cần Full trước?|Không|**Có**|
|File thường dùng|`.bak`|`.bak`|
## 3. lệnh tóm tắt

``` sql
-- 1. FULL BACKUP
BACKUP DATABASE [NAME_DATABASE] TO DISK = 'PATH/NAME_FILE.BAK'

-- 2. DIFFERENTIAL BACKUP
BACKUP DATABASE [NAME_DATABASE] TO DISK = 'PATH/NAME_FILE.BAK'
WITH DIFFERENTIAL;
```