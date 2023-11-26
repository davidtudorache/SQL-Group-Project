SET FOREIGN_KEY_CHECKS =0;
DROP TABLE emp;
DROP TABLE employees_teach;
DROP TABLE job_history;
DROP TABLE section;
DROP TABLE jobs;
DROP TABLE locations;
DROP TABLE regions;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE countries;

CREATE TABLE ManufactureDetails (
  ManufID decimal(5,0) PRIMARY KEY,
  ManufNam varchar(50) ,
  ManufTelNo decimal(11,0) ,
  ManufAddress varchar(50) ,
  ManufPostCode varchar(8) ,
  ManufEmail varchar(50)
);

CREATE TABLE Dealers (
  DealerName varchar(50) PRIMARY KEY,
  DealerTelNo varchar(50),
  DealerAddress longtext,
  DealerEmail longtext
);

CREATE TABLE BoatRecord (
  BoatID decimal(5,0) PRIMARY KEY,
  Class_Size varchar(11) ,
  BoatModel varchar(25) ,
  ManufID decimal(5,0) ,
  PurchDate date ,
  PurchPrice decimal(6,2) ,
  LastService date ,
  DealerName varchar(25) ,
  SaleDate date ,
  SalePrice decimal(6,2) ,
  FOREIGN KEY (ManufID) REFERENCES ManufactureDetails (ManufID),
  FOREIGN KEY (DealerName) REFERENCES Dealers (DealerName)
);

CREATE TABLE MaintenanceHistory (
  MaintID decimal(5,0) PRIMARY KEY,
  BoatID decimal(5,0) ,
  MaintRefNo decimal(5,0) ,
  FaultDetails varchar(50) ,
  FaultDate date ,
  ActionTaken varchar(50) ,
  ActionDate date ,
  FOREIGN KEY (`BoatID`) REFERENCES BoatRecord (`BoatID`)
);

CREATE TABLE BoatTypes( 
BoatModel VARCHAR(25) PRIMARY KEY,
Class VARCHAR(25),
Size VARCHAR(25),
Price DECIMAL(65)
);

CREATE TABLE Parts( 
PartID INT PRIMARY KEY,
ManufID decimal(5,0),
BoatID decimal(5,0),
Price INT,
QuantityOrdered INT,
QuantityInStock INT,
FOREIGN KEY (BoatID) REFERENCES BoatRecord (BoatID),
FOREIGN KEY (ManufID) REFERENCES ManufactureDetails (ManufID)
);

CREATE TABLE PartsForBoats(
PartID INT,
BoatID decimal(5,0),
CONSTRAINT PRIMARY KEY(PartID, BoatID),
FOREIGN KEY (BoatID) REFERENCES BoatRecord (BoatID),
FOREIGN KEY (PartID) REFERENCES Parts (PartID)
);

CREATE TABLE Customer
(CustID DECIMAL(4) PRIMARY KEY,
FirstName VARCHAR(25),
LastName VARCHAR(25),
CustTelNo DECIMAL(11),
CustAddress VARCHAR(255),
CustEmail VARCHAR(255));

CREATE TABLE SoldBoats(
BoatID decimal(5,0),
saleDate DATE,
price VARCHAR(25),
CONSTRAINT PRIMARY KEY(boatID, saleDate),
FOREIGN KEY (BoatID) REFERENCES BoatRecord (BoatID)
);
 
 CREATE TABLE rental(
rentNumber INT PRIMARY KEY,
rentDate DATE,
rentPeriod VARCHAR(10),
hireDate DATE,
dueDate DATE,
actualDate DATE,
amountPaid INT,
CustID DECIMAL(4),
BoatID decimal(5,0),
FOREIGN KEY (BoatID) REFERENCES BoatRecord (BoatID),
FOREIGN KEY (CustID) REFERENCES Customer (CustID)

);
 
