create database Airport
use Airport

select count(Flight.FID) as '20020' from Flight   join Flight_Passenger
on Flight.FID=Flight_Passenger.FID
where Flight_Passenger.FID=6


select Flight.StandPiont ,count(Flight_Passenger.FID) from Flight join Flight_Passenger
on Flight.FID=Flight_Passenger.FID
group by Flight.StandPiont


select Passengers.F_Name from Passengers 
order by F_name desc


select Passengers.F_Name from Passengers where F_name like '%a'


select  Passengers.F_Name, Passengers.Address from Passengers join Flight_Passenger
on Passengers.PID =Flight_Passenger.PID
join Flight
on Flight.FID =Flight_Passenger.FID
where Passengers.Address ='Tripoli' and Flight.StandPiont ='jorden'

select Passengers.F_Name,Passengers.Gender,Passengers.PassbortNO,Flight.FID,Flight.FlightNo,Flight.StandPiont,.Flight.Flight_Date from Passengers join Flight_Passenger
on Passengers.PID=Flight_Passenger.PID
join Flight
on Flight.FID =Flight_Passenger.FID
where Flight.Plane = 'Pln20'


select Passengers.F_Name,Passengers.Gender,Passengers.PassbortNO,Flight.FID,Flight.FlightNo,Flight.StandPiont,.Flight.Flight_Date from Passengers join Flight_Passenger
on Passengers.PID=Flight_Passenger.PID
join Flight
on Flight.FID =Flight_Passenger.FID
where PassbortNO = '256879541'


update Flight_Passenger
set TicketCost =TicketCost+(TicketCost*0.10)
select *from Flight_Passenger

CREATE VIEW top 3 FROM Passengers JOIN Flight_Passenger
ON passengers.PID = Flight_Passenger.PID
GROUP BY passengers.PID HAVING COUNT(passengers.PID) >= 2;