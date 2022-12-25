SET SEARCH_PATH TO ticketchema;

-- report ticket info of user bought tickets
DROP VIEW IF EXISTS HasTicket CASCADE;
create view HasTicket as
select UserAccount.username, UserAccount.name, 
count(UserAccount.username) as ticket_count
from UserAccount natural join Ticket
group by username
order by count(UserAccount.username);

-- report ticket info of user not bought tickets
DROP VIEW IF EXISTS NoTicket CASCADE;
create view NoTicket as
select UserAccount.username, UserAccount.name, 0 as ticket_count
from UserAccount
where UserAccount.username not in 
(select HasTicket.username from HasTicket);

-- Ticket info report of all users
DROP VIEW IF EXISTS TicketInfo CASCADE;
create view TicketInfo  as
(select * from HasTicket) union (select * from NoTicket);

-- result of username of the person who has purchased the most tickets
select * from TicketInfo
where ticket_count = (select max(ticket_count) from TicketInfo);