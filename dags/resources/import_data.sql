LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Data/mateus_db/source.csv" INTO TABLE mateus_db.transactions
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY "'"
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
