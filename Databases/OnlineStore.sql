create table Customer
(
	CustomerID int primary key,
	CustomerName nvarchar(100) not null,
	CustomerEmail nvarchar(100) not null,
	CustomerPhone nvarchar(20) not null,
	CustomerAddress nvarchar(200) not null,
	Username nvarchar(100) not null,
	UserPassword nvarchar(100) not null
);

create table ProductCategory
(
	CategoryID int primary key,
	CategoryName nvarchar(100)
);

create table ProductCatalog
(
	ProductID int primary key,
	ProductName nvarchar(100) not null,
	ProductDescription nvarchar(500),
	ProductPrice decimal  not null,
	QuantityInStock int,
	CategoryID int,
	foreign key(CategoryID) references ProductCategory(CategoryID)
);

create table ProductImages
(
	ImageID int primary key,
	ImageURL nvarchar(400) not null,
	ImageOrder int not null,
	ProductID int,
	foreign key(ProductID) references ProductCatalog(ProductID)
);

create table OrderItems
(
	OrderID int primary key,
	Quantity int not null,
	Price decimal not null,
	TotalItemsPrice decimal not null,
	ProductID int,
	foreign key(ProductID) references ProductCatalog(ProductID)
);

create table Reviews
(
	ReviewID int primary key,
	ReviewText nvarchar(500) not null,
	Rating decimal,
	ReviewDate date,
	ProductID int,
	CustomerID int,
	foreign key(ProductID) references ProductCatalog(ProductID),
	foreign key(CustomerID) references Customer(CustomerID)
);

create table Orders
(
	OrderID int primary key,
	OrderDate date,
	TotalAmount decimal,
	OrderStatus nvarchar(30),
	CustomerID int,
	foreign key(CustomerID) references Customer(CustomerID)
);

create table Payments
(
	PaymentID int primary key,
	Amount decimal not null,
	PaymentMethod nvarchar(50) not null,
	TransactionDate date not null,
	OrderID int ,
	foreign key(OrderID) references Orders(OrderID)
);

create table Shippings
(
	ShippingID int primary key,
	CarrierName nvarchar(100) not null,
	TrackingNumber nvarchar(50) not null,
	ShippingStatus nvarchar(20) not null,
	EstimatedDeliveryDate date not null,
	ActualDeliverDate date not null,
	OrderID int,
	foreign key(OrderID) references Orders(OrderID)
);