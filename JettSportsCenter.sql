USE master
GO
DROP DATABASE JettSportsCenter
GO
CREATE DATABASE JettSportsCenter
GO
USE JettSportsCenter
GO

--1

--2


--3
CREATE TABLE Staff (
    StaffID VARCHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
    StaffName VARCHAR(50) CHECK (LEN(StaffName) > 4) NOT NULL,
    StaffGender VARCHAR(10) CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female') NOT NULL,
    StaffSalary INT CHECK (StaffSalary >= 1000000) NOT NULL,
);

INSERT INTO Staff
VALUES 
('ST001', 'Dionp', 'Male', 1200000),
('ST002', 'Fricksevan', 'Male', 1400000),
('ST003', 'Joseph', 'Male', 1600000),
('ST004', 'Yongky', 'Male', 1800000),
('ST005', 'Patricia', 'Female', 1150000),
('ST006', 'Eliam', 'Female', 1350000),
('ST007', 'Leonard', 'Male', 1750000),
('ST008', 'Cheta', 'Male', 1685000),
('ST009', 'Michelle', 'Female', 1990000),
('ST010', 'Laureen', 'Female', 2150000),
('ST011', 'Priscilla', 'Female', 2350000),
('ST012', 'Sergio', 'Male', 1865000),
('ST013', 'Ralph', 'Male', 1550000),
('ST014', 'Joshua', 'Male', 1050000),
('ST015', 'Tyler', 'Male', 2250000);

