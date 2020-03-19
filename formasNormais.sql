/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

CREATE DATABASE forma;
USE forma;

/* PRIMEIRA FORMA NORMAL */

/*

1 - TODO CAMPO VETORIZADO SE TORNAR'A OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNAR'A OUTRA TABELA.
QUANDO O CAMPO FOR DIVIS'IVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO.
ISSO ;E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.


*/

/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/



CREATE TABLE CLIENTE(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF VARCHAR(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);


/*
    VIRA

        |
        v
*/
CREATE DATABASE COMERCIO;

USE COMERCIO;

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

/*
ENDERECO - OBRIGATORIIO
CADASTRO DE SOMENTE UM

TELEFONE - NÃO OBRIGATÓRIO
CADASTRO DE MAIS DE UM (OPCIONAL)*/

/*
    EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA
    EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICA SEMPRE NA CARDINALIDADE N
*/

INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF) 
    VALUES ('Gabriel Carvalho','M','gabrielfeocarvalho57@gmail.com','10468795960');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('JOÃO','M','joao@hotmail.com','96954235126');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('CARLOS','M','carlos@hotmail.com','32345635126');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('ANA','F','ana@hotmail.com','65312436875');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('CLARA','F',NULL,'32152536245');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('JORGE','M','jorge@gmail.com','95361423524');
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF)
    VALUES('CELIA','F','celia@hotmail.com','12436215111');

+-----------+------------------+------+--------------------------------+-------------+
| IDCLIENTE | NOME             | SEXO | EMAIL                          | CPF         |
+-----------+------------------+------+--------------------------------+-------------+
|         1 | Gabriel Carvalho | M    | gabrielfeocarvalho57@gmail.com | 10468795960 |
|         2 | JOÃO             | M    | joao@hotmail.com               | 96954235126 |
|         3 | CARLOS           | M    | carlos@hotmail.com             | 32345635126 |
|         4 | ANA              | F    | ana@hotmail.com                | 65312436875 |
|         5 | CLARA            | F    | NULL                           | 32152536245 |
|         6 | JORGE            | M    | jorge@gmail.com                | 95361423524 |
|         7 | CELIA            | F    | celia@hotmail.com              | 12436215111 |
+-----------+------------------+------+--------------------------------+-------------+

INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA ANTONIO DE SÁ','CENTRO','BELO HORIZONTE','MG',5);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA JÕAO ANTONIO DE LARA','CENTRO','ALMIRANTE TAMANDARÉ','PR',4);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',3);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA PRESIDENTE VARGAS','JARDINS','SÃO PAULO','SP',2);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA ALFANDEGA','LAPA','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA DO OUVIDOR','ESTACIO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA ANITA GARIBALDE','AHÚ','CURITIBA','PR',7);

-- TENTE INSERIR MAIS DE UM ENDEREÇO PARA UM CLIENTE
INSERT INTO ENDERECO(RUA, BAIRRO,CIDADE,ESTADO, ID_CLIENTE)
    VALUES('RUA ANITA GARIBALDE','BARREIRINHA','CURITIBA','PR',7);
-- ERROR 1062 (23000): Duplicate entry '7' for key 'ENDERECO.ID_CLIENTE'
-- clausula UNIQUE impede a entrada de mais de um endereço por cliente
+------------+---------------------------+---------+----------------------+--------+------------+
| IDENDERECO | RUA                       | BAIRRO  | CIDADE               | ESTADO | ID_CLIENTE |
+------------+---------------------------+---------+----------------------+--------+------------+
|          1 | RUA ANTONIO DE SÁ         | CENTRO  | BELO HORIZONTE       | MG     |          5 |
|          2 | RUA JÕAO ANTONIO DE LARA  | CENTRO  | ALMIRANTE TAMANDARÉ  | PR     |          4 |
|          3 | RUA CAPITAO HERMES        | CENTRO  | RIO DE JANEIRO       | RJ     |          3 |
|          4 | RUA PRESIDENTE VARGAS     | JARDINS | SÃO PAULO            | SP     |          2 |
|          5 | RUA ALFANDEGA             | LAPA    | RIO DE JANEIRO       | RJ     |          1 |
|          6 | RUA DO OUVIDOR            | ESTACIO | RIO DE JANEIRO       | RJ     |          6 |
|          7 | RUA ANITA GARIBALDE       | AHÚ     | CURITIBA             | PR     |          7 |
+------------+---------------------------+---------+----------------------+--------+------------+

DESC TELEFONE;

INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','996948069',1);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'RES','35851532',1);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','94986564',5);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','95643515',4);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'RES','36987845',4);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'RES','36352450',3);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'COM','90013001',3);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','84156739',2);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','84545625',6);
INSERT INTO TELEFONE(IDTELEFONE, TIPO,NUMERO,ID_CLIENTE) VALUES(NULL,'CEL','86845132',6);


/* SELECAO, PROJECAO E JUNCAO*/
/*PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA*/

SELECT NOW() AS  DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/*SELECAO  -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE 
REGISTRO DE UMA TABELA
- A CLAUSULA DE SELECAO É O WHERE
*/

SELECT NOME,SEXO, EMAIL /*PROJECAO*/
FROM CLIENTE    /*ORIGEM*/
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO
FROM TELEFONE
WHERE TIPO = 'CEL';

/*JUNCAO -> */

+------------------+--------------------------------+-----------++------------+---------+
| NOME             | EMAIL                          | IDCLIENTE || ID_CLIENTE | BAIRRO  |
+------------------+--------------------------------+-----------++------------+---------+
| Gabriel Carvalho | gabrielfeocarvalho@gmail.com   |         1 ||          5 | CENTRO  |
| JOÃO             | joao@hotmail.com               |         2 ||          4 | CENTRO  |
| CARLOS           | carlos@hotmail.com             |         3 ||          3 | CENTRO  |
| ANA              | ana@hotmail.com                |         4 ||          2 | JARDINS |
| CLARA            | NULL                           |         5 ||          1 | LAPA    |
| JORGE            | jorge@gmail.com                |         6 ||          6 | ESTACIO |
| CELIA            | celia@hotmail.com              |         7 ||          7 | AHÚ     |
+------------------+--------------------------------+-----------++------------+---------+


/*NOME, SEXO, BAIRRO, CIDADE*/

SELECT NOME,SEXO, BAIRRO, CIDADE
FROM CLIENTE 
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE;

SELECT NOME,SEXO, BAIRRO, CIDADE /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
    INNER JOIN ENDERECO  /*JUNCAO*/
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';/*SELECAO*/

/*NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO*/
-- PONTEIRAMENTO AJUDA NA PERFORMANCE DO BANCO
SELECT 
    C.NOME,
    C.SEXO,
    E.BAIRRO,
    E.CIDADE,
    T.TIPO,
    T.NUMERO
FROM CLIENTE C
     INNER JOIN ENDERECO E
     ON C.IDCLIENTE = E.ID_CLIENTE
     INNER JOIN TELEFONE T
     ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT 
    CLIENTE.NOME,
    CLIENTE.SEXO,
    ENDERECO.BAIRRO,
    ENDERECO.CIDADE,
    TELEFONE.TIPO,
    TELEFONE.NUMERO
FROM CLIENTE 
     INNER JOIN ENDERECO 
     ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
     INNER JOIN TELEFONE 
     ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;


/* PRIMEIRA FORMA NORMAL */

/*
 ATOMICIDADE  - UM CAMPO NÃO PODE SER DIVISIVEL
- CAMPOS MULTIVALORADOS OU VETORIZADO
 PK CHAVE PRIMEIRA - UM CAMPO QUE IDENTIFIQUE UM REGISTRO COMO SENDO UNICO

*/

/*SEGUNDA FORMA NORMAL*/

/*
Campos não chaves devem depender da totalidade da chave primaria
*/

/*TERCEIRA FORMA NORMAL*/
/*
    DEPENDENCIA TRANSITIVA
    CAMPOS QUE DEPENDEM DE OUTRO CAMPO VIRA OUTRA TABELA
*/

CREATE DATABASE CONSULTORIO
USE CONSULTORIO;

CREATE TABLE PACIENTE(
    IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(100),
    NASCIMENTO DATE
);

CREATE TABLE MEDICO(
    IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    ESPECIALIDADE VARCHAR(30),
    FUNCIONARIO ENUM('S','N ')
);

CREATE TABLE HOSPITAL(
    IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    BAIRRO VARCHAR(30),
    CIDADE VARCHAR(30),
    ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
    IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PACIENTE INT,
    ID_MEDICO INT,
    ID_HOSPITAL INT,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR(30)
);

CREATE TABLE INTERNACAO(
    IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
    ENTRADA DATETIME,
    QUARTO INT,
    SAIDA DATETIME,
    OBSERVACOES VARCHAR(50),
    ID_CONSULTA INT UNIQUE
);

/*(PK_FK)_TABELA PERTENCENTE_TABELA DE ONDE VEM*/

ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO
ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY (ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);