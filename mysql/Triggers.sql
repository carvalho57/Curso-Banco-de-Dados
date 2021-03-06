
/* TRIGGER*/
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

            QUALQUER COMANDO SQL

END -> FIM


CREATE DATABASE TRIGGERS;
USE TRIGGERS;

CREATE TABLE USUARIO (
    IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30),
    SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDUSUARIO INT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER*/
DELIMITER $

CREATE TRIGGER BACKUP_USE
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN

    INSERT INTO BKP_USUARIO(IDUSUARIO,NOME,LOGIN)VALUES(OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
END
$
DELIMITER ;

INSERT INTO USUARIO VALUES(NULL,'GABRIEL','CARVALHO57','KFJAFA$AKLDJ21DA');
INSERT INTO USUARIO VALUES(NULL,'GUILHERME','GUI2402','L6214EQWD214WFDR24@##@!');

SELECT * FROM USUARIO;

DELETE FROM USUARIO WHERE IDUSUARIO = 2;

SELECT * FROM BKP_USUARIO;


/* COMUNICAÇÂO ENTRE BANCOS */
CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO
    VALUES(NULL, "TABLET 10 P", 542.88);
INSERT INTO PRODUTO
    VALUES(NULL, "SAMSUNG SM-T280", 942.61);
INSERT INTO PRODUTO
    VALUES(NULL, "TECLADO MECANICO", 242.52);
INSERT INTO PRODUTO
    VALUES(NULL, "MONITOR 30 P", 1500.00);

CREATE DATABASE BACKUP;
USE BACKUP;

CREATE TABLE BKP_PRODUTO(
    IDBKP INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

USE LOJA;

STATUS;

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000, 'test', 0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

/*EM QUE BANCO ESTOU*/
STATUS;

DELIMITER $
CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO 
        BACKUP.BKP_PRODUTO
    VALUES
        (NULL, NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'RASPBERRY PI 3',300);
INSERT INTO PRODUTO VALUES(NULL,'ARDUINO',200);
INSERT INTO PRODUTO VALUES(NULL,'HDD',330);

SELECT * FROM BACKUP.BKP_PRODUTO;

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_PRODUTO;
DROP TRIGGER BACKUP_PRODUTO_DEL;

/*TRIGGER DELETE */
DELIMITER $
CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO 
        BACKUP.BKP_PRODUTO
    VALUES
        (NULL, OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,'D');
END
$


/*TRIGGER INSERT*/
CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO 
        BACKUP.BKP_PRODUTO
    VALUES
        (NULL, NEW.IDPRODUTO,NEW.NOME,NEW.VALOR,'I');
END
$

DELIMITER ;

SELECT * FROM PRODUTO;
DELETE FROM PRODUTO WHERE IDPRODUTO IN(10,11);

SELECT * FROM BACKUP.BKP_PRODUTO;

/* TRIGGER DE AUDITORIA */
DROP DATABASE LOJA;
DROP DATABASE BACKUP;

CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO
    VALUES(NULL, "TABLET 10 P", 542.88);
INSERT INTO PRODUTO
    VALUES(NULL, "SAMSUNG SM-T280", 942.61);
INSERT INTO PRODUTO
    VALUES(NULL, "TECLADO MECANICO", 242.52);
INSERT INTO PRODUTO
    VALUES(NULL, "MONITOR 30 P", 1500.00);


SELECT NOW();
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;
USE BACKUP;

CREATE TABLE BKP_PRODUTO(    
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30),
    VALOR_ORIGINAL FLOAT(10,2),
    VALOR_ALTERADO FLOAT(10,2),
    DATE DATETIME,
    USUARIO VARCHAR(30),
    EVENTO CHAR(1)
);

USE LOJA;

DELIMITER $

CREATE TRIGGER NOME
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN 

    INSERT INTO BACKUP.BKP_PRODUTO
    VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR, NEW.VALOR,NOW(),CURRENT_USER(),'U');
END
$

DELIMITER ;

SELECT * FROM PRODUTO;

UPDATE PRODUTO
SET VALOR = 1345.42
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;
SELECT * FROM BACKUP.BKP_PRODUTO;
