-- 50 in total: 15 students, 2*2 siblings, 2*3 siblings = 25 students, 19 contact persons, 6 instructors

INSERT INTO public.allowed_rentals(
	max_allowed_rentals)
	VALUES (2);

INSERT INTO public.contact_details(
	email, phone_number)
	VALUES  ('posuere.at.velit@aol.couk','0845 46 48'),
  ('urna.nec@outlook.org','070 3374 9818'),
  ('accumsan.interdum.libero@google.com','(016977) 3865'),
  ('nulla.ante.iaculis@yahoo.com','0800 1111'),
  ('lorem@protonmail.ca','(026) 8820 9885'),
  ('vestibulum.lorem@hotmail.org','0800 1111'),
  ('nulla@outlook.org','0800 085404'),
  ('ipsum.sodales@protonmail.ca','0800 557581'),
  ('donec@yahoo.net','(016977) 4471'),
  ('egestas.hendrerit@yahoo.ca','0800 862 7921'),
  ('senectus.et@google.org','(01682) 353895'),
  ('consectetuer.euismod@yahoo.edu','0989 837 3442'),
  ('eget.magna.suspendisse@aol.ca','0886 717 3777'),
  ('tincidunt.orci.quis@protonmail.edu','(016977) 5347'),
  ('vitae@outlook.couk','0974 472 8275'),
  ('lobortis.tellus@hotmail.ca','076 2823 1864'),
  ('suscipit.est@icloud.com','070 8864 1926'),
  ('cras@yahoo.couk','(012773) 15914'),
  ('donec.dignissim.magna@hotmail.com','056 6626 2718'),
  ('at.nisi@protonmail.edu','0800 688357'),
  ('iaculis.aliquet@outlook.com','0985 481 8237'),
  ('fusce.aliquet@hotmail.edu','0844 751 4375'),
  ('augue.malesuada.malesuada@yahoo.net','076 8523 6302'),
  ('sed.congue@icloud.org','07264 257214'),
  ('fames.ac.turpis@google.com','(011485) 46611'),
  ('lectus.cum@icloud.edu','0356 521 3010'),
  ('aliquam.auctor@protonmail.org','0800 1111'),
  ('id@yahoo.couk','0500 032278'),
  ('ipsum.leo@outlook.ca','055 0534 5177'),
  ('dui.fusce@yahoo.org','0845 46 47'),
  ('mollis@aol.couk','(014137) 32450'),
  ('id.ante@icloud.edu','(01205) 837886'),
  ('elit.dictum.eu@aol.com','(01938) 96841'),
  ('donec.consectetuer@google.edu','0914 242 7357'),
  ('mauris.sagittis@aol.couk','(01398) 94443'),
  ('primis.in@outlook.ca','(01660) 69508'),
  ('phasellus.elit@google.edu','0845 46 43'),
  ('dolor.vitae.dolor@hotmail.org','076 2586 7495'),
  ('vestibulum.mauris.magna@aol.edu','(014539) 08728'),
  ('commodo.tincidunt.nibh@aol.org','076 4276 9897'),
  ('eu@outlook.couk','(01786) 56343'),
  ('pharetra.sed@google.ca','07888 620178'),
  ('tincidunt.nibh.phasellus@yahoo.com','076 3443 4534'),
  ('a.mi.fringilla@icloud.org','055 2431 2355'),
  ('non.massa@aol.ca','0800 1111'),
  ('dictum.eleifend.nunc@google.ca','055 5805 1830'),
  ('porta.elit@yahoo.couk','0800 931 1485'),
  ('nulla.eget.metus@outlook.net','(0110) 186 3851'),
  ('at.velit.pellentesque@aol.edu','0800 566 9861'),
  ('quisque@icloud.com','0930 894 8652');


-- 1-19 are contact persons. find alternative way to insert the range contact_id (random nrs and not 1-50).
INSERT INTO public.contact_person(
	contact_id, first_name, last_name)
	VALUES (1,'Drake','Wall'),
	  (2,'Lesley','Mcneil'),
	  (3,'Wesley','Glass'),
	  (4,'Fay','Haney'),
	  (5,'Juliet','Harmon'),
	  (6,'August','Gilbert'),
	  (7,'Noelle','Blevins'),
	  (8,'Maya','Irwin'),
	  (9,'Travis','Sampson'),
	  (10,'Craig','Banks'),
	  (11,'Stephen','Mccray'),
	  (12,'Deborah','Solis'),
	  (13,'Jessica','Nicholson'),
	  (14,'Meghan','Hudson'),
	  (15,'Raphael','Roman'),
	  (16,'Shea','Bradford'),
	  (17,'Camden','Peck'),
	  (18,'Palmer','Gilmore'),
	  (19,'Kiona','Lee');


