create table Customer
(
	CustomerID int primary key,
	CustomerName nvarchar(100) not null,
	ContactInfo nvarchar(200),
	DriverLicenseNumber nvarchar(20)
);

create table VehicleCategory
(
	CategoryID int primary key,
	CategoryName nvarchar(50)
);

create table FuelTypes
(
	FuelID int primary key,
	FuelName nvarchar(50)
);

create table Vehicle
(
	VehicleID int primary key,
	Make nvarchar(50),
	Model nvarchar(50),
	VehicleYear int,
	Mileage int,
	FuelTypeID int,
	CategoryID int,
	PlateNumber nvarchar(20),
	RentalPricePerDay decimal,
	isAvailableToRent char,
	foreign key(FuelTypeID) references FuelTypes(FuelID),
	foreign key(CategoryID) references VehicleCategory(CategoryID)
);

create table Maintenance
(
	MaintenanceID int primary key,
	VehicleID int not null,
	M_Description nvarchar(300),
	MaintenanceDate date,
	Cost decimal,
	foreign key(VehicleID) references Vehicle(VehicleID)
);

create table VehicleReturns
(
	ReturnID int primary key,
	ActualReturnDate date not null,
	ActualRentalDays int not null,
	Mileage int,
	ConsumedMileage int,
	FinalCheckNotes nvarchar(500),
	AdditionalCharges decimal,
	ActualTotalDueAmount decimal
);

create table RentalBooking
(
	BookingID int primary key,
	CustomerID int,
	VehicleID int,
	StartDate date not null,
	EndDate date not null,
	PickupLocation nvarchar(100) not null,
	DropoffLocation nvarchar(100) not null,
	InitialRentalDays int not null,
	RentalPricePerDay decimal not null,
	InitialTotalDueAmount decimal not null,
	InitialCheckNotes nvarchar(500),
	foreign key(CustomerID) references Customer(CustomerID),
	foreign key(VehicleID) references Vehicle(VehicleID)
);

create table RentalTransactions
(
	TransactionID int primary key,
	BookingID int,
	ReturnID int,
	PaymentDetails nvarchar(100),
	PaidInitialTotalDueAmount decimal not null,
	ActualTotalDueAmount decimal not null,
	TotalRemaining decimal,
	TotalRefundedAmount decimal not null,
	TransactionDate date,
	UpdatedTransactionDate date,
	foreign key(BookingID) references RentalBooking(BookingID),
	foreign key(ReturnID) references VehicleReturns(ReturnID)
);