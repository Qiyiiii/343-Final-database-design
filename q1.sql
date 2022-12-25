
SET SEARCH_PATH TO ticketchema;


-- get all concerts' tickets sold value
DROP VIEW IF EXISTS TicketVal CASCADE;
create view TicketVal as 
select Price.c_id, sum(num) as ticket_val
from Ticket natural join Price
group by Price.c_id;

-- get capacity of seats of all venues
DROP VIEW IF EXISTS NumSeat CASCADE;
create view NumSeat as
select Venue.v_id, count(Venue.v_id) as total
from Venue, Section, Seat
where Venue.v_id = Section.v_id and Section.sec_id = Seat.sec_id
group by Venue.v_id; 

-- percentage of seats sold for concerts with at least 1 viewer
DROP VIEW IF EXISTS SeatPercent1 CASCADE;
create view SeatPercent1 as
select Concert.c_id,
concat(round((count(Concert.c_id)/total::float) * 100), '%') as percent_taken
from Ticket, Price, Concert, Section, Venue,NumSeat                                                       
where Venue.v_id = NumSeat.v_id and  Section.v_id =Venue.v_id 
and  Price.sec_id = Section.sec_id and Concert.c_id = Price.c_id 
and  Ticket.price_id = Price.price_id
group by Concert.c_id, total;

-- percentage of seats sold for concerts with no viewer
DROP VIEW IF EXISTS SeatPercent2 CASCADE;
create view SeatPercent2 as 
select Concert.c_id, '0%' as percent_taken
from Concert
where Concert.c_id not in (select SeatPercent1.c_id from SeatPercent1);

-- union together two possible concert situation
DROP VIEW IF EXISTS SeatPercent CASCADE;
create view SeatPercent as 
(select * from SeatPercent1) union (select * from SeatPercent2);

-- result of total value of all tickets sold 
-- and the percentage of the venue that was sold.
select Concert.name as concert_name, 
Concert.datetime, COALESCE( TicketVal.ticket_val, 0 ) as ticket_val, 
SeatPercent.percent_taken as seat_rate
from TicketVal natural right join SeatPercent natural join Concert
order by Concert.c_id;