-- 20-44 are students. 45-50 are instr.
INSERT INTO public.personal_details(
	personal_number, address, first_name, last_name, contact_id)
	VALUES ('197010042325','Ap #980-1625 Erat Rd.','Carlos','Watkins',20),
  ('197110061466','Ap #916-4170 Curabitur Rd.','Maile','Welch',21),
  ('200108242487','Ap #147-9841 Molestie. Rd.','Zachary','Sutton',22),
  ('200708283884','P.O. Box 822, 7961 Et, Av.','Cathleen','Vang',23),
  ('198810058484','3317 Magnis Ave','Hector','Mckay',24),
  ('195212033441','Ap #976-5601 Diam Av.','Valentine','Albert',25),
  ('196011071994','233-6373 Nunc, Street','Angelica','Sanford',26),
  ('200202194221','915-3984 Elit, St.','Erin','Glass',27),
  ('196910067944','710 Sapien. Street','Dennis','Hickman',28),
  ('200508155747','P.O. Box 984, 9804 Tristique Rd.','Lani','Sanders',29),
  ('197603078974','568-5451 Sit Avenue','Regan','Oneal',30),
  ('195111094423','181-8894 Dui, Rd.','Kenneth','Nixon',31),
  ('198510034545','Ap #445-9379 Id Ave','Zahir','Ingram',32),
  ('195307086785','Ap #156-5092 Ligula. St.','Chester','Walton',33),
  ('200108118541','409-2318 Velit Av.','Carly','Harper',34),
  ('200601134203','Ap #813-760 Phasellus St.','Yen','Holden',35),
  ('196309065332','759-286 Eu Av.','Victoria','Suarez',36),
  ('194811041325','519-8369 Aliquam Rd.','Darius','Hardy',37),
  ('197511050211','979-7679 Tellus. St.','Bryar','Mathis',38),
  ('192212051376','Ap #177-7754 Vitae Street','Porter','Sanford',39),
  ('190111082853','Ap #916-3814 Vitae Av.','Carson','Hammond',40),
  ('197208035613','5108 Phasellus Av.','Ella','Weiss',41),
  ('200807243167','9969 Faucibus Rd.','Rafael','Fernandez',42),
  ('200507166374','3219 Arcu. St.','Leandra','Solis',43),
  ('200005294678','Ap #622-329 Nunc. Ave','Beau','Burnett',44),
  ('196512046641','850-7821 A Ave','Basil','Durham',45),
  ('193111088766','8115 Cras St.','Rama','Frazier',46),
  ('196812043231','716-7545 Et Av.','Channing','Stone',47),
  ('196300025044','Ap #542-2455 Eget Rd.','Kylan','Beck',48),
  ('190612014960','Ap #863-7501 Sit Avenue','Moses','Clarke',49),
  ('191612035423','952-7191 Nullam Av.','Demetria','Battle',50);


-- personal numbers were copied, next time try SELECT or pg_dump. contact persons were mapped according to siblings.
INSERT INTO public.student(
	contact_person_id, personal_number, allowed_rentals_id)
	VALUES (1,197010042325,'1'),
  (2,197110061466,'1'),
  (3,200108242487,'1'),
  (4,200708283884,'1'),
  (5,198810058484,'1'),
  (6,195212033441,'1'),
  (7,196011071994,'1'),
  (8,200202194221,'1'),
  (9,196910067944,'1'),
  (10,200508155747,'1'),
  (11,197603078974,'1'),
  (12,195111094423,'1'),
  (13,198510034545,'1'),
  (14,195307086785,'1'),
  (15,200108118541,'1'),
  (16,200601134203,'1'),
  (17,196309065332,'1'),
  (18,194811041325,'1'),
  (19,197511050211,'1'),
  (1,192212051376,'1'),
  (2,190111082853,'1'),
  (3,197208035613,'1'),
  (3,200807243167,'1'),
  (4,200507166374,'1'),
  (4,200005294678,'1');


INSERT INTO public.instructor(
	personal_number, can_teach_ensemble)
	VALUES (196512046641,'True'),
  (193111088766,'True'),
  (196812043231,'True'),
  (196300025044,'True'),
  (190612014960,'False'),
  (191612035423,'True');


-- sibling: student_id 51-75. 
INSERT INTO public.sibling(
	student_id, sibling_student_id)
	VALUES (51,70),
	(70,51),
	(52,71),
	(71,52),
	(53,72),
	(53,73),
	(72,53),
	(72,73),
	(73,53),
	(73,72),
	(54,74),
	(54,75),
	(74,54),
	(74,75),
	(75,54),
	(75,74);

