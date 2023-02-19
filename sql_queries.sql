CREATE DATABASE DB;
##############Create tables###################
CREATE TABLE IF NOT EXISTS Supplier (
SUPP_ID INT,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL,
PRIMARY KEY(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS Customer (
CUS_ID INT,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY(CUS_ID)
);

CREATE TABLE IF NOT EXISTS Category (
CAT_ID INT,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY(CAT_ID)
);

CREATE TABLE IF NOT EXISTS Product (
PRO_ID INT,
PRO_NAME VARCHAR(20) NOT NULL,
PRO_DESC VARCHAR(60),
CAT_ID INT,
PRIMARY KEY(PRO_ID),
FOREIGN KEY(CAT_ID) REFERENCES Category(CAT_ID)
);

ALTER TABLE Product ALTER PRO_NAME SET DEFAULT 'Dummy';

CREATE TABLE IF NOT EXISTS Supplier_Pricing (
PRICING_ID INT,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY(PRICING_ID),
FOREIGN KEY(PRO_ID) REFERENCES Product(PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES Supplier(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS Orders (
ORD_ID INT,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
PRIMARY KEY(ORD_ID),
FOREIGN KEY(CUS_ID) REFERENCES Customer(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES Supplier_Pricing(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS Rating (
RAT_ID INT,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY(RAT_ID),
FOREIGN KEY(ORD_ID) REFERENCES Orders(ORD_ID)
);
######################################
##Insert values into the tables###
INSERT INTO Supplier values (1, 'Rajesh Details', 'Delhi', '124567890');
INSERT INTO Supplier values (2, 'Appario Ltd.', 'Mumbai', '2589631470');
INSERT INTO Supplier values (3, 'Knome Products', 'Bangalore', '9785462315');
INSERT INTO Supplier values (4, 'Bansal Retails', 'Kochi', '8975463285');
INSERT INTO Supplier values (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO Customer values (1, 'Aakash', 9999999999, 'Delhi', 'M');
INSERT INTO Customer values (2, 'Aman', 9785463215, 'Noida', 'M');
INSERT INTO Customer values (3, 'Neha', 9999999999, 'Mumbai', 'F');
INSERT INTO Customer values (4, 'Megha', 9994362399, 'Kolkota', 'F');
INSERT INTO Customer values (5, 'Pulkit', 7895999999, 'Lucknow', 'M');

INSERT INTO Category values (1, 'Books');
INSERT INTO Category values (2, 'Games');
INSERT INTO Category values (3, 'Groceries');
INSERT INTO Category values (4, 'Electronics');
INSERT INTO Category values (5, 'Clothes');

INSERT INTO Product values (1, 'GTA V', 'Windows 7 and above with i5 Processor and 8GB RAM', 2);
INSERT INTO Product values (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
INSERT INTO Product values (3, 'ROG LAPTOP', 'Windows 10 with 15 inch screen, i7 processor, 1 TB SSD', 4);
INSERT INTO Product values (4, 'OATS', 'Highly nutritous from Nestle', 3);
INSERT INTO Product values (5, 'HARRY POTTER', 'Best collection of all time by J.K.Rowling', 1);
INSERT INTO Product values (6, 'MILK', '1L Toned Milk', 3);
INSERT INTO Product values (7, 'Boat Earphones', '1.5Meter long Dolby Atomos', 4);
INSERT INTO Product values (8, 'Jeans', 'Stretchable Denim Jeans with various size and colours', 5);
INSERT INTO Product values (9, 'Project IGI', 'compatible with Windows 7 and above', 2); 
INSERT INTO Product values (10, 'Hoodie', 'Black GUCCI for 13 years and above', 5);
INSERT INTO Product values (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1);
INSERT INTO Product values (12, 'Train Your Brain', 'By Shireen Gupta', 1);

INSERT INTO Supplier_Pricing values (1, 1, 2, 1500);
INSERT INTO Supplier_Pricing values (2, 3, 5, 30000);
INSERT INTO Supplier_Pricing values (3, 5, 1, 3000);
INSERT INTO Supplier_Pricing values (4, 2, 3, 2500);
INSERT INTO Supplier_Pricing values (5, 4, 1, 1000);

INSERT INTO Orders values (101, 1500, "2021-10-06", 2, 1);
INSERT INTO Orders values (102, 1000, "2021-10-12", 3, 5);
INSERT INTO Orders values (103, 30000, "2021-09-16", 5, 2);
INSERT INTO Orders values (104, 1500, "2021-10-05", 1, 1);
INSERT INTO Orders values (105, 3000, "2021-08-16", 4, 3);
INSERT INTO Orders values (106, 1450, "2021-08-18", 1, 9);
INSERT INTO Orders values (107, 789, "2021-09-01", 3, 7);
INSERT INTO Orders values (108, 780, "2021-09-07", 5, 6);
INSERT INTO Orders values (109, 3000, "2021-01-10", 5, 3);
INSERT INTO Orders values (110, 2500, "2021-09-10", 2, 4);
INSERT INTO Orders values (111, 1000, "2021-09-15", 4, 5);
INSERT INTO Orders values (112, 789, "2021-09-16", 4, 7);
INSERT INTO Orders values (113, 31000, "2021-09-16", 1, 8);
INSERT INTO Orders values (114, 1000, "2021-09-16", 3, 5);
INSERT INTO Orders values (115, 3000, "2021-09-16", 5, 3);
INSERT INTO Orders values (116, 99, "2021-09-17", 2, 14);

INSERT INTO Rating values (1, 101, 4);
INSERT INTO Rating values (2, 102, 3);
INSERT INTO Rating values (3, 103, 1);
INSERT INTO Rating values (4, 104, 2);
INSERT INTO Rating values (5, 105, 4);
INSERT INTO Rating values (6, 106, 3);
INSERT INTO Rating values (7, 107, 4);
INSERT INTO Rating values (8, 108, 4);
INSERT INTO Rating values (9, 109, 3);
INSERT INTO Rating values (10, 110, 5);
INSERT INTO Rating values (11, 111, 3);
INSERT INTO Rating values (12, 112, 4);
INSERT INTO Rating values (13, 113, 2);
INSERT INTO Rating values (14, 114, 1);
INSERT INTO Rating values (15, 115, 1);
INSERT INTO Rating values (16, 116, 0);

SELECT * FROM Supplier;
SELECT * FROM Customer;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Supplier_Pricing;
SELECT * FROM Orders;
SELECT * FROM Rating;
##############################################
##Query 3##########
SELECT COUNT(CUS.CUS_ID) AS Total_No_Customers, CUS.CUS_GENDER FROM Customer CUS
JOIN Orders ORD ON CUS.CUS_ID = ORD.CUS_ID
WHERE ORD.ORD_AMOUNT >= 3000
GROUP BY CUS.CUS_GENDER;

##############################################
##Query 4##########
SELECT ORD.*, PROD.PRO_NAME FROM Orders ORD 
JOIN Customer CUS ON ORD.CUS_ID = CUS.CUS_ID
JOIN Supplier_Pricing SP ON SP.PRICING_ID = ORD.PRICING_ID
JOIN Product PROD ON PROD.PRO_ID = SP.PRO_ID
WHERE CUS.CUS_ID = 2
ORDER BY CUS.CUS_ID;
##############################################
##Query 5##########
SELECT SUPP.* FROM Supplier SUPP
JOIN Supplier_Pricing SP ON SP.SUPP_ID = SUPP.SUPP_ID
JOIN PRODUCT PROD ON SP.PRO_ID = PROD.PRO_ID
GROUP BY SP.SUPP_ID HAVING COUNT(SP.PRO_ID) > 1;
##############################################
##Query 6##########
SELECT CAT.*, PRODS.PRO_NAME, PRODS.MIN_PRICE FROM Category CAT JOIN 
(SELECT PROD.*, SP.MIN_PRICE FROM Product PROD
JOIN (SELECT PRO_ID, MIN(SUPP_PRICE) AS MIN_PRICE FROM Supplier_Pricing GROUP BY PRO_ID) SP ON SP.PRO_ID = PROD.PRO_ID) PRODS
ON CAT.CAT_ID = PRODS.CAT_ID;
##############################################
##Query 7##
SELECT DISTINCT PROD.PRO_ID, PROD.PRO_NAME FROM Orders ORD
JOIN Supplier_Pricing SP ON ORD.PRICING_ID = SP.PRICING_ID
JOIN Product PROD ON PROD.PRO_ID = SP.PRO_ID
WHERE ORD.ORD_DATE >= '2021-10-05';

##############################################
##Query 8 ###
SELECT CUS_NAME, CUS_GENDER FROM Customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
##############################################
##Query number 9 ##
##Stored Procedure##
SELECT TEMPSUPP.SUPP_ID, TEMPSUPP.SUPP_NAME,TEMPSUPP.RAT_RATSTARS,
CASE
WHEN TEMPSUPP.RAT_RATSTARS = 5 THEN 'Excellent Service'
WHEN TEMPSUPP.RAT_RATSTARS > 4 THEN 'Good Service'
WHEN TEMPSUPP.RAT_RATSTARS > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service FROM
(SELECT SUPP.SUPP_ID, SUPP.SUPP_NAME, RAT.RAT_RATSTARS FROM Rating RAT 
JOIN Orders ORD ON ORD.ORD_ID = RAT.ORD_ID
JOIN Supplier_Pricing SP ON SP.PRICING_ID = ORD.PRICING_ID
JOIN Supplier SUPP ON SUPP.SUPP_ID = SP.SUPP_ID) AS TEMPSUPP;

