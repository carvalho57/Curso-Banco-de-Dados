CREATE DATABASE exemplo;

USE exemplo;

CREATE TABLE CLIENTE(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF VARCHAR(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES(NULL,'JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          (NULL,'CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);
				

-- PROJEÇÃO, JUNÇÃO e SELEÇÃO

SELECT NOME,EMAIL FROM CLIENTE
WHERE SEXO = 'M';

SELECT * FROM CLIENTE WHERE EMAIL IS NULL;

-- UPDATE

SELECT * FROM CLIENTE WHERE NOME = 'JORGE';

UPDATE CLIENTE
SET EMAIL = 'JorgeAragao@outlook.com'
WHERE NOME ='JORGE';

-- DELETE
SELECT * FROM CLIENTE WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE;
 
SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'ANA';

