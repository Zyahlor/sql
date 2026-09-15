# 15 - 09 - 2026
# DATABASE
## 1. database là gì?
- là tập hợp data có tổ chức, lưu trưc và quản lý 1 cách có hệ thống, dễ dàng truy xuất, cập nhật, quản lý

**đặc điểm chính:**
- không phải là 1 file đữ liệu rời rạc
- được quản lý bởi 1 hệ quản trị cơ sở dữ liệu - dbms là phần mềm, database là dữ liệu nó quản lý
- nhiều user/application có thể truy cập cùng lúc mà ko xung đột
- data tồn tại lâu dài, ko mất khi tắt chương trình
## 2. cú pháp
1. tạo database
``` sql
CREATE DATABASE NAME_DATABASE
```

dành cho sql server khi tạo ra file lưu trữ vật lý:

``` sql
CREATE DATABASE ten_database
ON PRIMARY
( -- lưu ý: main datafile chính là file lưu data có đuôi là .mdf, từ file thứ 2 trở đi sẽ có tên là .ndf
    NAME = name_file,
    FILENAME = 'path',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON
( -- lưu ý: log file có đuôi .ldf
    NAME = name_file,
    FILENAME = 'path',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
```
- giải thích:

| Phần | Ý nghĩa|
| --- | --- |
| `ON PRIMARY`| Khai báo file dữ liệu chính (.mdf)|
| `NAMe`| tên logic của file (dùng local)|
| `FILENAME`|  path -  đường dẫn vật lý trên đĩa|
| `SIZE`| kích thước khởi tạo |
| `MAXSIZE`| kích thước tối đa đc cho phép tăng tới|
| `FILEGROWTH`| mỗi lần thao tác tăng thêm dung lượng |
| `LOG ON`| khai báo file log giao dịch -  ghi lại mọi thay dổi để phục hồi |

- **lưu ý:** ko có `LOG ON` SQL Server tự tạo file log mặc định, nhưng khó kiểm soát dung lượng và vị trí 

2. chỉnh sửa CSDL `ALTER`
- đổi tên:
``` sql
ALTER DATABASE NAME_DATABASE MODIFY NAME = NEW_NAME_DATABASE
```

- thêm file dữ liệu MAIN DATAFILE (.NDF)
``` sql
ALTER DATABASE NAME_DATABASE ADD FILE (
    NAME = NAME_FILE,
    FILENAME = 'PATH',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH =  5MB
);
```

- thêm file log (.LDF):
``` sql
ALTER DATABASE NAME_DATABASE ADD LOG FILE (
    NAME = NAME_FILE,
    FILENAME = 'PATH',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH =  5MB
);
```

- đổi chế độ truy cập:
``` sql
ALTER DATABASE QuanLySinhVien SET SINGLE_USER;  
 -- chỉ 1 user truy cập (dùng khi bảo trì)
ALTER DATABASE QuanLySinhVien SET MULTI_USER;    
-- trả về bình thường
```
-  xóa database: vĩnh viễn, mất hết data, ko rollback lại đc
``` sql
DROP DATABASE NAME_DATABASE
```
- sửa thông tin file đã có rồi:
``` sql
ALTER DATABASE NAME_DATABASE MODIFY FILE (
    NAME = NAME_FILE,
    SIZE = ?,....
    -- thích sửa gì thì sửa
    -- lưu ý: dung lượng chỉ tăng chứ ko giảm
)
```
- xóa file khỏi database
``` sql
ALTER DATABASE NAME_DATABASE REMOVE FILE NAME_FILE
-- FILE XÓA PHẢI RỖNG,KHÔNG XÓA ĐƯỢC FILE CÒN CHỨA DATA
```
- đổi tên file logic
``` sql
ALTER DATABASE NAME_DATABASE MODIFY FILE(
    NAME = OLD_NAME,
    NEWNAME =  NEW_NAME
)
```
- thu nhỏ file - giải phóng dung lượng thừa
``` sql
DBCC SHRINKFILE (NAME_file,SO_DUNG_LUONG_CAN_DUA_VE)
```
- xem danh sách hiện có trong DB
``` sql
SELECT name FROM sys.databases WHERE name = 'NAME_DATABASE';
```
3. Các trạng thái của Database:

ONLINE	Đang hoạt động bình thường, truy cập được

OFFLINE	Tắt tạm, không truy cập (dùng khi maintenance)

RESTORING	Đang trong quá trình phục hồi từ backup

RECOVERING	Đang khôi phục sau crash/lỗi

SUSPECT	Nghi ngờ lỗi, HQT ko chắc dữ liệu còn nguyên vẹn

EMERGENCY	Chế độ khẩn — chỉ admin (sysadmin) truy cập được để sửa lỗi

4. Chế độ truy cập (Access mode)

MULTI_USER	Mặc định — nhiều user truy cập đồng thời

SINGLE_USER	Chỉ 1 kết nối tại 1 thời điểm (thường để bảo 
trì)

RESTRICTED_USER	Chỉ role đặc biệt (db_owner, dbcreator, sysadmin) truy cập được

5. Recovery Model — quyết định mức độ log giao dịch

SIMPLE:	Không giữ log giao dịch lâu, phục hồi tối thiểu	DB nhỏ, ko cần point-in-time recovery

FULL: Giữ log đầy đủ, phục hồi tới bất kỳ thời điểm nào	DB quan trọng, cần backup chi tiết

BULK_LOGGED: Trung gian — log tối thiểu cho các thao tác bulk (insert lớn)	Import dữ liệu khối lượng lớn
``` sql
ALTER DATABASE QuanLySinhVien SET RECOVERY FULL;
```