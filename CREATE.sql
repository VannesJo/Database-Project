CREATE DATABASE Database_Final_project
GO
USE Database_Final_project
GO

CREATE TABLE Customer(
	CustomerID CHAR(5),
	CustomerName VARCHAR(255) NOT NULL,
	CustomerPhoneNumber VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(255) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerEmail VARCHAR(255) NOT NULL,
	CustomerDOB DATE NOT NULL,

	CONSTRAINT pk_customer PRIMARY KEY (CustomerID),
	CONSTRAINT customerid_check CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT email_customer_check CHECK(CustomerEmail LIKE '%@%'),
	CONSTRAINT customer_gender_check CHECK(CustomerGender IN('Male','Female'))
)

CREATE TABLE Staff(
	StaffID CHAR(5),
	StaffName VARCHAR(255) NOT NULL,
	StaffEmail VARCHAR(255) NOT NULL,
	StaffPhoneNumber VARCHAR(50) NOT NULL,
	StaffAddress VARCHAR(255) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffSalary FLOAT NOT NULL,

	CONSTRAINT pk_staff PRIMARY KEY(StaffID),
	CONSTRAINT staffid_check CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT staff_email_check CHECK(StaffEmail LIKE '%@%'),
	CONSTRAINT staff_gender_check CHECK(StaffGender IN('Male','Female'))
)

CREATE TABLE Vendor(
	VendorID CHAR(5),
	VendorName VARCHAR(255) NOT NULL,
	VendorPhoneNumber VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(255) NOT NULL,
	VendorEmail VARCHAR(255) NOT NULL,

	CONSTRAINT pk_vendor PRIMARY KEY(VendorID),
	CONSTRAINT vendor_email_check CHECK(VendorEmail LIKE '%@%'),
	CONSTRAINT vendor_address_len_check CHECK(LEN(VendorAddress) > 10),
	CONSTRAINT vendorid_check CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]')
)

CREATE TABLE BionicType(
	BionicTypeID CHAR(5),
	BionicTypeName VARCHAR(255) NOT NULL,
	BionicTypeDurability INT NOT NULL,

	CONSTRAINT pk_bionictype PRIMARY KEY(BionicTypeID),
	CONSTRAINT bionictypeid_check CHECK(BionicTypeID LIKE 'TY[0-9][0-9][0-9]'),
	CONSTRAINT bionicname_check CHECK(BionicTypeName IN ('Hand', 'Foot', 'Leg', 'Arm', 'Eye')),
	CONSTRAINT bionicdurabilty_check CHECK(BionicTypeDurability BETWEEN 50 AND 100)
)

CREATE TABLE SalesHeader(
	SalesID CHAR(5),
	StaffID CHAR(5),
	CustomerID CHAR(5),
	SalesTransactionDate DATE NOT NULL,

	CONSTRAINT pk_sales PRIMARY KEY(SalesID),
	CONSTRAINT salesid_check CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
	CONSTRAINT sales_staff_check CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT sales_customer_check CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT fk_staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
		ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE PurchaseTransaction(
	PurchaseTransactionID CHAR(5),
	StaffID CHAR(5),
	VendorID CHAR(5),
	TransactionDate DATE NOT NULL,

	CONSTRAINT pk_purch PRIMARY KEY(PurchaseTransactionID),
	CONSTRAINT purch_staff_check CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT purch_vendor_check CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT purchid_check CHECK(PurchaseTransactionID LIKE 'PU[0-9][0-9][0-9]'),
	CONSTRAINT fk_purch_staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_purch_vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
		ON UPDATE CASCADE ON DELETE CASCADE

)


CREATE TABLE Bionic(
	BionicID CHAR(5),
	BionicTypeID CHAR(5),
	BionicName VARCHAR(255) NOT NULL,
	BionicLaunchDate DATE NOT NULL,
	BionicPrice FLOAT NOT NULL,
	BionicStock INT NOT NULL,

	CONSTRAINT pk_bionic PRIMARY KEY(BionicID),
	CONSTRAINT bionic_check CHECK(BionicID LIKE 'BI[0-9][0-9][0-9]'),
	CONSTRAINT bionic_bionictype_check CHECK(BionicTypeID LIKE 'TY[0-9][0-9][0-9]'),
	CONSTRAINT fk_bionic FOREIGN KEY(BionicTypeID) REFERENCES BionicType(BionicTypeID)
		ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE SalesDetail(
	SalesID CHAR(5),
	BionicID CHAR(5),
	SalesQuantity INT NOT NULL,

	CONSTRAINT sales_qty_check CHECK(LEN(SalesQuantity) > 0),
	CONSTRAINT sales_salesdetail_check CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
	CONSTRAINT bionic_salesdetail_check CHECK(BionicID LIKE 'BI[0-9][0-9][0-9]'),
	CONSTRAINT fk_salesdetail FOREIGN KEY(SalesID) REFERENCES SalesHeader(SalesID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_bionic_sales FOREIGN KEY(BionicID) REFERENCES Bionic(BionicID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT pk_salesdetail PRIMARY KEY (SalesID, BionicID)
)

CREATE TABLE PurchaseDetail(
	PurchaseTransactionID CHAR(5),
	BionicID CHAR(5),
	PurchaseQuantity INT NOT NULL,

	CONSTRAINT purch_qty_check CHECK(LEN(PurchaseQuantity) > 0),
	CONSTRAINT purch_bionic_check CHECK(BionicID LIKE 'BI[0-9][0-9][0-9]'),
	CONSTRAINT purch_purchdetail_check CHECK(PurchaseTransactionID LIKE 'PU[0-9][0-9][0-9]'),
	CONSTRAINT fk_purchtrans FOREIGN KEY(PurchaseTransactionID) REFERENCES PurchaseTransaction(PurchaseTransactionID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_purchbionic FOREIGN KEY(BionicID) REFERENCES Bionic(BionicID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT pk_purchdetail PRIMARY KEY (PurchaseTransactionID, BionicID)
)

