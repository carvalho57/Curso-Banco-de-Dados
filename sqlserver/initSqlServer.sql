/*
DELIMITER GO
*/

CREATE DATABASE aula_inicial;
GO
USE aula_inicial;
GO
CREATE TABLE Cliente(
    ClienteID INT PRIMARY KEY,
    Nome    VARCHAR(30)    
);
GO
INSERT INTO Cliente(ClienteID,Nome) VALUES(1,"Gabriel");
INSERT INTO Cliente(ClienteID,Nome) VALUES(2,"Guilherme");
INSERT INTO Cliente(ClienteID,Nome) VALUES(3,"Diego");
INSERT INTO Cliente(ClienteID,Nome) VALUES(4,"Tiago");
GO
SELECT ClienteID, Nome FROM Cliente;
GO
DELETE FROM Cliente WHERE ClienteID = 3;
GO
UPDATE Cliente SET Nome = "Guilherme Carvalho" WHERE ClienteID = 2;
GO

/*Projeção, Seleção e Junção (Join)*/
SELECT ClienteID,Nome /*Projeção*/
FROM Cliente /*Origem*/
WHERE ClienteID = 1; /*Seleção*/