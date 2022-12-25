-- Could not:
-- 1.
-- "Every venue has at least 10 seat":
-- Assertion need be enforced within Concert to check if venue is valid.
-- 2.
-- In Ticket, check if seat_id is in the correct section
-- Need to check if Seat table records correct sec_id recorded in Price table
-- It will be a cross table checking that uses Assertion

-- did not:
-- None
  

-- Extra constraints:
-- Each section of concert should only have one price 
-- Each seat in a concert will only be registered once in Ticket


-- Assumption:
-- 1. all strings (name, telephone ...) are limited within 100 characters
-- 2. All concerts set price based on section
-- 3. Rows tables are not required by customer (will cause a lot redundancy)
-- 4. Venue name can be duplicated
-- 5. Venue will appear after it is bought by any Owner (q2.sql)


drop schema if exists ticketchema cascade;
create schema ticketchema;
set search_path to ticketchema;


-- Owner info of the all Venue
CREATE TABLE Owner (
  telephone VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


-- Venue where concerts are booked into
CREATE TABLE Venue (
  v_id INTEGER PRIMARY KEY,
  owner_telephone VARCHAR(100) NOT NULL REFERENCES Owner,
  name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL,
  street VARCHAR(100) NOT NULL
  );


-- Section of Venue
CREATE TABLE Section (
  sec_id INTEGER PRIMARY KEY,
  v_id INTEGER NOT NULL REFERENCES Venue,
  name VARCHAR(100) NOT NULL,
  UNIQUE(v_id, name)
);


-- Seats of Section
CREATE TABLE Seat (
  seat_id INTEGER PRIMARY KEY,
  sec_id INTEGER NOT NULL REFERENCES Section,
  identifier VARCHAR(100) NOT NULL,
  accessible BOOLEAN NOT NULL,
  UNIQUE(sec_id, identifier)
);

-- Concert
CREATE TABLE Concert (
  c_id INTEGER PRIMARY KEY,
  v_id INTEGER NOT NULL REFERENCES Venue,
  name VARCHAR(100) NOT NULL,
  datetime TIMESTAMP NOT NULL,
  UNIQUE(datetime, v_id)
);

-- price
CREATE TABLE Price(
  price_id INTEGER PRIMARY KEY,
  c_id INTEGER NOT NULL REFERENCES Concert,
  sec_id INTEGER NOT NULL REFERENCES Section,
  num INTEGER NOT NULL,
  UNIQUE(c_id, sec_id)
);

-- User
CREATE TABLE UserAccount(
  username VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


-- Ticket
CREATE TABLE Ticket(
  t_id int PRIMARY KEY,
  username VARCHAR(100) NOT NULL REFERENCES UserAccount,
  seat_id INTEGER REFERENCES Seat,
  price_id INTEGER NOT NULL REFERENCES Price,
  purchase_time TIMESTAMP NOT NULL,
  UNIQUE(seat_id, price_id)
);