-- instructor_id 1-6
INSERT INTO public.instrument(
	instrument_name, instructor_id, level_taught)
	VALUES ('trombone',3,'advanced'),
  ('clarinet',2,'beginner'),
  ('accordion',2,'intermediate'),
  ('guitar',4,'beginner'),
  ('ukulele',4,'intermediate'),
  ('bongo',1,'intermediate'),
  ('violin',1,'advanced'),
  ('bass guitar',3,'intermediate'),
  ('flute',2,'advanced'),
  ('violin',6,'intermediate'),
  ('bongo',5,'advanced'),
  ('tuba',5,'intermediate'),
  ('saxophone',6,'intermediate'),
  ('xylophone',5,'beginner'),
  ('bass guitar',1,'advanced'),
  ('cello',5,'intermediate'),
  ('bass guitar',2,'intermediate'),
  ('xylophone',2,'advanced'),
  ('cymbal',4,'intermediate'),
  ('viola',4,'beginner'),
  ('bongo',6,'advanced'),
  ('maracas',5,'beginner'),
  ('bass guitar',5,'intermediate'),
  ('saxophone',3,'intermediate'),
  ('clarinet',6,'intermediate'),
  ('violin',3,'beginner'),
  ('harmonica',3,'advanced'),
  ('mandolin',4,'intermediate'),
  ('oboe',1,'intermediate'),
  ('clarinet',5,'intermediate');

INSERT INTO public.lesson_price_scheme(
	lesson_type, lesson_level, student_cost, instructor_payment, discount, is_valid)
	VALUES ('individual','beginner',400,193,49,'true'),
  ('ensemble','beginner',274,161,8,'true'),
  ('group','intermediate',266,168,2,'true'),
  ('group','advanced',276,232,24,'false'),
  ('ensemble','intermediate',487,132,36,'true'),
  ('group','beginner',107,286,4,'true'),
  ('individual','intermediate',157,85,68,'true'),
  ('ensemble','advanced',322,239,9,'false'),
  ('individual','advanced',299,69,12,'false');




INSERT INTO public.time_slot(
	instructor_id, start_time, end_time, date)
	VALUES (1,'12:27 PM','3:00 PM','Feb 27, 2023'),
  (1,'8:30 AM','9:19 AM','Jan 6, 2023'),
  (2,'3:53 PM','7:52 PM','Jan 27, 2023'),
  (4,'10:56 AM','2:14 AM','Jan 4, 2023'),
  (6,'5:09 PM','11:56 PM','Jun 23, 2023'),
  (3,'10:18 AM','12:27 PM','May 15, 2023'),
  (6,'5:52 AM','9:55 AM','Jan 9, 2023'),
  (6,'12:08 PM','6:45 AM','Jan 17, 2024'),
  (2,'12:30 PM','4:05 PM','Sep 4, 2024'),
  (3,'7:03 AM','6:27 AM','Sep 5, 2024'),
  (4,'1:24 PM','7:24 PM','Mar 15, 2024'),
  (3,'3:55 PM','4:50 AM','Apr 28, 2024'),
  (5,'11:29 AM','12:39 AM','Jan 14, 2024'),
  (1,'8:46 PM','3:53 PM','Nov 28, 2022'),
  (2,'4:45 PM','7:49 PM','Apr 29, 2024'),
  (1,'4:20 PM','8:15 PM','Jun 4, 2023'),
  (2,'6:49 PM','1:35 PM','Nov 4, 2023'),
  (5,'8:47 PM','3:04 PM','Sep 27, 2024'),
  (1,'6:26 AM','3:20 AM','Feb 19, 2023'),
  (4,'4:55 PM','4:23 AM','Sep 2, 2024');



INSERT INTO public.individual_lesson(
	lesson_cost_id, lesson_level, timeslot_id)
	VALUES (8,'intermediate',1),
  (1,'intermediate',17),
  (7,'intermediate',16),
  (9,'advanced',2),
  (8,'intermediate',3),
  (2,'beginner',7),
  (2,'advanced',12),
  (6,'beginner',3),
  (6,'advanced',4),
  (9,'intermediate',5),
  (9,'advanced',10),
  (7,'intermediate',14),
  (3,'intermediate',19),
  (4,'advanced',19),
  (2,'intermediate',13),
  (7,'advanced',11),
  (1,'advanced',7),
  (7,'beginner',4),
  (7,'intermediate',17),
  (2,'intermediate',17);



INSERT INTO public.group_lesson(
	individual_lesson_id, min_attendees, max_attendees)
	VALUES (8,4,8),
  (10,2,9),
  (20,5,10),
  (19,4,10),
  (1,3,8);


INSERT INTO public.ensemble(
	individual_lesson_id, genre)
	VALUES (8,'r and b'),
  (10,'classical'),
  (20,'rock');


INSERT INTO public.booking(
	individual_lesson_id, student_id, eligible_for_discount, instrument_name, instructor_id)
	VALUES (1,58,'true','clarinet',2),
  (8,61,'true','trombone',3),
  (1,62,'true','tuba',5),
  (20,51,'true','tuba',5),
  (10,67,'true','harmonica',3),
  (8,63,'true','violin',6),
  (10,52,'true','saxophone',3),
  (20,62,'false','mandolin',4);



INSERT INTO public.instrument_cost(
	lease_fee)
	VALUES (279),
  (442),
  (354),
  (59),
  (423),
  (298),
  (148),
  (167),
  (422),
  (291),
  (298),
  (277),
  (284),
  (245),
  (306),
  (298),
  (144),
  (262),
  (140),
  (456);
