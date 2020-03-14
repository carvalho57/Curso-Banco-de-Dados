/*  Requisitos

    Carros entram para realizar serviços e os seus respectivos donos.
    Cada cliente possui apenas um carro
    Carro possui uma marca
    Cores dos carros para ter idéia de qual tinta comprar
    Carro pode ter mais de uma cor
    Necessita armazenar telefones dos clientes
    mas não são obrigatórios;

    Inicio da Modelagem

    Cliente -> Carro
    Cliente -> Telefone
    Carro ->  Marca
    Carro ->  mais de uma cor
    
*/


CREATE DATABASE sistemaSeuJose;
USE sistemaSeuJOSE;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(35) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    EMAIL VARCHAR(100) UNIQUE,
    SEXO CHAR(1)
);

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    NUMERO VARCHAR(11) NOT NULL,
    ID_CLIENTE INT
);

CREATE TABLE CARRO(
    IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
    MODELO VARCHAR(30),
    ANO DATE,    
    ID_CLIENTE INT UNIQUE
);

CREATE TABLE MARCA(
    IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    ID_CARRO INT
);

CREATE TABLE COR(
    IDCOR INT PRIMARY KEY AUTO_INCREMENT,
    COR VARCHAR(30) NOT NULL,
    ID_CARRO INT 
);


ALTER TABLE TELEFONE
ADD FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CARRO
ADD FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE COR
ADD FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE MARCA
ADD FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);