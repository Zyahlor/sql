CREATE DATABASE TESTDB
ON PRIMARY(
    NAME =  TESTDB_DATA,
    FILENAME = 'E:\code\sql\LUUTRU\TESTDB_DATA.MDF',
    SIZE = 50MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = TESTDB_LOG,
    FILENAME = 'E:\code\sql\LUUTRU\TESTDB_LOG.LDF',
    SIZE = 50MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
)
SELECT name FROM sys.databases;

SELECT name FROM sys.databases WHERE name = 'TESTDB';

-- them file ndf
ALTER DATABASE TESTDB ADD FILE(
    NAME = TESTDB_DATA2,
    FILENAME = 'E:\code\sql\LUUTRU\TESTDB_DATA2.NDF',
    SIZE = 50MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
)

-- liet ke cac file
USE TESTDB;
GO
SELECT name, physical_name, type_desc FROM sys.database_files;

-- tạo bảng

CREATE TABLE STUDENT (
    ID INT,
    NAME NVARCHAR(100),
    AGE INT
)

SELECT * FROM STUDENT

SELECT name FROM sys.tables WHERE name = 'STUDENT'