/*
    DML - DATA MANIPULATION LANGUAGE
    DDL - DATA DEFINITION LANGUAGE
    DQL - DATA QUERY LANGUAGE
    DCL - DATA CONTROL LANGUAGE
    TCL - TRANSACTION CONTROL LANGUAGE
*/
CREATE DATABASE DMLDDL;

USE DMLDDL;

CREATE TABLE CLIENTE(
    IDCLIENTE INTEGER PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);
CREATE TABLE ENDERECO(
    IDENDERECO INTEGER PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INTEGER UNIQUE,
    FOREIGN KEY(ID_CLIENTE) 
    REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(  
    IDTELEFONE INTEGER PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES','COM','CEL') NOT NULL,
    NUMERO VARCHAR(15) NOT NULL,
    ID_CLIENTE INTEGER,
    FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE)
);

/*DML - DATA MANIPULATION LANGUAGE*/
    -- INSERT
    INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'996948069');
    INSERT INTO ENDERECO VALUES(NULL,'JOAQUIM SILVA','ALVORADA','NITEROI','RJ',8);

   

    -- UPDATE
    SELECT IDCLIENTE,NOME,SEXO
    FROM CLIENTE
    WHERE IDCLIENTE = 8;

    UPDATE CLIENTE
    SET SEXO = 'F'
    WHERE IDCLIENTE = 8;

    -- DELETE
    INSERT INTO CLIENTE VALUES(NULL,'XBANAN','F',NULL,'XXXXXXXX');

    SELECT * FROM CLIENTE;

    SELECT * 
    FROM CLIENTE 
    WHERE IDCLIENTE = 9;

    DELETE FROM CLIENTE
    WHERE IDCLIENTE = 9;

/* DDL - DATA DEFINITION LANGUAGEM */
    --CREATE
    CREATE TABLE LIVRO(
        IDLIVRO INT PRIMARY KEY AUTO_INCREMENT,
        NOME VARCHAR(30) NOT NULL,
        PRECO FLOAT(10,2),
        FRETE FLOAT(10,2) NOT NULL
    );
    --ALTER TABLE
        -- CHANGE - ALTERAR NOME
        ALTER TABLE LIVRO
        CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

        DESC LIVRO; 

        +----------------+-------------+------+-----+---------+----------------+
        | Field          | Type        | Null | Key | Default | Extra          |
        +----------------+-------------+------+-----+---------+----------------+
        | IDLIVRO        | int         | NO   | PRI | NULL    | auto_increment |
        | NOME           | varchar(30) | NO   |     | NULL    |                |
        | VALOR_UNITARIO | int         | NO   |     | NULL    |                |
        | FRETE          | float(10,2) | NO   |     | NULL    |                |
        +----------------+-------------+------+-----+---------+----------------+

        -- MODIFY - ALTERAR TIPO
        ALTER TABLE LIVRO
        MODIFY  VALOR_UNITARIO FLOAT(10,2) NOT NULL;

        DESC LIVRO;
        +----------------+-------------+------+-----+---------+----------------+
        | Field          | Type        | Null | Key | Default | Extra          |
        +----------------+-------------+------+-----+---------+----------------+
        | IDLIVRO        | int         | NO   | PRI | NULL    | auto_increment |
        | NOME           | varchar(30) | NO   |     | NULL    |                |
        | VALOR_UNITARIO | float(10,2) | NO   |     | NULL    |                |
        | FRETE          | float(10,2) | NO   |     | NULL    |                |
        +----------------+-------------+------+-----+---------+----------------+

        -- ADICIONANDO COLUNAS
        ALTER TABLE LIVRO
        ADD ISBN VARCHAR(11) NOT NULL;

        DESC LIVRO;
        +----------------+-------------+------+-----+---------+----------------+
        | Field          | Type        | Null | Key | Default | Extra          |
        +----------------+-------------+------+-----+---------+----------------+
        | IDLIVRO        | int         | NO   | PRI | NULL    | auto_increment |
        | NOME           | varchar(30) | NO   |     | NULL    |                |
        | VALOR_UNITARIO | float(10,2) | NO   |     | NULL    |                |
        | FRETE          | float(10,2) | NO   |     | NULL    |                |
        | ISBN           | varchar(11) | NO   |     | NULL    |                |
        +----------------+-------------+------+-----+---------+----------------+

        --REMOVENDO COLUNO
        ALTER TABLE LIVRO
        DROP COLUMN ISBN;
        +----------------+-------------+------+-----+---------+----------------+
        | Field          | Type        | Null | Key | Default | Extra          |
        +----------------+-------------+------+-----+---------+----------------+
        | IDLIVRO        | int         | NO   | PRI | NULL    | auto_increment |
        | NOME           | varchar(30) | NO   |     | NULL    |                |
        | VALOR_UNITARIO | float(10,2) | NO   |     | NULL    |                |
        | FRETE          | float(10,2) | NO   |     | NULL    |                |
        +----------------+-------------+------+-----+---------+----------------+


    -- DROP
    DROP TABLE LIVRO;

/*    DQL - DATA QUERY LANGUAGE*/
    SELECT *
    FROM CLIENTE;
 --FILTROS // Projeção, Junção e Seleção
    SELECT NOME, CPF,CIDADE
    FROM CLIENTE
        INNER JOIN ENDERECO
        ON IDCLIENTE = ID_CLIENTE
    WHERE IDCLIENTE = 8;
/*DCL - DATA CONTROL LANGUAGE*/


/*TCL - TRANSACTION CONTROL LANGUAGE*/

