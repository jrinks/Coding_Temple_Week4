CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	mechanic_first_name VARCHAR(50),
	mechanic_last_name VARCHAR(50),
	mechanic_hourly_rate NUMERIC(5,2)	
);
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	customer_first_name VARCHAR(50),
	customer_last_name VARCHAR(50),
	customer_address VARCHAR(100),
	customer_email VARCHAR(50),
	customer_phone VARCHAR(15)
);
CREATE TABLE service_car(
	service_car_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	service_car_vin VARCHAR(17),
	service_car_make VARCHAR(20),
	service_car_model VARCHAR(20),
	service_car_color VARCHAR(20)
);
CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	service_car_id INTEGER NULL,
	FOREIGN KEY(service_car_id) REFERENCES service_car(service_car_id),
	service_date DATE
);
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id),
	service_name VARCHAR(50),
	service_price NUMERIC(6,2)
);
CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id),
	part_name VARCHAR(20),
	part_price NUMERIC(6,2)
);
CREATE TABLE labor(
	labor_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
	hours_worked NUMERIC(5,2)
);
CREATE TABLE sales_car(
	sale_car_id SERIAL PRIMARY KEY,
	sale_car_vin VARCHAR(17),
	sale_car_make VARCHAR(20),
	sale_car_model VARCHAR(20),
	sale_car_color VARCHAR(20),
	sale_car_trim VARCHAR(20),
	sale_car_price NUMERIC(8,2)
);
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	salesperson_first_name VARCHAR(50),
	salesperson_last_name VARCHAR(50),
	salesperson_email VARCHAR(50),
	salesperson_phone VARCHAR(15),
	salesperson_commission NUMERIC(7,2)
);
CREATE TABLE sales_invlice(
	sales_invoice_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);
