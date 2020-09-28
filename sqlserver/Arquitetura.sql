/*
    ARQUITETURA

O que é?
E como os arquivos que compoem esse banco se comportam

MDF (MASTER DATA FILE)
    * Armazena dados  
    * Sempre vai dentro do groupo PRIMARY  
LDF (LOG DATA FILE)
    * Armazena os log


TRANSAÇÕES SÃO GRAVADAS NO LDF
E CASO EU FAÇO UM COMMIT O DADO É GRAVADO NO MDF
CASHO FAÇA ROOLBACK ELE É ELIMINADO DO LDF E NÃO VAI 
PARA O MDF

MASTER - Banco principal do sistema, armazena informações dos bancos de dados criados (nome,dono, tabelas)
MODEL  - Banco de modelo para outros bancos.
MSDB   - Serviços de agendamento.
TEMPDB - Banco temporário (Reseta quando é fechado a instância)


1 - CRIAR O BANCO COM ARQUIVOS PARA O SETORES DE MKT E RH
2 - CRIAR UM ARQUIVO GERAL
3 - DEIXAR O MDF APENAS COMO DICIONARIO DE DADOS
4 - CRIAR 2 GRUPOS DE ARQUIVOS
*/

USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'EMPRESA'
) 
CREATE DATABASE EMPRESA;
GO
USE EMPRESA;
GO
CREATE TABLE TB_MKT
(
    ID INT PRIMARY KEY, 
    Nome VARCHAR(50) NOT NULL
);
GO
CREATE TABLE TB_VENDAS
(
    ID INT PRIMARY KEY, 
    Nome VARCHAR(50) NOT NULL
);
GO
INSERT INTO TB_MKT
    (ID, Nome)
VALUES
    (1,'Nome MKT'),
    (2,'Nome MKT2'),
    (3,'Nome MKT3')
GO
SELECT COUNT(*) AS MKT FROM TB_MKT;
GO
SELECT * FROM TB_MKT;