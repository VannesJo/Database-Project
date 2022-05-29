USE Database_Final_project
GO

INSERT INTO Customer VALUES
('CU001','Antonia','083192753645','321 Tiger','Male','antonia@gmail.com','1999-10-21'),
('CU002','Mariella','083192721641','312 Lion','Female','mariella@gmail.com','2000-02-01'),
('CU003','Bartalotti','083132755435','3 Zebra','Male','bartalotti@gmail.com','1998-03-23'),
('CU004','Cinzia','083192753614','32 Grasshopper','Female','cinzia@gmail.com','2001-11-01'),
('CU005','Quintino','083192712645','32 Cockroach','Male','quintino@gmail.com','2000-12-24'),
('CU006','Valleno Tilman','082167583982','28 View Lake Town','Male','Valleno@gmail.com','1987-12-24'),
('CU007','Rizzo','083192753111','89 Flamingo','Male','rizzo@gmail.com','2000-08-23'),
('CU008','Niccolo','083192111645','21 Whale','Female','niccolo@gmail.com','1998-06-18'),
('CU009','Alessio','083192753222','98 Dog','Male','alessio@gmail.com','2001-02-08'),
('CU010','Berti','083111113645','81 Eagle','Female','berti@gmail.com','2002-11-21'),
('CU011','Leone','083194446452','91 Owl','Female','leone@gmail.com','1996-01-01');

INSERT INTO Vendor VALUES
('VE001', 'Healthy Property', '082917362864', '47 Purple Husky', 'HealthyPropertyCS@healthprop.com'), 
('VE002', 'Sanitized55', '088389288417', '29 White Chihuahua', 'sanitizedCS@sanized.com'), 
('VE003', 'Bio Health Tillman', '021943210127', '25 Black Eagle', 'bioCS@bhealth.com'),
('VE004', 'Bionic Tillman', '032272334025', '94 Green Ostritch', 'bionic@bionic.com'),
('VE005', 'Lambda Tillman', '013476621217 ', '23 Yellow Tortoise', 'lambda@lambda.com'),
('VE006', 'Health Bloom', '032272365794', '15 Lime Persia', 'health@bloom.com'),
('VE007', 'Dynamic Health', '002829559595 ', '91 Pink Pigeon', 'dynamic@health.com'),
('VE008', 'Fruitful Care Tillman', '020163942370 ', '44 Red Python', 'care@fruitfulcare.com'),
('VE009', 'Helpful Hearts', '099470375050 ', '51 Blue Cricket', 'helpheart@healpfulheart.com'),
('VE010', 'Wellness Co Tillman', '013373103495', '39 Orange Shark', 'wellness@wellness.com');

INSERT INTO Staff VALUES
('ST001','Marry McSpicy','Marry13@gmail.com','0372615637','12 Red Bull','1985-08-27','Female',4000000),
('ST002','Kenny bullery','KennyMadman@gmail.com','0791116733','45 Grey Hound','1998-03-12','Male',3000000),
('ST003','Gregoria Malphat','GloryMal@yahoo.com','0911874947','01 Brown Fox','2000-01-01','Female',2500000),
('ST004','Cynthy Quak','CynthyQuak@yahoo.com','0383242385','99 Black Cat','1977-08-09','Female',16000000),
('ST005','Brock Buster','BrockyBo@yahoo.com','0123485854','69 Golden Sparrow','1982-06-21','Male',9000000),
('ST006','Xiao Tulao','XiTao@gmail.com','0199473823','37 Violet Hamster','1989-04-19','Male',8500000),
('ST007','Ahmed Balil','AhmedB@gmail.com','0884466732','70 Chocolate Ant','1961-12-30','Male',18000000),
('ST008','Phuntok Khe','Phunke@gmail.com','0100327332','84 Green Mosquito','1999-11-28','Male',9500000),
('ST009','Tao Bun Hek','TaoHek@gmail.com','0438500384','25 Yellow Elephant','1972-02-15','Female',8200000),
('ST010','Richard Behowsky','RichardBeky@yahoo.com','0827765873','55 Rose Flamingo','1959-09-19','Male',7000000);

INSERT INTO BionicType VALUES
('TY001', 'Hand', 67),
('TY002', 'Foot', 52),
('TY003', 'Foot', 55),
('TY004', 'Leg', 72),
('TY005', 'Arm', 96),
('TY006', 'Eye', 86),
('TY007', 'Leg', 90),
('TY008', 'Hand', 52),
('TY009', 'Foot', 89),
('TY010', 'Eye', 95);

