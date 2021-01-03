USE master
GO
IF (DB_ID('ASM3') IS NOT NULL)
DROP DATABASE ASM3
ELSE 
CREATE DATABASE ASM3
GO
CREATE TABLE Servicess
(
ServiceID INT IDENTITY  not null CONSTRAINT PK_ServiceID PRIMARY KEY,
ServiceName NVARCHAR(50) default N'trả trước',
Descriptions nvarchar(10)
)
go
CREATE TABLE CustomerTell
(
CustomerID varchar(10) not null primary key,
Tell int  not null UNIQUE,
ServiceID int  IDENTITY,
StartDate datetime,
Enddate datetime NULL,
CONSTRAINT FK_CustomerID foreign key (CustomerID) REFERENCES Customer(CustomerID),
CONSTRAINT FK_ServiceID foreign key (ServiceID) REFERENCES Servicess(ServiceID)
)
go
CREATE TABLE Customer
(
CustomerID varchar(10) NOT NULL PRIMARY KEY,
CustomerName NVARCHAR (50),
Adress NVARCHAR (50),
CMND VARCHAR(50) NOT NULL UNIQUE ,
)
go
INSERT INTO Servicess(ServiceName,Descriptions) VALUES ('KM 20%'),('KM50%'),('trả sau','KM 100%');
INSERT INTO Customer(CustomerID,CustomerName,Adress,CMND) VALUES('VT01',N'NGUYỄN THỊ NGUYỆT NGA',N'HÀ NỘI','12456789');
                                                          VALUES('VT02',N'VŨ VĂN DIỆU',N'HÀ NỘI','0302010100319');
GO
INSERT INTO CustomerTell(CustomerID,Tell,StartDate) VALUES ('VT01','0123456789','2020-12-18');
                                                    VALUES('VT02','0923088634','2019-12-18');
GO
--HIEN THI TOAN BO TONG TIN CAC KHACH HANG CUA CONG TY
SELECT *FROM Customer
--HIEN THI TOAN BO THONG TIN CUA CAC SO SONG TY
SELECT Tell FROM CustomerTell
--HIEN THI THONG TIN CUA KHACH HANG CO SO THUE BAO'0123456789'
SELECT *FROM Customer
WHERE CustomerID IN
(
SELECT CustomerID FROM CustomerTell
WHERE Tell LIKE '0123456789'
)
GO
--HIEN THI THONG TIN KHACH HANG CO SO CMND ''123456789'
SELECT *FROM Customer
WHERE LIKE '123456789'
GO
--HIEN THI THONG TIN KHACH HANG DANG KI 2020-18-12
SELECT *FROM CustomerTell
WHERE StartDate LIKE '2020-18-12'
GO
-- HIEN THI THONG TIN KHACH HANG O HA NOI
SELECT *FROM Customer
WHERE Adress LIKE N'HÀ NÔI'
GO
SELECT COUNT (CustomerID) from Customer
GO
SELECT COUNT (TELL) FROM CustomerTell
GO
SELECT COUNT (StartDate)
WHERE StartDate = 2020-18-12
FROM CustomerTell
go
SELECT *FROM Customer,CustomerTell,Servicess



