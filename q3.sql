SET SEARCH_PATH TO ticketchema;

-- get capacity of seats of all venues
DROP VIEW IF EXISTS NumSeat CASCADE;
create view NumSeat as
select Venue.v_id, count(Venue.v_id) as total
from Venue, Section, Seat
where Venue.v_id = Section.v_id and Section.sec_id = Seat.sec_id
group by Venue.v_id; 

-- venues which has at least 1 accessible seat
DROP VIEW IF EXISTS HaveAccess CASCADE;
create view HaveAccess as
select Venue.v_id as venue_id, Venue.name as venue_name, 
concat(count(Venue.v_id)/total::float * 100, '%') as percent_accessible
from Venue, Section, Seat,NumSeat
where Venue.v_id = Section.v_id and Section.sec_id = Seat.sec_id 
and Venue.v_id = NumSeat.v_id 
and Seat.accessible = true
group by Venue.v_id, total; 

-- venues which has no accessible seat
DROP VIEW IF EXISTS NoAccess CASCADE;
create view NoAccess as
select Venue.v_id as venue_id, Venue.name as venue_name,  
'0%' as percent_accessible
from Venue
where Venue.v_id not in (select HaveAccess.venue_id from HaveAccess);

-- result of percentage of seats that are accessible.
select * from 
((select * from HaveAccess) union (select * from NoAccess)) as a
order by a.venue_id;