CREATE TABLE Customer(
    CustomerID CHAR (5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
    CustomerName VARCHAR (255) NOT NULL CHECK (LEN(CustomerName) > 2),
    CustomerAge INT NOT NULL CHECK (CustomerAge > 6),
    CustomerPhoneNumber VARCHAR(10) NOT NULL CHECK (LEN(CustomerPhoneNumber) = 10)
);

INSERT INTO Customer
VALUES
('CU001', 'Dirk', '50', '0217662887'),
('CU002', 'Dukey', '24', '0243580719'),
('CU003', 'Alex', '20', '0216692360'),
('CU004', 'Cherice', '15', '0215252082'),
('CU005', 'Carlin', '18', '0274589979'),
('CU006', 'McCutcheon', '30', '0218300550'),
('CU007', 'Silvain', '34', '0224238119'),
('CU008', 'Javier', '27', '0217355182'),
('CU009', 'Wilbur', '10', '0216395106'),
('CU010', 'Sadie', '26', '0224214262'),
('CU011', 'Sofie', '35', '0248449934'),
('CU012', 'Amy', '41', '0218307577'),
('CU013', 'Gabriela', '22', '0274580863'),
('CU014', 'Westley', '39', '0217811834'),
('CU015', 'Hadleigh', '25', '0217233835');

--4
 CREATE TABLE Product (
    ProductID VARCHAR(5) PRIMARY KEY CHECK(ProductID LIKE 'PR[0-9][0-9][0-9]'),
    ProductName VARCHAR(255) CHECK(LEN(ProductName) >=4) NOT NULL,
    ProductPrice INT CHECK (ProductPrice >= 10000 AND ProductPrice <= 1000000) NOT NULL
)

INSERT INTO Product 
VALUES
('PR001', 'Basketball Ball', 100000),
('PR002', 'Soccer Ball', 95000),
('PR003', 'Badminton Racket Type I', 50000),
('PR004', 'Badminton Racket Type II', 100000),
('PR005', 'Badminton Racket Type III', 150000),
('PR006', 'Badminton Racket Type IV', 200000),
('PR007', 'Tennis Racket Type I', 100000),
('PR008', 'Tennis Racket Type II', 200000),
('PR009', 'Tennis Ball', 50000),
('PR010', 'Nike Soccer Boots', 200000),
('PR011', 'Adidas Soccer Boots', 210000),
('PR012', 'Soccer Jersey (Replica)', 140000),
('PR013', 'Soccer Jersey (Player Issue)', 240000),
('PR014', 'Sports Headband', 20000),
('PR015', 'Hand Air Pump', 45000)

CREATE TABLE SportsField (
    SportsFieldID VARCHAR(5) PRIMARY KEY CHECK(SportsFieldID LIKE 'SF[0-9][0-9][0-9]'),
    SportsFieldName VARCHAR(255) CHECK(SportsFieldName LIKE '% Field') NOT NULL,
    SportsFieldAddress VARCHAR(255) CHECK(SportsFieldAddress LIKE '% Street') NOT NULL,
    RentingFee INT CHECK (RentingFee >= 10000 AND RentingFee <= 100000) NOT NULL
)

INSERT INTO SportsField
VALUES
('SF001', 'Alpha Basketball Field', 'Alpha I Street', 25000),
('SF002', 'Beta Basketball Field', 'Beta I Street', 25000),
('SF003', 'Charlie Basketball Field', 'Charlie I Street', 35000),
('SF004', 'Delta Basketball Field', 'Delta I Street', 35000),
('SF005', 'Alpha Soccer Field', 'Alpha II Street', 30000),
('SF006', 'Beta Soccer Field', 'Beta II Street', 30000),
('SF007', 'Charlie Soccer Field', 'Charlie II Street', 45000),
('SF008', 'Delta Soccer Field', 'Delta II Street', 40000),
('SF009', 'Alpha Tennis Field', 'Alpha III Street', 20000),
('SF010', 'Beta Tennis Field', 'Beta III Street', 20000),
('SF011', 'Charlie Tennis Field', 'Charlie III Street', 23000),
('SF013', 'Alpha Badminton Field', 'Alpha IV Street', 15000),
('SF014', 'Beta Badminton Field', 'Beta IV Street', 15000),
('SF015', 'Charlie Badminton Field', 'Charlie IV Street', 18000) 

CREATE TABLE [ProductTransactionHeader] (
	ProductTransactionID VARCHAR(5) PRIMARY KEY CHECK (ProductTransactionID LIKE 'PT[0-9][0-9][0-9]'),
	ProductTransactionDate DATE CHECK(YEAR(ProductTransactionDate) = YEAR(GETDATE())) NOT NULL,
	StaffID VARCHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);
INSERT INTO ProductTransactionHeader (ProductTransactionID,ProductTransactionDate, StaffID, CustomerID) VALUES 
('PT001','2023-01-03', 'ST004', 'CU003'),
('PT002', '2023-01-04', 'ST001', 'CU005'),
('PT003', '2023-01-10', 'ST003', 'CU006'),
('PT004', '2023-01-25', 'ST015', 'CU010'),
('PT005', '2023-02-02', 'ST012', 'CU001'),
('PT006', '2023-02-10', 'ST005', 'CU002'),
('PT007', '2023-02-18', 'ST011', 'CU004'),
('PT008', '2023-02-21', 'ST013', 'CU007'),
('PT009', '2023-03-01', 'ST001', 'CU008'),
('PT010', '2023-03-07', 'ST003', 'CU012'),
('PT011', '2023-03-09', 'ST007', 'CU013'),
('PT012', '2023-03-15', 'ST008', 'CU009'),
('PT013', '2023-04-05', 'ST015', 'CU015'),
('PT014', '2023-05-06', 'ST012', 'CU011'),
('PT015', '2023-04-25', 'ST005', 'CU014');
SELECT* FROM ProductTransactionHeader
CREATE TABLE [ProductTransactionDetail] (
	ProductTransactionID VARCHAR(5) FOREIGN KEY REFERENCES ProductTransactionHeader(ProductTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductID VARCHAR(5) FOREIGN KEY REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductQuantity INT CHECK(ProductQuantity >= 1) NOT NULL,
	PRIMARY KEY(ProductTransactionID, ProductID)
);
INSERT INTO ProductTransactionDetail(ProductTransactionID,ProductID, ProductQuantity) VALUES 
('PT001','PR001', 5),
('PT001','PR011', 10),
('PT002','PR003', 2),
('PT003','PR011', 1),
('PT003','PR013', 5),
('PT003','PR002', 1),
('PT004','PR004', 1),
('PT004','PR014', 5),
('PT005','PR015', 3),
('PT006','PR010', 1),
('PT006','PR013', 2),
('PT007','PR012', 5),
('PT008','PR006', 1),
('PT008','PR002', 2),
('PT009','PR011', 1),
('PT010','PR005', 2),
('PT010','PR014',4),
('PT011','PR012', 5),
('PT012','PR013', 2),
('PT012','PR003',5),
('PT013','PR008', 2),
('PT013','PR009', 5),
('PT014','PR007', 1),
('PT015','PR014', 2),
('PT015','PR003', 5)

INSERT INTO ProductTransactionHeader (ProductTransactionID,ProductTransactionDate, StaffID, CustomerID) VALUES 
('PT018','2023-05-15', 'ST004', 'CU011'),
('PT019', '2023-06-02', 'ST003', 'CU015')

INSERT INTO ProductTransactionDetail(ProductTransactionID,ProductID, ProductQuantity) VALUES 
('PT018','PR011', 3),
('PT019','PR004', 5)


--4
SELECT DISTINCT
sf.SportsFieldID,
[Staff Salary Deviation] = CONCAT('Rp. ',x.[Staff Salary Deviation]) 
FROM SportsField sf
JOIN RentalTransactionDetail rtd ON rtd.SportsFieldID = sf.SportsFieldID
JOIN RentalTransactionHeader rth ON rtd.RentalTransactionID = rth.RentalTransactionID
JOIN Staff st ON st.StaffID = rth.StaffID,
(SELECT 
[Staff Salary Deviation] = (MAX(StaffSalary) - MIN(StaffSalary))
FROM Staff) as x
WHERE  [Staff Salary Deviation] >= 1000000 AND CONVERT(int,SUBSTRING(sf.SportsFieldID,CHARINDEX('SF',sf.SportsFieldID)+2,3)) % 2 != 0

--8
SELECT
[ProductTransactionID] = 'Product Transaction Id ' + SUBSTRING(ProductTransactionID,CHARINDEX('PT',ProductTransactionID,0)+2,3),
[Date] = CONVERT(VARCHAR,ProductTransactionDate,107),
pth.CustomerID,
[CustomerName] = UPPER(cs.CustomerName),
st.StaffID,
[StaffGender] = LEFT(StaffGender,1)
FROM ProductTransactionHeader pth
JOIN Customer cs ON pth.CustomerID = cs.CustomerID
JOIN Staff st ON st.StaffID = pth.StaffID,
(SELECT
[MAXAGE] = MAX(CustomerAge)
FROM Customer
) as x
,(SELECT
[AVGSALARY] = AVG(StaffSalary)
FROM Staff
) as y
WHERE MAXAGE <= CustomerAge AND StaffSalary> AVGSALARY

SELECT*FROM ProductTransactionHeader
SELECT
[CustomerName] = UPPER(CustomerName)
FROM Customer
SELECT
*
FROM Staff

INSERT INTO ProductTransactionHeader VALUES(
'PT020','2022-06-12','ST001','CU001'
)

--7
SELECT
[Category] = 'Most Expensive Product',
[ProductName] = UPPER(ProductName),
[ProductPrice] = ProductPrice
FROM Product,
(SELECT 
[MAXPRICE] = MAX(ProductPrice)
FROM Product
GROUP BY ProductPrice) as x
WHERE MAXPRICE = ProductPrice AND CONVERT(int,SUBSTRING(ProductID,CHARINDEX('PR',ProductID)+2,3)) % 2 = 0


--8
SELECT
[ProductTransactionID] = 'Product Transaction Id ' + SUBSTRING(ProductTransactionID,CHARINDEX('PT',ProductTransactionID,0)+2,3),
[Date] = CONVERT(VARCHAR,ProductTransactionDate,107),
pth.CustomerID,
[CustomerName] = UPPER(cs.CustomerName),
st.StaffID,
[StaffGender] = LEFT(StaffGender,1)
FROM ProductTransactionHeader pth
JOIN Customer cs ON pth.CustomerID = cs.CustomerID
JOIN Staff st ON st.StaffID = pth.StaffID,
(SELECT
[MAXAGE] = MAX(CustomerAge)
FROM Customer WHERE CustomerAge NOT IN (SELECT MAX(CustomerAge) FROM Customer)
) as x
,(SELECT
[AVGSALARY] = AVG(StaffSalary)
FROM Staff WHERE StaffSalary NOT IN (SELECT MAX(StaffSalary) FROM Staff)
) as y
GROUP BY ProductTransactionID, pth.CustomerID, st.StaffID, x.MAXAGE, y.AVGSALARY, pth.ProductTransactionDate, cs.CustomerName, StaffGender
HAVING MAX(CustomerAge) > x.MAXAGE  

INSERT INTO ProductTransactionHeader (ProductTransactionID,ProductTransactionDate, StaffID, CustomerID) 
VALUES 
('PT030', '2022-07-08', 'ST008', 'CU001')

--6
SELECT
CustomerID,
CustomerName,
[Customer Age] = CONVERT(VARCHAR, CustomerAge) + 'years old',
[Customer Phone] = '+62' + SUBSTRING(CustomerPhoneNumber, 3, LEN(CustomerPhoneNumber)-2)
FROM Customer cs 
JOIN HeaderTransaction ht ON ht.CustomerId 

--7
SELECT 
[Category] = 'Most Expensive Product',
[ProductName] = UPPER(ProductName),
[ProductPrice] = 'Rp. '+ CONVERT(varchar,ProductPrice)
FROM Product pr,
(SELECT [plgmahal] = MAX(ProductPrice)
FROM Product) as x
WHERE plgmahal = ProductPrice AND CONVERT(int,SUBSTRING(pr.ProductID,3,2)) % 2 != 0
UNION
SELECT
[Category] = 'Most Affordabble Product',
[ProductName] = UPPER(ProductName),
[ProductPrice] = 'Rp. '+ CONVERT(varchar,ProductPrice)
FROM Product pr,
(SELECT [plgmrh] = MIN(ProductPrice)
FROM Product) as y
WHERE plgmrh = ProductPrice AND CONVERT(int,SUBSTRING(pr.ProductID,3,2)) % 2 != 0

SELECT * FROM Product
INSERT INTO Product VALUES
('PR016','Signed Basketball Jersey',300000)
use JettSportCenter
go
SELECT
CustomerPhoneNumber
FROM Customer