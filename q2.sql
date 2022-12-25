SET SEARCH_PATH TO ticketchema;

-- record owner that has at least 1 venue
DROP VIEW IF EXISTS Ownership CASCADE;
create view Ownership as 
select Owner.telephone, Owner.name, count(Owner.telephone) as number
from Owner join Venue on Owner.telephone = Venue.owner_telephone
group by Owner.telephone, Owner.name;

-- record owner that has no venue
DROP VIEW IF EXISTS NotOwn CASCADE;
create view NotOwn as 
select Owner.telephone, Owner.name, 0 as number
from Owner
where Owner.telephone not in (select Ownership.telephone from Ownership);

-- result of how many venues they own.
(select * from Ownership) union (select * from NotOwn);