--Create tables that don't have foreign keys first
--Create movie table
CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(50),
	movie_length NUMERIC(4,2),
	movie_rating VARCHAR(7)
);
--look at empty movie table
SELECT *
FROM movie;

--Create showtime table
CREATE TABLE showtime(
	showtime_id SERIAL PRIMARY KEY,
	showtime_day DATE,
	showtime_time TIME	
);

--Take a look at the empty showtime table
SELECT *
FROM showtime;

--Create Ticket table
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	ticket_price NUMERIC(5,2),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	showtime_id INTEGER NOT NULL,
	FOREIGN KEY(showtime_id) REFERENCES showtime(showtime_id)
)
--Check ticket table
SELECT *
FROM ticket;

--Create consession table
CREATE TABLE consession(
	item_id SERIAL PRIMARY KEY,
	item_size VARCHAR(20),
	item_price NUMERIC(5,2)
)
--view empty ticket table
SELECT *
FROM consession;

--Create employee table
CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	employee_first_name VARCHAR(50),
	employee_last_name VARCHAR(50),
	employee_dob DATE,
	employee_phone VARCHAR(50)
)
--view empty employee table
SELECT *
FROM employee;

--Create customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	customer_first_name VARCHAR(50),
	customer_last_name VARCHAR(50),
	customer_dob DATE
)
--view empty customer table
SELECT *
FROM customer; 

--create transaction table
CREATE TABLE transaction(
	transaction_id SERIAL PRIMARY KEY,
	transaction_payment_type VARCHAR(20),
	transaction_amount NUMERIC(6,2),
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	item_id INTEGER NOT NULL,
	FOREIGN KEY(item_id) REFERENCES consession(item_id),
	employee_id INTEGER NOT NULL,
	FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
)
--view empty transaction table
SELECT *
FROM transaction;

--All my tables have been created! YAY!!!! 
--now lets add data to them

--but first, i should add item_name into the consession table
ALTER TABLE consession
ADD COLUMN item_name VARCHAR(50);
--see what the conession table looks like now
SELECT *
FROM consession;
--looks good so I'll continue

--Add items to consession table
INSERT INTO consession(
	item_size,
	item_price,
	item_name
)VALUES(
	'6oz',
	'5.99',
	'potato chips'
);

INSERT INTO consession(
	item_size,
	item_price,
	item_name
)VALUES(
	'12oz',
	'6.99',
	'fountain drink'
);

INSERT INTO consession(
	item_size,
	item_price,
	item_name
)VALUES(
	'X-Large',
	'10.99',
	'popcorn'
);

--see the three items now in the conession table
SELECT *
FROM consession;

--add items to customer table
INSERT INTO customer(
	customer_first_name,
	customer_last_name,
	customer_dob
)VALUES(
	'Hillary',
	'Turner',
	'1979-01-15'
);

INSERT INTO customer(
	customer_first_name,
	customer_last_name,
	customer_dob
)VALUES(
	'Jesse',
	'Hanes',
	'1980-06-24'
);

INSERT INTO customer(
	customer_first_name,
	customer_last_name,
	customer_dob
)VALUES(
	'Bob',
	'Roberts',
	'1981-11-14'
);

--see these items in the customer table
SELECT *
FROM customer;

--add items to employee table
INSERT INTO employee(
	employee_first_name,
	employee_last_name,
	employee_dob,
	employee_phone
)VALUES(
	'John',
	'Meloncamp',
	'1960-07-25',
	'555-444-1234'	
);

--add items to employee table
INSERT INTO employee(
	employee_first_name,
	employee_last_name,
	employee_dob,
	employee_phone
)VALUES(
	'Adam',
	'Clayton',
	'1962-10-25',
	'555-555-4321'	
);

--add items to employee table
INSERT INTO employee(
	employee_first_name,
	employee_last_name,
	employee_dob,
	employee_phone
)VALUES(
	'Tom',
	'Petty',
	'1955-07-14',
	'444-555-1212'	
);
--see these records in the employee table
SELECT *
FROM employee;

--add items to movie table
INSERT INTO movie(
	movie_title,
	movie_length,
	movie_rating
)VALUES(
	'Jaws',
	'2.35',
	'PG-13'
);
--add items to movie table
INSERT INTO movie(
	movie_title,
	movie_length,
	movie_rating
)VALUES(
	'Friday the 13th',
	'1.55',
	'R'
);
--add items to movie table
INSERT INTO movie(
	movie_title,
	movie_length,
	movie_rating
)VALUES(
	'Forest Gump',
	'3.15',
	'PG-13'
);
--view these three movies in the movie table
SELECT *
FROM movie;

--add items to the showtime table

INSERT INTO showtime(
	showtime_day,
	showtime_time
)VALUES(
	'2021-05-10',
	'11:00:00'
);
INSERT INTO showtime(
	showtime_day,
	showtime_time
)VALUES(
	'2021-05-11',
	'22:30:00'
);
INSERT INTO showtime(
	showtime_day,
	showtime_time
)VALUES(
	'2021-05-12',
	'18:00:00'
);
--look at these items in the movie table
SELECT *
FROM showtime;

--add items to ticket
INSERT INTO ticket(
	ticket_price,
	movie_id,
	showtime_id	
)VALUES(
	'9.99',
	'1',
	'1'
);
INSERT INTO ticket(
	ticket_price,
	movie_id,
	showtime_id	
)VALUES(
	'12.99',
	'2',
	'1'
);
INSERT INTO ticket(
	ticket_price,
	movie_id,
	showtime_id	
)VALUES(
	'7.99',
	'2',
	'2'
);
--look at the ticket table
SELECT *
FROM ticket;

--add items to transaction table
INSERT INTO transaction(
	transaction_payment_type,
	transaction_amount,
	ticket_id,
	item_id,
	employee_id,
	customer_id
)VALUES(
	'Visa',
	'25.00',
	'1',
	'2',
	'1',
	'1'
);

--add items to transaction table
INSERT INTO transaction(
	transaction_payment_type,
	transaction_amount,
	ticket_id,
	item_id,
	employee_id,
	customer_id
)VALUES(
	'Cash',
	'55.00',
	'2',
	'1',
	'1',
	'3'
);

--add items to transaction table
INSERT INTO transaction(
	transaction_payment_type,
	transaction_amount,
	ticket_id,
	item_id,
	employee_id,
	customer_id
)VALUES(
	'Travelers Check',
	'18.00',
	'3',
	'2',
	'3',
	'3'
);

--look at the table
SELECT *
FROM transaction;


-------DONE------GOING TO BED-------GOODNIGHT!------


