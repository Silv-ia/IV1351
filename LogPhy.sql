CREATE TABLE allowed_rentals (
 allowed_rentals_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 max_allowed_rentals INT
);

ALTER TABLE allowed_rentals ADD CONSTRAINT PK_allowed_rentals PRIMARY KEY (allowed_rentals_id);


CREATE TABLE contact_details (
 contact_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(100),
 phone_number VARCHAR(20)
);

ALTER TABLE contact_details ADD CONSTRAINT PK_contact_details PRIMARY KEY (contact_id);


CREATE TABLE contact_person (
 contact_person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 contact_id INT NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);


CREATE TABLE instrument_cost (
 cost_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lease_fee INT NOT NULL
);

ALTER TABLE instrument_cost ADD CONSTRAINT PK_instrument_cost PRIMARY KEY (cost_id);


CREATE TABLE lesson_price_scheme (
 lesson_cost_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 lesson_level VARCHAR(100) NOT NULL,
 student_cost INT NOT NULL,
 instructor_payment INT NOT NULL,
 discount INT NOT NULL,
 is_valid BOOLEAN
);

ALTER TABLE lesson_price_scheme ADD CONSTRAINT PK_lesson_price_scheme PRIMARY KEY (lesson_cost_id);


CREATE TABLE personal_details (
 personal_number INT NOT NULL,
 address VARCHAR(100),
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 contact_id INT NOT NULL
);

ALTER TABLE personal_details ADD CONSTRAINT PK_personal_details PRIMARY KEY (personal_number);


CREATE TABLE rental_instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_name VARCHAR(100) NOT NULL,
 instrument_type VARCHAR(100) NOT NULL,
 instrument_brand VARCHAR(200) NOT NULL,
 cost_id INT NOT NULL
);

ALTER TABLE rental_instrument ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (instrument_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 contact_person_id INT,
 personal_number INT NOT NULL,
 allowed_rentals_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 personal_number INT NOT NULL,
 can_teach_ensemble BOOLEAN
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument (
 instrument_name VARCHAR(100) NOT NULL,
 instructor_id INT NOT NULL,
 level_taught VARCHAR(50) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_name,instructor_id);


CREATE TABLE lease (
 lease_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lease_start_date DATE NOT NULL,
 lease_end_date DATE NOT NULL,
 instrument_id INT,
 student_id INT,
 is_active BOOLEAN
);

ALTER TABLE lease ADD CONSTRAINT PK_lease PRIMARY KEY (lease_id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_student_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_student_id);


CREATE TABLE time_slot (
 timeslot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 start_time TIME(6) NOT NULL,
 end_time TIME(6) NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (timeslot_id);


CREATE TABLE individual_lesson (
 individual_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_cost_id INT NOT NULL,
 lesson_level VARCHAR(100) NOT NULL,
 timeslot_id INT
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);


CREATE TABLE group_lesson (
 individual_lesson_id INT NOT NULL,
 min_attendees INT NOT NULL,
 max_attendees INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (individual_lesson_id);


CREATE TABLE booking (
 individual_lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 eligible_for_discount BOOLEAN,
 instrument_name VARCHAR(100) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (individual_lesson_id,student_id);


CREATE TABLE ensemble (
 individual_lesson_id INT NOT NULL,
 genre VARCHAR(100) NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (individual_lesson_id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (contact_id) REFERENCES contact_details (contact_id);


ALTER TABLE personal_details ADD CONSTRAINT FK_personal_details_0 FOREIGN KEY (contact_id) REFERENCES contact_details (contact_id);


ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_0 FOREIGN KEY (cost_id) REFERENCES instrument_cost (cost_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (personal_number) REFERENCES personal_details (personal_number);
ALTER TABLE student ADD CONSTRAINT FK_student_2 FOREIGN KEY (allowed_rentals_id) REFERENCES allowed_rentals (allowed_rentals_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (personal_number) REFERENCES personal_details (personal_number);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE lease ADD CONSTRAINT FK_lease_0 FOREIGN KEY (instrument_id) REFERENCES rental_instrument (instrument_id);
ALTER TABLE lease ADD CONSTRAINT FK_lease_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_student_id) REFERENCES student (student_id);


ALTER TABLE time_slot ADD CONSTRAINT FK_time_slot_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_cost_id) REFERENCES lesson_price_scheme (lesson_cost_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (timeslot_id) REFERENCES time_slot (timeslot_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (individual_lesson_id) REFERENCES group_lesson (individual_lesson_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_2 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_3 FOREIGN KEY (instrument_name,instructor_id) REFERENCES instrument (instrument_name,instructor_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (individual_lesson_id) REFERENCES group_lesson (individual_lesson_id);


