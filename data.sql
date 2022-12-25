set search_path to ticketchema;


INSERT INTO Owner(telephone, name) VALUES
	('437', 'Corporation of Massey Hall and Roy Thomson Hall'),
	('233', 'Maple Leaf Sports & Entertainment'),
	('123', 'University of Toronto');

INSERT INTO Venue (v_id, owner_telephone, name, city, street) VALUES
	(1, '437', 'Massey Hall', 'Toronto', '178 Victoria Street'),
	(2, '437', 'Roy Thomson Hall', 'Toronto', '60 Simcoe St'),
	(3, '233', 'ScotiaBank Arena', 'Toronto', '40 Bay St');




INSERT INTO Section (sec_id, v_id, name) VALUES
	(1, 1, 'floor'),
	(2, 1, 'balcony'),
	(3, 2, 'main hall'),
	(4, 3, '100'),
	(5, 3, '200'),
	(6, 3, '300');



INSERT INTO Seat (seat_id,sec_id,identifier, accessible ) VALUES
	(1, 1, 'A1', true),
	(2, 1, 'A2', true),
	(3, 1, 'A3', true),
	(4, 1, 'A4', false),
	(5, 1, 'A5', false),
	(6, 1, 'A6', false),
	(7, 1, 'A7', false),
	(8, 1, 'A8', true),
	(9, 1, 'A9', true),
	(10, 1, 'A10', true),
	(11, 1, 'B1', false),
	(12, 1, 'B2', false),
	(13, 1, 'B3', false),
	(14, 1, 'B4', false),
	(15, 1, 'B5', false),
	(16, 1, 'B6', false),
	(17, 1, 'B7', false),
	(18, 1, 'B8', false),
	(19, 1, 'B9', false),
	(20, 1, 'B10', false),
	(21, 1, 'C1', false),
	(22, 2, 'C2', false),
	(23, 2, 'C3', false),
	(24, 2, 'C4', false),
	(25, 2, 'C5', false),
	(26, 3, 'AA1', false),
	(27, 3, 'AA2', false),
	(28, 3, 'AA3', false),
	(29, 3, 'BB1', false),
	(30, 3, 'BB2', false),
	(31, 3, 'BB3', false),
	(32, 3, 'BB4', false),
	(33, 3, 'BB5', false),
	(34, 3, 'BB6', false),
	(35, 3, 'BB7', false),
	(36, 3, 'BB8', false),
	(37, 3, 'CC1', false),
	(38, 3, 'CC2', false),
	(39, 3, 'CC3', false),
	(40, 3, 'CC4', false),
	(41, 3, 'CC5', false),
	(42, 3, 'CC6', false),
	(43, 3, 'CC7', false),
	(44, 3, 'CC8', false),
	(45, 3, 'CC9', false),
	(46, 3, 'C10', false),
	(47, 4, 'row 1, seat 1' , true),
	(48, 4, 'row 1, seat 2' , true),
	(49, 4, 'row 1, seat 3' , true),
	(50, 4, 'row 1, seat 4' , true),
	(51, 4, 'row 1, seat 5' , true),
	(52, 4, 'row 2, seat 1' , true),
	(53, 4, 'row 2, seat 2' , true),
	(54, 4, 'row 2, seat 3' , true),
	(55, 4, 'row 2, seat 4' , true),
	(56, 4, 'row 2, seat 5' , true),
	(57, 5, 'row 1, seat 1' , false),
	(58, 5, 'row 1, seat 2' , false),
	(59, 5, 'row 1, seat 3' , false),
	(60, 5, 'row 1, seat 4' , false),
	(61, 5, 'row 1, seat 5' , false),
	(62, 5, 'row 2, seat 1' , false),
	(63, 5, 'row 2, seat 2' , false),
	(64, 5, 'row 2, seat 3' , false),
	(65, 5, 'row 2, seat 4' , false),
	(66, 5, 'row 2, seat 5' , false),
	(67, 6, 'row 1, seat 1' , false),
	(68, 6, 'row 1, seat 2' , false),
	(69, 6, 'row 1, seat 3' , false),
	(70, 6, 'row 1, seat 4' , false),
	(71, 6, 'row 1, seat 5' , false),
	(72, 6, 'row 2, seat 1' , false),
	(73, 6, 'row 2, seat 2' , false),
	(74, 6, 'row 2, seat 3' , false),
	(75, 6, 'row 2, seat 4' , false),
	(76, 6, 'row 2, seat 5' , false);
	


INSERT INTO Concert (c_id, v_id, name, datetime) VALUES
	(1, 1, 'Ron Sexsmith', '2022-12-03 19:30'),
	(2, 1, 'Women''s Blues Review', '2022-11-25 20:00'),
	(3, 3, 'Mariah Carey - Merry Christmas', '2022-12-9 20:00'),
	(4, 3, 'Mariah Carey - Merry Christmas', '2022-12-11 20:00'),
	(5, 2, 'TSO - Elf in Concert', '2022-12-09 19:30'),
	(6, 2, 'TSO - Elf in Concert', '2022-12-10 14:30'),
	(7, 2, 'TSO - Elf in Concert', '2022-12-10 19:30');
	

INSERT INTO Price( price_id, c_id, sec_id,  num) VALUES
	(1, 1, 1, 130),
	(2, 1, 2, 99),
	(3, 2, 1, 150),
	(4, 2, 2, 125),
	(5, 3, 4, 986),
	(6, 3, 5, 244),
	(7, 3, 6, 176),
	(8, 4, 4, 936),
	(9, 4, 5, 194),
	(10, 4, 6, 126),
	(11, 5, 3, 159),
	(12, 6, 3, 159),
	(13, 7, 3, 159);

INSERT INTO UserAccount(username, name) VALUES	
	('ahightower', 'Alicent Hightower'),
	('d_targaryen', 'Daemon Targaryen'),
	('cristonc', 'Criston Cole'),
	('me', 'Leo');
	




INSERT INTO Ticket(t_id,username, seat_id, price_id, purchase_time ) VALUES
	(1, 'ahightower', 5, 3, '2022-01-09 19:30'),
	(2, 'ahightower', 22, 4, '2022-01-09 19:30'),
	(3, 'd_targaryen', 13, 1, '2022-01-09 19:30'),
	(4, 'd_targaryen', 35, 13, '2022-01-09 19:30'),
	(5, 'cristonc', 49, 5, '2022-01-09 19:30'),
	(6, 'cristonc', 64, 9, '2022-01-09 19:30'),
	(7, 'cristonc', 54, 9, '2022-01-09 19:30');










