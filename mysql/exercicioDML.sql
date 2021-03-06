CREATE DATABASE exercicioDML;

USE exercicioDML;

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

/* EXERCICIOS DML */
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');
INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');
INSERT INTO CLIENTE VALUES(NULL,'ALINE','F','ALINE@OUTLOOK.COM','10468795960');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',7);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',8);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',14);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',15);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA ROCINHA','CENTRO','LITEROI','RJ',20);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',2);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',2);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',2);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',4);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',5);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',6);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',7);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',8);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',9);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',9);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',10);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',10);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',11);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',13);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',15);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',15);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',16);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',18);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',18);

--RELATORIO GERAL DE TODOS OS CLIENTES

SELECT  C.NOME,C.SEXO,C.EMAIL,C.CPF,
        E.BAIRRO,E.ESTADO,E.CIDADE,
        T.NUMERO, T.TIPO 
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    LEFT JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE;

/*RELATORIO DE HOMENS */

SELECT  C.IDCLIENTE, C.NOME,C.SEXO,C.EMAIL,C.CPF,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO,
        T.NUMERO, 
        T.TIPO 
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'M';

/*Atualizando Cliente*/
--6,10,11,12,16,17
SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (6,10,11,12,16,17);

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 6 OR IDCLIENTE = 10 OR IDCLIENTE = 11 OR IDCLIENTE = 12 OR IDCLIENTE = 16 OR IDCLIENTE = 17;

--OR
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (6,10,11,12,16,17);

/*RELATORIO DE MULHERES */

SELECT  C.NOME,
        C.SEXO,
        C.EMAIL,
        C.CPF,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO,
        T.NUMERO, 
        T.TIPO 
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F';

/*QUANTIDADE DE HOMENS E MULHERES */

SELECT SEXO, COUNT(*) AS  'QUANTIDADE'
FROM CLIENTE
GROUP BY SEXO;

/*IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO
TENHAM CELULAR*/

SELECT C.IDCLIENTE, C.EMAIL, E.BAIRRO, E.ESTADO, T.NUMERO, T.TIPO
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE (E.BAIRRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO') 
AND SEXO = 'F' 
AND TIPO IN ('RES','COM');

+-----------+-------------------+--------+--------+----------+------+
| IDCLIENTE | EMAIL             | BAIRRO | ESTADO | NUMERO   | TIPO |
+-----------+-------------------+--------+--------+----------+------+
|         3 | ANA@IG.COM        | CENTRO | RJ     | 88687979 | COM  |
|        11 | DANIELE@GMAIL.COM | CENTRO | RJ     | 56576876 | RES  |
+-----------+-------------------+--------+--------+----------+------+
-- DANIELE NÃO PODERIA ESTAR NESSA SET PORQUE ELA TEM CEL

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR --projeção
FROM CLIENTE C  --origem
    INNER JOIN ENDERECO E --junção
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'RJ' AND T.TIPO = 'CEL'; --selecão 

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
SELECT C.NOME, C.EMAIL, T.NUMERO
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'SP' AND C.SEXO = 'F';