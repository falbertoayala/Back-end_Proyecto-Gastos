Create Database Expenses;
Use Expenses;


Create Table Users(
	UserID int NOT NULL IDENTITY(1,1),
	UserName varchar (50) NOT NULL,
	UserEmail varchar (100) NOT NULL,
	UserPassword varchar (50) NOT NULL,
	CONSTRAINT PK_Users PRIMARY KEY (UserID)
);
Create Table AccountTypes(
	AccTypeID smallint NOT NULL IDENTITY(1,1),
	AccTypeName varchar (50) NOT NULL,
	CONSTRAINT PK_AccountTypes PRIMARY KEY (AccTypeID)
);
Create Table Accounts(
	AccountID int NOT NULL IDENTITY(1,1),
	AccountName varchar (50) NOT NULL,
	AccBalance decimal(19,4) NOT NULL,
	AccTypeID smallint NOT NULL,
	UserID int NOT NULL,
	CONSTRAINT PK_Accounts PRIMARY KEY (AccountID),
	CONSTRAINT FK_UserAccount FOREIGN KEY (UserID)
	REFERENCES Users(UserID) ON DELETE CASCADE,
	CONSTRAINT FK_AccountTypeAccount FOREIGN KEY (AccTypeID)
	REFERENCES AccountTypes(AccTypeID)
);
Create Table RecordTypes(
	RecTypeID smallint NOT NULL IDENTITY(1,1),
	RecTypeName varchar (50) NOT NULL,
	CONSTRAINT PK_RecordTypes PRIMARY KEY (RecTypeID)
);
Create Table ExpenseCategories(
	CategoryID smallint NOT NULL IDENTITY(1,1),
	CategoryName varchar (50) NOT NULL,
	CONSTRAINT PK_ExpenseCategories PRIMARY KEY (CategoryID)
);
Create Table Records(
	RecordID int NOT NULL IDENTITY(1,1),
	RecordDate date NOT NULL,
	RecTypeID smallint NOT NULL,
	CategoryID smallint NOT NULL,
	RecAmount decimal(19,4) NOT NULL,
	RecDescription varchar (max),
	AccountID int NOT NULL,
	CONSTRAINT PK_Records PRIMARY KEY (RecordID),
	CONSTRAINT FK_RecTypeRecord FOREIGN KEY (RecTypeID)
	REFERENCES RecordTypes(RecTypeID),
	CONSTRAINT FK_ExpCategoryRecord FOREIGN KEY (CategoryID)
	REFERENCES ExpenseCategories(CategoryID),
	CONSTRAINT FK_AccountRecord FOREIGN KEY (AccountID)
	REFERENCES Accounts(AccountID) ON DELETE CASCADE
);