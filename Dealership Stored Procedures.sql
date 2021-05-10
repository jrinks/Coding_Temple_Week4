-- Stored Functions and Insert Into statements to insert data into the tables


-- Stored Function to insert new cars into to sale_car table
CREATE OR REPLACE FUNCTION f_add_sale_car (_vin VARCHAR, _make VARCHAR, _model VARCHAR, 
							 _color VARCHAR, _trim VARCHAR, _price NUMERIC)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO sales_car (sale_car_vin,
	sale_car_make ,
	sale_car_model ,
	sale_car_color ,
	sale_car_trim ,
	sale_car_price )
	VALUES (_vin, _make, _model, _color, _trim, _price);
END;
$MAIN$
LANGUAGE plpgsql;

-- call function to add record to sales_car
SELECT f_add_sale_car('54d8s6b112e6w7f51','Ford', 'F-150', 'Candy Red', 'X', 59999.99 );

-- Verify that new car entry has been added to sales_car
SELECT *
FROM sales_car;
-- add more cars to the sales_car table
SELECT f_add_sale_car('ds4e894tl4h6h46d9','Nissam', 'Fontier', 'Forest Green', 'ES-9', 49250.00);
SELECT f_add_sale_car('d489w4l561u971x58','Toyota', 'Tacoma', 'Sea Blue', 'ZR-7', 39999.95);
SELECT f_add_sale_car('l4j984y45489we711','Chevy', 'Volt', 'Sunburst Yellow', '250-s', 55999.00);
SELECT f_add_sale_car('48a4df138wk8794f1','Subaru', 'Outback', 'Slate Grey', 'ST-M', 45123.45);
				   

-- Stored Function to insert data into mechanic table
CREATE OR REPLACE FUNCTION f_add_mechanic (_firstname VARCHAR, _last_name VARCHAR, _hourly_rate NUMERIC)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO mechanic (mechanic_first_name, mechanic_last_name, 	mechanic_hourly_rate)
	VALUES (_firstname, _last_name, _hourly_rate);
END;
$MAIN$
LANGUAGE plpgsql;
-- call 
SELECT f_add_mechanic('Bart', 'Simpson', 25.50);
SELECT f_add_mechanic('Lisa', 'Simpson', 55.00);
SELECT f_add_mechanic('Homer', 'Simpson', 15.25);
SELECT f_add_mechanic('Bobby', 'Hill', 25.00);
SELECT f_add_mechanic('Bojack', 'Horseman', 75.00);

-- Verify t
SELECT *
FROM mechanic;

