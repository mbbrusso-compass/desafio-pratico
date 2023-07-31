CREATE TABLE analytic.merchants (
	id VARCHAR(20) NOT NULL PRIMARY KEY,
	zipcode VARCHAR(8) NULL,
	category VARCHAR(45) NULL);
  
INSERT INTO analytic.merchants (id, zipcode, category) SELECT
	merchant,
	zipMerchant,
   	category
FROM mateus_db.transactions GROUP BY merchant, zipMerchant, category;