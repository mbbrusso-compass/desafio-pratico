ALTER TABLE transactions
	ADD COLUMN id INT AUTO_INCREMENT NOT NULL FIRST, -- Criar ID único incremental para cada transação
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (id),
	MODIFY COLUMN step INT NULL,
	MODIFY COLUMN age VARCHAR(3) NULL,
	MODIFY COLUMN gender VARCHAR(1) NULL,
	MODIFY COLUMN amount DECIMAL(6,2) NULL,
	ADD COLUMN monthOf DECIMAL(2,0) NULL, -- Criar coluna mês
	ADD COLUMN yearOf DECIMAL(4,0) NULL DEFAULT 2023, -- Criar coluna ano
	ADD COLUMN dateOf DATE; -- Criar coluna data

UPDATE transactions -- Transformar coluna Age em inteiro
	SET age = NULL WHERE age = "U";
ALTER TABLE transactions
	MODIFY COLUMN age INT NULL;

UPDATE transactions -- Deixar coluna Gender apenas com M e F
	SET gender = NULL WHERE gender NOT IN ("M", "F");

UPDATE transactions -- Deixar NULL onde coluna Amount for zero
	SET amount = NULL WHERE amount = 0;

UPDATE transactions -- Dados coluna mês
	SET monthOf = ceil(step/30);
UPDATE transactions
	SET monthOf = 1 WHERE step = 0;

UPDATE transactions -- Dados coluna data
	SET dateOf = STR_TO_DATE(CONCAT(yearOf, " ", monthOf, " ", "01"), "%Y %c %d");
