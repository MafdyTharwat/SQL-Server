-- Create the Owners table
CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY,
	F_Name VARCHAR(50),
    M_Name VARCHAR(50),
    L_Name VARCHAR(50)
);

-- Create the Apartments table
CREATE TABLE Apartments (
    Apart_ID INT PRIMARY KEY,
    Location VARCHAR(100),
    Builder VARCHAR(100),
    PurchaseDate DATE,
    OwnerID INT,
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);

-- Create the Tenants table
CREATE TABLE Tenants (
    ID INT PRIMARY KEY,
    F_Name VARCHAR(50),
    M_Name VARCHAR(50),
    L_Name VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

-- Create the Rent table
CREATE TABLE Rent (
    RentID INT PRIMARY KEY,
    Apart_ID INT,
    TenantID INT,
    StartDate DATE,
    EndDate DATE,
    RentAmount DECIMAL(10, 2),
    FOREIGN KEY (Apart_ID) REFERENCES Apartments(Apart_ID),
    FOREIGN KEY (TenantID) REFERENCES Tenants(ID)
);

-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    Apart_ID INT,
    TenantID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (Apart_ID) REFERENCES Apartments(Apart_ID),
    FOREIGN KEY (TenantID) REFERENCES Tenants(ID)
);

-- Create the OwnershipHistory table
CREATE TABLE OwnershipHistory (
    HistoryID INT PRIMARY KEY,
    Apart_ID INT,
    OwnerID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (Apart_ID) REFERENCES Apartments(Apart_ID),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);

-- Create the Contacts table
CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    OwnerID INT,
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);