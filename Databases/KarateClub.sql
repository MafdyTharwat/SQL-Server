create table person
(
	personID int primary key,
	peronName nvarchar(100),
	personAddress nvarchar(100),
	contactInfo nvarchar(100)
);

create table instructor
(
	instructorID int primary key,
	personID int,
	qualification nvarchar(100),
	foreign key(personID) references person(personID)
);

create table beltRanks
(
	rankID int primary key,
	rankName nvarchar(50),
	testFees money
);

create table members
(
	memberID int primary key,
	personID int,
	emergencyContactInfo nvarchar(100),
	lastBeltRank int,
	isActive bit,
	foreign key(personID) references person(personID),
	foreign key(lastBeltRank) references beltRanks(rankID)
);

create table memberInstructor
(
	memberInstructorID int primary key,
	memberID int,
	instructorID int,
	assignDate date,
	foreign key(memberID) references members(memberID),
	foreign key(instructorID) references instructor(instructorID)
);

create table payments
(
	paymentID int primary key,
	paymentAmount int,
	paymentDate date,
	memberID int,
	foreign key(memberID) references members(memberID)
);

create table supscriptionPeriod
(
	periodID int primary key,
	startDate date,
	endDate date,
	fees money,
	memberID int,
	paymentID int,
	foreign key(memberID) references members(memberID),
	foreign key(paymentID) references payments(paymentID)
);

create table beltTests
(
	testID int primary key,
	memberID int,
	rankID int,
	result bit,
	testDate date,
	testByInstructorID int,
	paymentID int,
	foreign key(memberID) references members(memberID),
	foreign key(rankID) references beltRanks(rankID),
	foreign key(testByInstructorID) references instructor(instructorID),
	foreign key(paymentID) references payments(paymentID)
);