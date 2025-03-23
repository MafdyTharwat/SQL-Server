CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    Name NVARCHAR(100),
    DateOfBirth DATE,
    Gender NVARCHAR(1),
    PhoneNumber NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PersonID INT,
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
	Specialization NVARCHAR(100),
    PersonID INT,
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Appointments (
	AppointmentID INT PRIMARY KEY,
	PatientID INT,
	DoctorID INT,
	AppointmentDate DATE,
	AppointmentStatus NVARCHAR(100),
	MedicalRecordID INT NULL,
	PaymentID INT NULL,
	FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID),
	FOREIGN KEY(MedicalRecordID) REFERENCES MedicalRecords(MedicalRecordID),
	FOREIGN KEY(PaymentID) REFERENCES Payments(PaymentID)
);

CREATE TABLE Payments (
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentMethod NVARCHAR(50),
	AmountPaid DECIMAL,
	AdditionalNotes NVARCHAR(200)
);

CREATE TABLE MedicalRecords (
	MedicalRecordID INT PRIMARY KEY,
	VisitDescription NVARCHAR(200),
	Diagnosis NVARCHAR(200),
	AdditionalNotes NVARCHAR(200)
);

CREATE TABLE Prescriptions (
	PrescriptionID INT PRIMARY KEY,
	MedicalRecordID INT,
	MedicationName NVARCHAR(100),
	Dosage NVARCHAR(100),
	Frequency NVARCHAR(100),
	StartDate DATE,
	EndDate Date,
	SpecialInstructions NVARCHAR(200),
	FOREIGN KEY(MedicalRecordID) REFERENCES MedicalRecords(MedicalRecordID)
);