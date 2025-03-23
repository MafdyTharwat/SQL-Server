select * from VehicleDetails;

select * from VehicleMasterDetails;

select * from VehicleDetails
where Year between 1950 and 2000;

select count(*) as NumberOfVehicles from VehicleDetails
where Year between 1950 and 2000;

select Makes.Make, count(*) as numOfVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
order by numOfVehicles desc;

select Makes.Make, count(*) as numOfVehicles
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
having count(*) > 12000
order by numOfVehicles desc;

select * from 
(
	select Makes.Make, count(*) as numOfVehicles
	from VehicleDetails inner join Makes
	on VehicleDetails.MakeID = Makes.MakeID
	where (VehicleDetails.Year between 1950 and 2000)       -- Equivalent to above
	group by Makes.Make
)R1
where numOfVehicles > 12000;