CREATE TABLE reservation(
reservationNo DECIMAL(10) PRIMARY KEY,
CustID DECIMAL(4),
resDate DATE,
BoatType VARCHAR(25),
boatSize VARCHAR(6),
days DECIMAL(1),
hirePrice DECIMAL(10,2),
price DECIMAL(10),
boatNumber DECIMAL(2),
BoatModel VARCHAR(25),
FOREIGN KEY (CustID) REFERENCES Customer (CustID),
FOREIGN KEY (BoatModel) REFERENCES BoatTypes (BoatModel)
);

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Dalis Vannoort', '77 A828, Appin, AP7 6GU', 075731374643, 'dvannoort0@salon.com');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Joes Junk', '15 Back Lane, Buxton, BX7 5FY', 07365534221, 'JoesJunk@zdnet.com');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Hoebart Kubera', '4 Finedon House, Marine Parade, Littlestone, LS4 6GU', 07874051869, 'hkubera2@who.int');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Eva Iacomettii', '9 Hartlands, Onslow Road, Newent, NW5 8TU', 07880072148, 'eiacomettii3@admin.ch');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Alley Pate', '07610 Arizona Alley, A67 8GU', 07822040557, 'apate4@gnu.org');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Korrie Legge', '1076 Evesham Road, Astwood Bank, DT5 8JO', 07380018233, 'klegge5@reference.com');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Minne Hinkens', '53 Balby Road, Balby, B7 8HK', 07978390430, 'mhinkens6@smh.com.au');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Inigo MacAllaster', '1910 Farwell Plaza, G56 9FT', 07893419552, 'imacallaster7@blogspot.com' );

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Linell Skeeles', '57 Great Russell Street, London, NW1 8TU', 07532931207, 'lskeeles8@goo.gl');

INSERT INTO Dealers(DealerName, DealerAddress, DealerTelNo, DealerEmail)
VALUES('Sioux Drogan', '75 Thomas Parsons Square, Ely, EL6 9GU', 07417098738, 'sdrogan9@dropbox.com');


INSERT INTO ManufactureDetails
VALUES (1,'SuperBoat',1772459666,'Unit 7 Centurion Court, Leyland','LE10 2DJ','admin@superboat.co.uk'),
	(2,'Explorer Boats UK',1704807654,'Meadow Lane, Burscough','BU56 8GH','admin@explorerboats.co.uk'),
	(3,'The Northwich Boat Company',1270160160,'Unit 1 Kings Lock Boatyard Booth Lane, Middlewich','MW67 7GY','admin@northwichboats.co.uk'),
	(4,'Collingwood Boat Builders',1513742985,'29 Townsend Street, Collingwood','CL27 2DU','admin@collingwoodboats.co.uk'),
	(5,'Elton Moss Boat Builders',1270760160,'Unit 4 Kings Lock Boatyard Booth Lane, Middlewich','MW63 8TY','admin@eltonmossboats.co.uk'),
	(6,'Aintree Boat Company Ltd',1515239000,'Brookfield Drive, Liverpool','L1 6GU','admin@aintreeboats.co.uk'),
	(7,'Braidbar Boats Ltd',1625873471,'Lord Vernons Wharf Lyme Road Higher, Poynton','PY12 9TS','admin@braidbarboats.co.uk'),
	(8,'Bourne Boat Builders Ltd ',1785714692,'Teddesley Road, Penkridge','PE8 7SU','admin@bourneboats.co.uk'),
	(9,'Stoke on Trent Boat Building Co Ltd',1782813831,'Longport Wharf Station Street, Stoke-on-Trent','ST6 9GU','admin@stokeboats.co.uk'),
	(10,'MGM Boats Narrowboat Builders',1162640009,'27 Mill Lane, Leicester','LE6 9FY','admin@mgmboats.co.uk');
    
INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('VLSB', 'sail boat', 'very large', 240);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('LSB', 'sail boat', 'large', 180);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('SDSB', 'sail boat', 'standard', 160);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('SSB', 'sail boat', 'small', 140);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('VLMB', 'motor boat', 'very large', 280);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('LMB', 'motor boat', 'large', 240);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('SDMB', 'motor boat', 'standard', 200);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('SMB', 'motor boat', 'small', 170);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('VLRB', 'row boat', 'very large', 160);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('LRB', 'row boat', 'large', 140);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('SDRB', 'row boat', 'standard', 120);

INSERT INTO BoatTypes(boatModel, class, size, price)
VALUES('sRB', 'row boat', 'small', 110);

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (1, 'Dion', 'Broadnecke', 07174826351, '9 Oak Street, Liverpool, L34 8DY', 'dbroes1d@who.int');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (2, 'Scarlett', 'Galley', 03260476982, '886 Northport Parkway, Liverpool, L3 6DF', 'scargr1c@imgur.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (3, 'Sissy', 'Gadson', 04924556740, '95 Putney Road, Liverpool, L2 7YG', 'sgadson1b@ucoz.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (4, 'Tabby', 'Minichi', 07795213673, '6 Amoth Court, Warrington, WT6 8UY', 'minitabc@imgur.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (5, 'Nellie', 'Greenmon', 03816078215, '40 Graceland Crossing, Liverpool, L23 8FY', 'nelliegreen12@patch.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (6, 'Hanny', 'Marsters', 07075576685 , '2 Almo Trail, Liverpool, L21 9FY', 'hmarsters@netlog.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (7, 'Oswell', 'Aspinell', 09931348133 , '64 Jackson Road, Liverpool, L5 6FH', 'OsAspinell@digg.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (8, 'Florance', 'Baston', 07315082134, '40 Magdeline Lane, Warrington, WT5 8WK', 'FloBar@dirtg.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (9, 'Candice', 'Tumilson', 01639824657, '1 Farragut Parkway, Liverpool, L75 8GJ', 'canditum15@bloomberg.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (10, 'Clair', 'Bavin', 06245985897, '87 Toban Drive, Liverpool, L26 8GH', 'clairBav@sprog.it');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (11, 'John', 'Terry', 0201772227, 'SE10 1NH', 'Terry2D@ok.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (12, 'Justin', 'Bieber', 0167756413, 'LABC564', 'Beiber@pop.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (13, 'David', 'Hockney', 0154326412, 'N1 1XY', 'hockers@gall.com');

INSERT INTO Customer(CustID, FirstName, LastName, CustTelNo, CustAddress, CustEmail)
VALUES (14, 'David', 'Blaine',0154326412 , 'N1 1XY', 'blaine@magic.org');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5344, 1, '2020-10-20', 'Rboat', 'Lrg', 1, 280, 9, 'LRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5345, 2, '2020-10-20', 'Rboat', 'Sml', 1, 220, 16, 'SRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5347, 9, '2020-10-20', 'MBoat', 'Lrg', 1, 240, 7, 'LMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5346, 4, '2020-10-20', 'MBoat', 'Lrg', 1, 240, 6, 'LMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5349, 7, '2020-10-20', 'RBoat', 'Lrg', 1, 140, 9, 'LRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5348, 6, '2020-10-20', 'MBoat', 'Lrg', 1, 240, 15, 'LMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5350, 2, '2020-10-20', 'SBoat', 'Lrg', 1, 180, 9, 'LSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5352, 5, '2020-10-20', 'RBoat', 'Sml', 1, 110, 16, 'SRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5353, 5, '2020-10-20', 'RBoat', 'Sml', 1, 110, 17, 'SRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5354, 9, '2020-10-20', 'MBoat', 'Std', 2, 400, 14, 'SDMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5351, 2, '2020-10-20', 'SBoat', 'Lrg', 1, 180, 11, 'LSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5364, 8, '2020-10-20', 'SBoat', 'Sml', 1, 110, 4, 'SSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5355, 9, '2020-10-20', 'MBoat', 'Std', 2, 400, 13, 'SDMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5356, 1, '2020-10-20', 'MBoat','Std', 1, 200, 8, 'SDMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5357, 6, '2020-10-20', 'MBoat', 'Std', 1, 200, 1, 'SDMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5358, 7, '2020-10-20', 'MBoat', 'Std', 1, 120, 10, 'SDMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5366, 10, '2020-10-20', 'RBoat', 'Std', 0.5, 80, 21, 'SDRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5360, 4, '2020-10-20', 'MBoat', 'VLrg', 1, 280, 20, 'VLMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5361, 8, '2020-10-20', 'SBoat', 'VLrg', 1, 240, 2, 'VLSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5359, 10, '2020-10-20', 'SBoat', 'Std', 1, 160, null, 'SDSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5362, 3, '2020-10-20', 'RBoat', 'VLrg', 1, 100, null, 'VLRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5365, 3, '2020-10-20', 'RBoat','Std',1,120,null,'SDRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5363,3,'2020-10-20','RBoat','VLrg',1,100,null,'VLRB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5342,1,'2020-04-27','SBoat','Lrg',1,180,16,'LSB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5341,4,'2019-10-20','MBoat','Lrg',1,240,6,'LMB');

INSERT INTO reservation(reservationNo, custID, resDate, boatType, boatSize,days, hirePrice, boatNumber, boatModel)
VALUES(5343,2,'2019-12-09','MBoat','Lrg',1,240,6,'LMB');

INSERT INTO BoatRecord 
VALUES (1,'Std_MBoat','Explorer',1,'2010-11-22',3910.00,'2020-10-22','Dalis Vannoort','2020-01-02',1500.00);

INSERT INTO BoatRecord 
VALUES (2,'VLrg_SBoat','TurboSail',2,'2009-10-12',3840.00,'2019-10-08','Joes Junk','2019-10-10',1600.00);

INSERT INTO BoatRecord
VALUES (3,'Lrg_SBoat','MasterSail',2,'2009-10-12',3840.00,'2019-10-08',NULL,NULL,NULL);

INSERT INTO BoatRecord
VALUES(4,'Sml_SBoat','SmallSailor',3,'2015-11-12',2040.00,'2020-10-14',NULL,NULL,NULL),
	(5,'Sml_SBoat','SmallSailor',3,'2015-11-12',2040.00,'2020-10-13',NULL,NULL,NULL),
	(6,'Lrg_MBoat','Grande',5,'2015-01-14',5440.00,'2020-10-15',NULL,NULL,NULL),
	(7,'Lrg_MBoat','Grande',5,'2015-01-14',5440.00,'2020-09-13',NULL,NULL,NULL),
	(8,'Std_MBoat','Turbo Mid',2,'2015-01-14',5440.00,'2020-09-13',NULL,NULL,NULL),
	(9,'Lrg_RBoat','RowStream',3,'2015-01-12',440.00,'2020-10-10',NULL,NULL,NULL),
	(10,'Std_RBoat','RowerX',4,'2015-01-12',320.00,'2020-09-22',NULL,NULL,NULL),
	(11,'Lrg_SBoat','Explorer',1,'2016-01-10',3320.00,'2020-03-03',NULL,NULL,NULL),
	(12,'Std_SBoat','Navigator',1,'2016-01-10',3320.00,'2020-04-03',NULL,NULL,NULL),
	(13,'Std_MBoat','Turbo Mid',2,'2018-02-14',4440.00,'2020-09-14',NULL,NULL,NULL),
	(14,'Std_MBoat','Turbo Mid',2,'2018-02-14',4440.00,'2020-09-13',NULL,NULL,NULL),
	(15,'Lrg_MBoat','MasterBlaster',7,'2018-02-14',5440.00,'2020-10-14',NULL,NULL,NULL),
	(16,'Lrg_RBoat','HappyRower',8,'2018-01-10',340.00,'2020-10-02',NULL,NULL,NULL),
	(17,'Sml_RBoat','HappyRower',8,'2018-01-10',340.00,'2020-10-02',NULL,NULL,NULL),
	(18,'VLrg_RBoat','Streamer',3,'2017-01-09',640.00,'2020-10-07',NULL,NULL,NULL),
	(19,'VLrg_RBoat','Great Row',4,'2019-01-19',650.00,'2020-09-12',NULL,NULL,NULL),
	(20,'VLrg_MBoat','SuperBlaster',7,'2018-01-14',7440.00,'2020-08-07',NULL,NULL,NULL),
	(21,'Std_RBoat','Lizard',6,'2017-01-09',340.00,'2020-10-04',NULL,NULL,NULL),
	(22,'Lrg_MBoat','Grande',5,'2018-02-14',5440.00,'2020-09-13',NULL,NULL,NULL),
	(23,'Lrg_SBoat','MasterSail',2,'2015-10-12',3240.00,'2020-01-27',NULL,NULL,NULL);
    
INSERT INTO MaintenanceHistory
VALUES (1,1,1,'Chipped propeller','2015-02-15','Replace Propeller','2015-02-27'),
	(2,1,2,'Bilge pumps gone','2015-02-15','New bilge pumps','2015-08-27'),
	(3,1,3,NULL,NULL,'New head pumps','2015-08-15'),
	(4,1,4,NULL,NULL,'Normal Service','2016-03-20'),
	(5,1,5,'Cutless bearing worn through','2016-12-02','Fit new bearing','2017-01-27'),
	(6,3,1,'Damaged mast','2016-04-17','Repair Mast','2016-04-27'),
	(7,3,2,'Bent Forestay','2017-07-10','Replace Forestay','2017-08-22'),
	(8,3,3,'Shot Boom','2018-05-07','Replace Boom','2018-06-06'),
	(9,3,4,'Rudderstock Chipped','2019-06-07','Repair Rudderstock','2019-06-08'),
	(10,3,5,NULL,NULL,'Normal Service','2020-01-27'),(11,3,6,'Rudderblade busted','2020-10-19',NULL,NULL);
    
INSERT INTO SoldBoats(boatID, saleDate, price)
VALUES('1', '2020-11-30', 1500);

INSERT INTO SoldBoats(boatID, saleDate, price)
VALUES('3', '2020-01-02', 1500);

INSERT INTO SoldBoats(boatID, saleDate, price)
VALUES('2', '2019-10-10', 1600);

INSERT INTO rental(rentNumber, rentDate, rentPeriod, hireDate, dueDate, actualDate, amountPaid, custID, boatID)
VALUES(4734, '2019-05-02', 'HD', '2019-05-02', '2019-05-02', '2019-05-02', 125,11, 1);

INSERT INTO rental(rentNumber, rentDate, rentPeriod, hireDate, dueDate, actualDate, amountPaid, custID, boatID)
VALUES(4745, '2019-05-03', 'HD', '2019-05-03', '2019-05-03', '2019-05-03', 125,12, 1);

INSERT INTO rental(rentNumber, rentDate, rentPeriod, hireDate, dueDate, actualDate, amountPaid, custID, boatID)
VALUES(4812, '2019-05-04', '2D', '2019-05-04', '2019-05-05', '2019-05-06', 400,13, 1);

INSERT INTO rental(rentNumber, rentDate, rentPeriod, hireDate, dueDate, actualDate, amountPaid, custID, boatID)
VALUES(4875, '2019-05-06', 'FD', '2019-05-06', '2019-05-06', '2019-05-06', 200,13, 1);

SELECT *
FROM ManufactureDetails;

SELECT *
FROM Dealers;

SELECT *
FROM BoatRecord;

SELECT *
FROM MaintenanceHistory;

SELECT *
FROM BoatTypes;

SELECT *
FROM Customer;

SELECT *
FROM SoldBoats;

SELECT *
FROM rental;

SELECT *
FROM reservation;