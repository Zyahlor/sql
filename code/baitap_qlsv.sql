-- tao database
CREATE DATABASE QLSV;
-- DUNG DATABASE
USE QLSV;

-- TAO BANG
CREATE TABLE KHOA (
MAKHOA INT PRIMARY KEY, -- INT = SO NGUYEN, PRIMARY KEY = KHOA CHINH
TENKHOA NVARCHAR(50), -- NVARCHAR = TEN UNICODE, CO DAU NHU TIENG VIET
);
CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE, -- DATE = NGAY
    GioiTinh NVARCHAR(10),
    MaKhoa INT,
    DiemTB DECIMAL(4,2), -- DECIMAL du lieu so thap phan chinh xac co dinh
                         -- cu phap: DECIMAL(P,S) => P = PRECISION = TONG SO CHU SO DUOC PHEP CO, S = SCALE = SO SAU PHAN THAP PHAN
                         -- VI DU: DECIMAL(4,2) => TONG CONG CO 4 SO, TRONG DO CHI CO 2 SO TRONG PHAN THAP PHAN
                         -- 12.99,40.23
    CONSTRAINT FK_SINHVIEN_KHOA FOREIGN KEY (MAKHOA) --  KHOA PHU
    REFERENCES KHOA(MAKHOA)
);

CREATE TABLE MONHOC (
MAMH INT PRIMARY KEY,
TENMH NVARCHAR(100),
SOTINCHI INT
);

CREATE TABLE KETQUA(
MASV INT,
MAMH INT,
DIEM DECIMAL(4,2),
PRIMARY KEY(MASV,MAMH),
CONSTRAINT FK_SINHVIEN_KETQUA
FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),

CONSTRAINT FK_MONHOC_KETQUA FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH)
);

--THEM DU LIEU
INSERT INTO KHOA VALUES (1,N'CÔNG NGHỆ THÔNG TIN'),(2,N'QUẢN TRỊ MẠNG'),(3,N'KINH TẾ');
-- INSERT INTO <TABLE> VALUES (VALUE 1,VALUE 2,...)
INSERT INTO SinhVien VALUES
(101, N'Nguyễn Văn An', '2005-03-15', N'Nam', 1, 8.2),
(102, N'Trần Thị Bình', '2005-07-20', N'Nữ', 1, 9.1),
(103, N'Lê Văn Cường', '2004-11-10', N'Nam', 2, 7.5),
(104, N'Phạm Thị Dung', '2005-01-25', N'Nữ', 2, 8.7),
(105, N'Hoàng Văn Em', '2004-09-18', N'Nam', 3, 6.8);

INSERT INTO MonHoc VALUES
(1, N'Cơ sở dữ liệu', 3),
(2, N'Lập trình C++', 4),
(3, N'Mạng máy tính', 3),
(4, N'Hệ điều hành', 3);

INSERT INTO KetQua VALUES
(101, 1, 8.5),
(101, 2, 7.5),
(101, 3, 9.0),
(102, 1, 9.5),
(102, 2, 9.0),
(102, 3, 8.5),
(103, 1, 6.5),
(103, 2, 7.0),
(103, 3, 8.0),
(104, 1, 9.0),
(104, 2, 8.5),
(104, 3, 9.5),
(105, 1, 6.0),
(105, 2, 6.5),
(105, 4, 7.0);
--  TRUY VAN
-- SELECT = BAT BUOC PHAI CO TRONG CAC CAU TRUY VAN
-- SELECT = LAY DU LIEU

SELECT * FROM SinhVien -- LAY TAT CA DU LIEU TRONG BANG SINHVIEN

SELECT MASV,HOTEN,DIEMTB FROM SinhVien -- CHI CAN LAY CAC DU LIEU CAN THIET TRONG BANG SINHVIEN

SELECT * FROM SinhVien WHERE DiemTB>=8 -- WHERE = DIEU KIEM

SELECT * FROM SinhVien WHERE MaKhoa =2

SELECT * FROM SinhVien JOIN KHOA ON KHOA.MAKHOA = SinhVien.MaKhoa WHERE SinhVien.MaKhoa =2

-- LOC DU LIEU
SELECT * FROM SinhVien WHERE HOTEN LIKE N'%VĂN%' 
-- LIKE =  dùng để so khớp chuỗi theo pattern
-- LIKE N'Văn%'       -- bắt đầu bằng "Văn"
-- LIKE N'%Văn'       -- kết thúc bằng "Văn"
-- LIKE N'%Văn%'      -- chứa "Văn"
-- LIKE N'_ăn'        -- 1 ký tự bất kỳ + "ăn"

SELECT * FROM SinhVien WHERE MaKhoa != 1
-- =       bằng
-- <>      khác
-- !=      khác
-- >       lớn hơn
-- <       nhỏ hơn
-- >=      lớn hơn hoặc bằng
-- <=      nhỏ hơn hoặc bằng

SELECT * FROM SinhVien WHERE MAKHOA LIKE 1 OR MAKHOA LIKE 2 -- SAO

SELECT * FROM SINHVIEN WHERE MAKHOA IN (1,2); -- <=> MAKHOA = 1 OR MAKHOA = 2

SELECT * FROM SinhVien WHERE NgaySinh = '2005-01-01'

SELECT * FROM SinhVien WHERE GioiTinh = N'NỮ' AND DiemTB >= 8

SELECT * FROM SINHVIEN WHERE HOTEN LIKE N'Nguyễn%'

-- SAP XEP VA TOP
