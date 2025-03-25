select count(*) as TotalMakesRunOnGAS
from (
select distinct Makes.Make, FuelTypes.FuelTypeName
from Makes inner join VehicleDetails on Makes.MakeID = VehicleDetails.MakeID
inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
where FuelTypes.FuelTypeName = N'GAS'
)R1

select Makes.Make, count(*) as numOfVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
group by Makes.make
order by numOfVehicles desc;

select Makes.Make, count(*) as numOfVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
group by Makes.make
having count(*) > 20000
order by numOfVehicles desc;

select Makes.Make
from Makes
where Makes.Make like 'B%';

select Makes.Make
from Makes
where Makes.Make like '%W';

select distinct Makes.Make, DriveTypes.DriveTypeName
from DriveTypes
inner join VehicleDetails
on DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
inner join Makes 
on Makes.MakeID = VehicleDetails.MakeID
where DriveTypes.DriveTypeName = 'FWD';

select count(*) as MakeWithFWD
from (
	select distinct Makes.Make
	from DriveTypes
	inner join VehicleDetails
	on DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
	inner join Makes 
	on Makes.MakeID = VehicleDetails.MakeID
	where DriveTypes.DriveTypeName = 'FWD'
)R1;

select Makes.Make, DriveTypes.DriveTypeName, count(*) as Total
from VehicleDetails inner join DriveTypes
on VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID
inner join Makes
on Makes.MakeID = VehicleDetails.MakeID
group by Makes.Make, DriveTypes.DriveTypeName
order by Makes.Make asc , Total desc;

select Makes.Make, DriveTypes.DriveTypeName, count(*) as Total
from VehicleDetails inner join DriveTypes
on VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID
inner join Makes
on Makes.MakeID = VehicleDetails.MakeID
group by Makes.Make, DriveTypes.DriveTypeName
having count(*) > 10000
order by Makes.Make asc , Total desc;

select * from VehicleDetails
where NumDoors is null;

select count(*) as totalVehiclesWithNoSpecifiedDoors
from VehicleDetails
where NumDoors is null;

select (
	cast((select count(*) as totalVehiclesWithNoSpecifiedDoors
	from VehicleDetails
	where NumDoors is null) as float)
	/
	cast((select count(*) as totalVehicles
	from VehicleDetails) as float)
) as PercOfNoSpecifiedDoors;

select distinct Makes.MakeID, Makes.Make, SubModels.SubModelName
from SubModels inner join VehicleDetails
on SubModels.SubModelID = VehicleDetails.SubModelID
inner join Makes
on Makes.MakeID = VehicleDetails.MakeID
where subModels.SubModelName = 'Elite';

select * from VehicleDetails
where Engine_Liter_Display > 3 and NumDoors = 2;

select Makes.Make, VehicleDetails.*
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
where (VehicleDetails.Engine like '%OHV%' and VehicleDetails.Engine_Cylinders = 4);