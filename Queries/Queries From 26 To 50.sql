select Bodies.BodyName, VehicleDetails.* from VehicleDetails
inner join Bodies
on VehicleDetails.BodyID = Bodies.BodyID
where Bodies.BodyName = 'Sport Utility' and VehicleDetails.Year > 2020;

select Bodies.BodyName, VehicleDetails.* from VehicleDetails
inner join Bodies
on VehicleDetails.BodyID = Bodies.BodyID
Where Bodies.BodyName in ('Coupe','Hatchback','Sedan');

select Bodies.BodyName, VehicleDetails.* from VehicleDetails
inner join Bodies
on VehicleDetails.BodyID = Bodies.BodyID
Where (Bodies.BodyName in ('Coupe','Hatchback','Sedan')) and (VehicleDetails.Year in (2008, 2020, 2021));

select found=1 
where exists(
        select top 1 * from VehicleDetails where Year = 1950
      );

select Vehicle_Display_Name, NumDoors,
case
	when NumDoors = 0 then 'Zero doors'
	when NumDoors = 1 then 'One door'
	when NumDoors = 2 then 'Two doors'
	when NumDoors = 3 then 'Three doors'
	when NumDoors = 4 then 'Four doors'
	when NumDoors = 5 then 'Five doors'
	when NumDoors = 6 then 'Six doors'
	when NumDoors = 8 then 'Eight doors'
	when NumDoors is null then 'Not set'
	else 'Unknown'
end as DoorDescription
from VehicleDetails;
	

select vehicleDetails.Vehicle_Display_Name, vehicleDetails.year, year(getdate()) - vehicleDetails.year as Age
from VehicleDetails
order by Age desc;

select * from 
(
	select vehicleDetails.Vehicle_Display_Name, vehicleDetails.year, year(getdate()) - vehicleDetails.year as Age
	from VehicleDetails
) R1
where Age between 15 and 25;

select min(vehicleDetails.Engine_CC) as MinimumEngine, max(vehicleDetails.Engine_CC) as MaximumEngine, avg(vehicleDetails.Engine_CC) as AverageEngine
from VehicleDetails;

select * from VehicleDetails
where VehicleDetails.Engine_CC = (select min(VehicleDetails.Engine_CC) from VehicleDetails);

select * from VehicleDetails
where VehicleDetails.Engine_CC = (select max(VehicleDetails.Engine_CC) from VehicleDetails);

select * from VehicleDetails
where VehicleDetails.Engine_CC < (select avg(VehicleDetails.Engine_CC) from VehicleDetails);

select count(*) from
(
	select * from VehicleDetails
	where VehicleDetails.Engine_CC > (select avg(VehicleDetails.Engine_CC) from VehicleDetails)
)R1

select distinct Engine_CC from VehicleDetails
order by Engine_CC desc;

select distinct top 3 Engine_CC from vehicleDetails
order by Engine_CC desc;

select Vehicle_Display_Name from VehicleDetails
where Engine_CC in (
	select distinct top 3 Engine_CC from vehicleDetails
	order by Engine_CC desc
	);

select distinct Makes.Make from Makes
inner join vehicleDetails 
on VehicleDetails.MakeID = Makes.MakeID
where VehicleDetails.Engine_CC in (
	select distinct top 3 Engine_CC from vehicleDetails
	order by Engine_CC desc
	)
order by Makes.Make asc;

select Engine_CC,
case
	when Engine_CC between 0 and 1000 then 100
	when Engine_CC between 1001 and 2000 then 200
	when Engine_CC between 2001 and 4000 then 300
	when Engine_CC between 4001 and 6000 then 400
	when Engine_CC between 6001 and 8000 then 500
	when Engine_CC > 8000 then 600
	else 0
end as Tax
from (
	select distinct Engine_CC from vehicleDetails
	) R1
order by Engine_CC;

select Makes.Make, sum(VehicleDetails.NumDoors) as TotalNumOfDoors
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
group by Makes.Make
order by TotalNumOfDoors;

select Makes.Make, sum(VehicleDetails.NumDoors) as TotalNumOfDoors
from VehicleDetails inner join Makes
on VehicleDetails.MakeID = Makes.MakeID
group by Makes.Make
having Makes.Make = 'Ford';

select Makes.Make, count(*) as NumOfModels
from MakeModels inner join Makes
on MakeModels.MakeID = Makes.MakeID
group by Makes.Make
order by NumOfModels desc;

select top 3 Makes.Make, count(*) as NumOfModels
from MakeModels inner join Makes
on MakeModels.MakeID = Makes.MakeID
group by Makes.Make
order by NumOfModels desc;

select max(NumOfModels) as MaximumNumOfModels
from (
	select Makes.Make, count(*) as NumOfModels
	from MakeModels inner join Makes
	on MakeModels.MakeID = Makes.MakeID
	group by Makes.Make
)R1


select Makes.Make, count(*) as NumOfModels
from MakeModels inner join Makes
on MakeModels.MakeID = Makes.MakeID
group by Makes.Make
having count(*) = ( 
	select Max(NumberOfModels) as MaxNumberOfModels
	from(
		select MakeID, count(*) as NumberOfModels
		from MakeModels
	    group by MakeID
		) R1
	)

select Makes.Make, count(*) as NumOfModels
from MakeModels inner join Makes
on MakeModels.MakeID = Makes.MakeID
group by Makes.Make
having count(*) = ( 
	select min(NumberOfModels) as MaxNumberOfModels
	from(
		select MakeID, count(*) as NumberOfModels
		from MakeModels
	    group by MakeID
		) R1
	)

select * from FuelTypes
order by newID();