-- Stored Function to insert data into customer table
CREATE OR REPLACE FUNCTION f_add_customer (	_first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _email VARCHAR,
	_phone VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO customer (customer_first_name, customer_last_name, customer_address, customer_email, customer_phone)
	VALUES (_first_name, _last_name, _address, _email, _phone);
END;
$MAIN$
LANGUAGE plpgsql;
-- call 
SELECT f_add_customer('Axel', 'Rose', '123 Rockaway Blvd','theaxe@secretemail.com', '555-555-1234');
SELECT f_add_customer('Justin', 'Bieber', '55 Dufus Street', 'therealbeiber@gmail.com', '555-123-8008');
SELECT f_add_customer('Britney', 'Spears', 'Las Vagas Strip', 'bribaby@hotmail.com', '123-456-7899' );
SELECT f_add_customer('Bruce', 'The Boss', '128 Mansion Street', 'bruuuuuuuuuce@bruce.com', '202-555-1234' );
SELECT f_add_customer('Cardi', 'B', 'Sned my mail to the nail salon', 'CardiB4Eva@gmail.com', '415-555-9876');
-- Verify 
SELECT *
FROM customer;

--Stored function to add to service_car table
CREATE OR REPLACE FUNCTION f_add_service_car (_customer_id INTEGER, _vin VARCHAR, _make VARCHAR, _model VARCHAR, 
							 _color VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO service_car  (customer_id, service_car_vin,
	service_car_make ,
	service_car_model ,
	service_car_color)
	VALUES (_customer_id, _vin, _make, _model, _color);
END;
$MAIN$
LANGUAGE plpgsql;
--Call
SELECT f_add_service_car(1, '46g5k4u6ds46b654w', 'Chevy', 'Bronco', 'White');
SELECT f_add_service_car(2, '36gad5k485321dbas', 'Honda', 'Civic', 'Red');
SELECT f_add_service_car(3, 'khk8l9ui4kl6u84lk', 'Ford', 'Mustang', 'red');
SELECT f_add_service_car(4, 'pwo8l9ui4kl6u84lk', 'Ford', 'Fusion', 'green');
SELECT f_add_service_car(5, '4898l9ui4kl6u84lk', 'Nissan', 'Stanza', 'red');
--Verify
SELECT *
FROM service_car;

--use insert statements to add data to service_ticket table
INSERT INTO service_ticket(
	service_car_id,
	service_date)
	VALUES(1, '05-02-21');
INSERT INTO service_ticket(
	service_car_id,
	service_date)
	VALUES(2, '03-22-21');
INSERT INTO service_ticket(
	service_car_id,
	service_date)
	VALUES(3, '01-12-21');
	INSERT INTO service_ticket(
	service_car_id,
	service_date)
	VALUES(4, '03-05-21');
	INSERT INTO service_ticket(
	service_car_id,
	service_date)
	VALUES(5, '04-12-21');
SELECT *
FROM service_ticket;

--use insert statements to add data to service table

INSERT INTO service(
	service_ticket_id,
	service_name,
	service_price)
VALUES(1, 'oil change', 99.99);
INSERT INTO service(
	service_ticket_id,
	service_name,
	service_price)
VALUES(2, 'rotate tires', 400.00);
INSERT INTO service(
	service_ticket_id,
	service_name,
	service_price)
VALUES(3, 'break mantenance', 600);
--Verify
SELECT *
FROM service;
	

--use insert statements to add data to part table
INSERT INTO part(service_ticket_id, part_name, part_price)
VALUES(5, 'thingymabob', 800.00);
--use insert statements to add data to part table
INSERT INTO part(service_ticket_id, part_name, part_price)
VALUES(6, 'dukiky', 400.00);
	 
SELECT *
FROM part;



--use insert statements to add data to the labor table
INSERT INTO labor(service_ticket_id, mechanic_id, hours_worked)
VALUES(5, 2, 10);
INSERT INTO labor(service_ticket_id, mechanic_id, hours_worked)
VALUES(6, 3, 6);	 
SELECT *
FROM labor;

--Woops, I mispelled the table name when I created it, lets fix it. 
ALTER TABLE sales_invlice
  RENAME TO sales_invoice;


--use insert statements to add data to the salesperson table
INSERT INTO salesperson (salesperson_first_name, salesperson_last_name, salesperson_email, 
			salesperson_phone, salesperson_commission)
		VALUES('Jerry', 'Springer', 'jsprings@hotmail.com', '312-555-1234', 15.25);
INSERT INTO salesperson (salesperson_first_name, salesperson_last_name, salesperson_email, 
			salesperson_phone, salesperson_commission)
VALUES('Oprah', 'Winfrey', 'bestlifegoals@o.com', '415-123-1234', 30.55);
INSERT INTO salesperson (salesperson_first_name, salesperson_last_name, salesperson_email, 
			salesperson_phone, salesperson_commission)
VALUES('Jenny', 'Jones', 'woops@aol.com', '555-555-9874', 25.00);
		
SELECT *
FROM salesperson;

--use insert statements to add data to the sales_invoice
INSERT INTO sales_invoice(customer_id, salesperson_id)
VALUES(1, 2);
INSERT INTO sales_invoice(customer_id, salesperson_id)
VALUES(2, 3);

SELECT *
FROM sales_invoice;

