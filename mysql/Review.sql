CREATE DATABASE Review;
USE Review;
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(35) NOT NULL
);

CREATE TABLE GrupoAluno( 
    Aluno_ID INT,
    Grupo_ID INT    
);

CREATE TABLE Grupo(
    GrupoID INT PRIMARY KEY AUTO_INCREMENT,
    Disciplina VARCHAR(30) NOT NULL,
    QuantidadeIntegrantes INT(4) 
);


CREATE TABLE EntregaTrabalho (
    EntregaTrabalho INT PRIMARY KEY AUTO_INCREMENT,        
    Grupo_ID INT,
    Trabalho_ID INT,
    Nota FLOAT(3,2),
    Entregue TINYINT(1)
);

CREATE TABLE Trabalho(
    TrabalhoID INT PRIMARY KEY AUTO_INCREMENT,
    Disciplina VARCHAR(30) NOT NULL,
    Descricao TEXT NOT NULL
);

ALTER TABLE GrupoAluno
ADD CONSTRAINT FK_GrupoAluno_Aluno
FOREIGN KEY(Aluno_ID) REFERENCES Aluno(AlunoID);

ALTER TABLE GrupoAluno
ADD CONSTRAINT FK_GrupoAluno_Grupo
FOREIGN KEY(Grupo_ID) REFERENCES Grupo(GrupoID);

ALTER TABLE EntregaTrabalho
ADD CONSTRAINT FK_EntregaTrabalho_Trabalho
FOREIGN KEY (Trabalho_ID) REFERENCES Trabalho(TrabalhoID);

ALTER TABLE EntregaTrabalho
ADD CONSTRAINT FK_EntregaTrabalho_Groupo
FOREIGN KEY (Grupo_ID) REFERENCES Grupo(GrupoID);

ALTER TABLE GrupoAluno
ADD CONSTRAINT PK_GrupoAluno
PRIMARY KEY(Grupo_ID,Aluno_ID);

DELIMITER $
CREATE PROCEDURE INSERTALUNO(P_Nome VARCHAR(35))
BEGIN
    INSERT INTO Aluno (Nome) VALUES(P_Nome);
END
$

CREATE TRIGGER UpdateQuantidadeIntegrantesGrupo
BEFORE INSERT ON GrupoAluno
FOR EACH ROW
BEGIN
    UPDATE Grupo
    SET QuantidadeIntegrantes = QuantidadeIntegrantes + 1
    WHERE GrupoID = NEW.Grupo_ID;
END
$
DELIMITER ;

INSERT INTO Aluno (Nome) VALUES('Gabriel Carvalho');
INSERT INTO Aluno (Nome) VALUES('Guilherme Carvalho');
INSERT INTO Aluno (Nome) VALUES('Erika Carvalho');
INSERT INTO Aluno (Nome) VALUES('Diego Carvalho');
INSERT INTO Aluno (Nome) VALUES('Thiago Carvalho');
INSERT INTO Aluno (Nome) VALUES('Julia Carvalho');

INSERT INTO Trabalho(Disciplina, Descricao)
    VALUES('Matematica','Fazer calculos matematicos');
INSERT INTO Trabalho(Disciplina, Descricao)
    VALUES('Portugues','Fazer uma redação sobre o coronavirus');
  

INSERT INTO Grupo (Disciplina, QuantidadeIntegrantes) VALUES('Matematica', 0);
INSERT INTO Grupo (Disciplina, QuantidadeIntegrantes) VALUES('Portugues', 0);
INSERT INTO Grupo (Disciplina, QuantidadeIntegrantes) VALUES('Matematica', 0);
INSERT INTO Grupo (Disciplina, QuantidadeIntegrantes) VALUES('Portugues', 0);
INSERT INTO Grupo (Disciplina, QuantidadeIntegrantes) VALUES('Fisica', 0);


INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (1,1);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (1,2);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (1,3);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (3,4);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (3,5);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (3,6);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (2,1);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (2,2);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (2,3);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (4,4);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (4,5);
INSERT INTO GrupoAluno(Grupo_ID, Aluno_ID) VALUES (4,6);


INSERT INTO EntregaTrabalho(Grupo_ID, Trabalho_ID, Nota, Entregue)
    VALUES(1,1,7.5,1);
INSERT INTO EntregaTrabalho(Grupo_ID, Trabalho_ID, Nota, Entregue)
    VALUES(2,2,7.0,1);
INSERT INTO EntregaTrabalho(Grupo_ID, Trabalho_ID, Nota, Entregue)
    VALUES(3,1,8.5,1);
INSERT INTO EntregaTrabalho(Grupo_ID, Trabalho_ID, Nota, Entregue)
    VALUES(4,2,NULL,0);

SELECT ET.Grupo_ID, A.Nome,T.Disciplina,T.Descricao,ET.Nota /*Projeção*/
FROM EntregaTrabalho ET /*Origem*/
INNER JOIN Trabalho T
ON ET.Trabalho_ID = T.TrabalhoID
INNER JOIN GrupoAluno GP /*Junção*/
ON GP.Grupo_ID = ET.Grupo_ID
INNER JOIN Aluno A
ON GP.Aluno_ID = A.AlunoID
WHERE ET.Grupo_ID = 1; /*Seleção*/