INSERT INTO Bionic VALUES
('BI001', 'TY003', 'Mila', '1967-08-10', 1200000, 55),
('BI002', 'TY001', 'Geevar', '1960-12-05', 1700000, 47),
('BI003', 'TY005', 'Asco', '1967-08-10', 2000000, 70),
('BI004', 'TY006', 'Kinley', '2001-05-21', 1875000, 88),
('BI005', 'TY008', 'Alya', '2020-10-11', 2200000, 40),
('BI006', 'TY007', 'Thallus', '2019-07-16', 1750000, 72),
('BI007', 'TY002', 'Imeda', '2010-06-12', 1900000, 52),
('BI008', 'TY004', 'Fadime', '2016-01-11', 1500000, 65),
('BI009', 'TY009', 'Gioddine', '2018-02-27', 1700000, 50),
('BI010', 'TY010', 'Chunaile', '2006-05-10', 1600000, 43);

INSERT INTO PurchaseTransaction VALUES
('PU001','ST001','VE001','2020-01-22'),
('PU002','ST002','VE002','2019-02-13'),
('PU003','ST003','VE003','2021-03-28'),
('PU004','ST004','VE004','2020-04-05'),
('PU005','ST005','VE005','2020-05-09'),
('PU006','ST006','VE006','2021-06-17'),
('PU007','ST007','VE007','2020-07-27'),
('PU008','ST008','VE008','2020-08-19'),
('PU009','ST009','VE009','2020-09-20'),
('PU010','ST010','VE010','2020-10-10'),
('PU011','ST001','VE001','2021-11-01'),
('PU012','ST002','VE002','2020-12-23'),
('PU013','ST003','VE003','2020-01-06'),
('PU014','ST004','VE004','2021-02-14'),
('PU015','ST005','VE005','2020-03-03');

INSERT INTO PurchaseDetail VALUES
('PU001', 'BI002', 6),
('PU001', 'BI007', 5),
('PU001', 'BI005', 1),
('PU002', 'BI001', 16),
('PU002', 'BI010', 78),
('PU003', 'BI002', 100),
('PU004', 'BI005', 68),
('PU005', 'BI003', 12),
('PU005', 'BI008', 3),
('PU005', 'BI004', 75),
('PU005', 'BI009', 11),
('PU006', 'BI003', 250),
('PU006', 'BI002', 178),
('PU007', 'BI001', 60),
('PU007', 'BI003', 2),
('PU007', 'BI005', 320),
('PU008', 'BI007', 71),
('PU008', 'BI004', 135),
('PU009', 'BI009', 8),
('PU010', 'BI010', 3),
('PU011', 'BI001', 24),
('PU012', 'BI001', 4),
('PU013', 'BI002', 81),
('PU014', 'BI007', 2),
('PU015', 'BI003', 5)

INSERT INTO SalesHeader VALUES
('SA001', 'ST001', 'CU010', '2021-03-02'),
('SA002', 'ST002', 'CU009', '2019-02-12'),
('SA003', 'ST003', 'CU008', '2018-06-15'),
('SA004', 'ST004', 'CU007', '2020-01-30'),
('SA005', 'ST005', 'CU011', '2021-06-02'),
('SA006', 'ST006', 'CU005', '2020-10-15'),
('SA007', 'ST007', 'CU004', '2020-07-25'),
('SA008', 'ST008', 'CU003', '2019-08-28'),
('SA009', 'ST009', 'CU002', '2018-03-06'),
('SA010', 'ST010', 'CU001', '2021-08-10'),
('SA011', 'ST001', 'CU005', '2008-12-02'),
('SA012', 'ST002', 'CU004', '2009-12-27'),
('SA013', 'ST003', 'CU003', '2010-11-09'),
('SA014', 'ST004', 'CU002', '2020-05-14'),
('SA015', 'ST005', 'CU001', '2020-02-03'); 

INSERT INTO SalesDetail VALUES
('SA001', 'BI001', 12),
('SA001', 'BI002', 8),
('SA001', 'BI004', 10),
('SA001', 'BI003', 6),
('SA002', 'BI007', 3),
('SA002', 'BI003', 4),
('SA002', 'BI001', 9),
('SA003', 'BI002', 12),
('SA004', 'BI007', 2),
('SA005', 'BI003', 13),
('SA006', 'BI008', 14),
('SA007', 'BI007', 11),
('SA008', 'BI002', 1),
('SA009', 'BI001', 5),
('SA010', 'BI010', 2),
('SA011', 'BI001', 2),
('SA012', 'BI002', 5),
('SA013', 'BI003', 2),
('SA013', 'BI006', 2),
('SA013', 'BI008', 2),
('SA014', 'BI004', 4),
('SA014', 'BI009', 4),
('SA014', 'BI010', 4),
('SA014', 'BI002', 4),
('SA015', 'BI003', 3);