CREATE TABLE Makes
(
    MakeID INT PRIMARY KEY,
    MakeName NVARCHAR(255)
);

CREATE TABLE MakeModels 
(
    ModelID INT PRIMARY KEY,
    MakeID INT,
    ModelName NVARCHAR(255),
	FOREIGN KEY(MakeID) REFERENCES Makes(MakeID)
);

CREATE TABLE SubModels
(
    SubModelID INT PRIMARY KEY,
    ModelID INT,
    SubModelName NVARCHAR(255),
    FOREIGN KEY (ModelID) REFERENCES MakeModels(ModelID)
);

CREATE TABLE Bodies 
(
    BodyID INT PRIMARY KEY,
    BodyName NVARCHAR(255)
);

CREATE TABLE DriverTypes 
(
    DriveTypeID INT PRIMARY KEY,
    DriveTypeName NVARCHAR(255)
);

CREATE TABLE FuelTypes
(
    FuelTypeID INT PRIMARY KEY,
    FuelTypeName NVARCHAR(255)
);

CREATE TABLE VehicleDetails 
(
    ID INT PRIMARY KEY,
    MakeID INT,
    ModelID INT,
    SubModelID INT,
    BodyID INT,
    Vehicle_Display_Name NVARCHAR(255),
    VehicleYear INT,
    DriveTypeID INT,
    Engine NVARCHAR(255),
    Engine_CC INT,
    Engine_Cylinders INT,
    Engine_Liter_Display NVARCHAR(50),
    FuelTypeID INT,
    NumDoors INT,
	FOREIGN KEY (MakeID) REFERENCES Makes(MakeID),
    FOREIGN KEY (ModelID) REFERENCES MakeModels(ModelID),
    FOREIGN KEY (SubModelID) REFERENCES SubModels(SubModelID),
    FOREIGN KEY (BodyID) REFERENCES Bodies(BodyID),
    FOREIGN KEY (DriveTypeID) REFERENCES DriverTypes(DriveTypeID),
    FOREIGN KEY (FuelTypeID) REFERENCES FuelTypes(FuelTypeID)
);