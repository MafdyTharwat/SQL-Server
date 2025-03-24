
select Makes.Make, count(*) as numOfVehicles, (select count(*) from VehicleDetails) as TotalVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
order by numOfVehicles desc;

select * , cast(numOfVehicles as float)/cast(TotalVehicles as float) as Perc from 
(
	select Makes.Make, count(*) as numOfVehicles, (select count(*) from VehicleDetails) as TotalVehicles
	from VehicleDetails inner join Makes
	on VehicleDetails.MakeID = Makes.MakeID
	where (VehicleDetails.Year between 1950 and 2000)       -- Equivalent to above
	group by Makes.Make
)R1
order by numOfVehicles desc

select Makes.Make, FuelTypes.FuelTypeName, count(*) as numOfVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeId 
inner join FuelTypes
on FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
group by Makes.Make, FuelTypes.FuelTypeName
order by Makes.Make;

select VehicleDetails.*, FuelTypes.FuelTypeName 
from VehicleDetails inner join FuelTypes
on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
where FuelTypes.FuelTypeName = N'GAS';

select distinct Makes.Make,FuelTypes.FuelTypeName 
from FuelTypes inner join VehicleDetails
on FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
inner join Makes
on Makes.MakeID = VehicleDetails.MakeID
where FuelTypeName = N'GAS'
order by Makes.Make ASC;