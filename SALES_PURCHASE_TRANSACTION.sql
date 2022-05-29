USE Database_Final_project
GO
-- SALES TRANSACTION BETWEEN CUSTOMER AND STAFF
INSERT INTO Customer VALUES
('CU078', 'Deanddro Riller','014687297644', 'California, Street 43', 'Male', 'Riller@hotmail.com', '1987-03-09')

INSERT INTO Staff VALUES
('ST017','Jacky Ryan','JyRyan@gmail.com','0412416733','Westview, 98 Head Street','1980-09-22','Male',2780000)

INSERT INTO SalesHeader VALUES
('SA022', 'ST017', 'CU078', '2021-12-20')

INSERT INTO SalesDetail VALUES
('SA022', 'BI002', 2),
('SA022', 'BI003', 1),
('SA022', 'BI009', 5)

-- PURCHASE TRANSACTION BETWEEN STAFF AND VENDOR
INSERT INTO BionicType VALUES
('TY011', 'Hand', 87),
('TY012', 'Foot', 92),
('TY013', 'Foot', 75),
('TY014', 'Leg', 82),
('TY015', 'Arm', 56),
('TY016', 'Eye', 66),
('TY017', 'Leg', 80),
('TY018', 'Hand', 72),
('TY019', 'Foot', 89),
('TY020', 'Eye', 95);

INSERT INTO Bionic VALUES
('BI011', 'TY013', 'Sillia', '1960-04-01', 900000, 45),
('BI012', 'TY011', 'Bod', '1990-02-05', 2700000, 67),
('BI013', 'TY015', 'Vasc', '2007-03-10', 1000000, 40),
('BI014', 'TY016', 'HeoDa', '2002-05-11', 1600000, 68),
('BI015', 'TY018', 'Rampt', '2021-01-21', 2000000, 90),
('BI016', 'TY017', 'Sollow', '2009-04-16', 800000, 102),
('BI017', 'TY012', 'KutG', '2010-12-12', 2900000, 62),
('BI018', 'TY014', 'AL-G', '2016-11-11', 500000, 35),
('BI019', 'TY019', 'JoHeim', '2018-12-27', 2700000, 40),
('BI020', 'TY020', 'Grexy', '2006-05-10', 1600000, 33);

INSERT INTO Vendor VALUES
('VE011', 'Eco Bio', '027639828799', '36 Gray Field', 'Ecobio@gmail.com')

INSERT INTO PurchaseTransaction VALUES
('PU021','ST017','VE011','2020-07-30')

INSERT INTO PurchaseDetail VALUES
('PU021', 'BI012', 6),
('PU021', 'BI020', 2),
('PU021', 'BI015', 3)