CREATE TABLE analytic.customers (
	id VARCHAR(20) NOT NULL PRIMARY KEY,
	zipcode VARCHAR(8) NULL,
	age INT NULL,
	gender VARCHAR(1) NULL);
  
INSERT INTO analytic.customers (id, zipcode, age, gender) SELECT
	customer,
	zipcodeOri,
	age,
	gender
FROM mateus_db.transactions GROUP BY customer, zipcodeOri, age, gender;