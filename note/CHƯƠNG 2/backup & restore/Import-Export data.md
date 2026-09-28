# 28 - 09 - 2026
# **IMPORT/EXPORT**

## 1. `Import`
-  đưa data vào SQL server

```text
CSV
 ↓
Import
 ↓
SQL Server
 ↓
Table
```

## 2. `Export`
- Export = lấy dữ liệu ra khỏi SQL Server.
```text
SQL Server
    ↓
 Export
    ↓
CSV / Excel / Database khác
```

## 3 . Import and Export Wizard

Trong SSMS:

```
Database
   ↓
Right Click
   ↓
Tasks
   ↓
Import Data...
```

hoặc:

```
Tasks
   ↓
Export Data...
```

Wizard thường sẽ cho chọn:

```
1. Data Source
      ↓
2. Destination
      ↓
3. Table / Query
      ↓
4. Execute
```