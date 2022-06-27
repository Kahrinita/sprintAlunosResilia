#QUERY 1 Saber quem são os alunos que entregaram o projeto do módulo 1, e estão com o conceito em "Pronto" ou "Mais que pronto" 

SELECT 
    entregas.id_aluno, entregas.conceito
FROM
    entregas
WHERE
    modulo_projeto = '1'
        AND conceito = 'pronto'
        OR conceito = 'mais que pronto';
        
-- Quantos projetos no total (entre todas as turmas) foram entregues com conceito
-- "Ainda não está pronto" e "Chegando lá".


SELECT
	entregas.id_aluno,
    entregas.conceito,
    count(entregas.conceito) as qtd_conceito
FROM
    entregas
        INNER JOIN
    turma
WHERE
    turma.ID = entregas.id_turma
        AND entregas.conceito = 'ainda não está pronto'
GROUP BY entregas.conceito;

SELECT
	entregas.id_aluno,
    entregas.conceito,
    count(entregas.conceito) as qtd_conceito
FROM
    entregas
        INNER JOIN
    turma
WHERE
    turma.ID = entregas.id_turma
        AND entregas.conceito = 'chegando lá'
GROUP BY entregas.conceito;

-- Consultar quantos alunos temos em cada turma. --
SELECT 
    ID_TURMA, count(ID_TURMA) as qtd_alunos
FROM
    aluno
group by ID_TURMA;

-- Qual a turma com a maior quantidade de projetos no "Mais que pronto"?

SELECT 
    id_turma, COUNT(id_turma) AS quantidade_maisq_pronto
FROM
    entregas
WHERE
    conceito = 'mais que pronto'
GROUP BY id_turma
ORDER BY quantidade_maisq_pronto;

#POPULANDO TABELAS CURSO, TURMA, ALUNO, FACILITADOR E ENTREGAS

INSERT INTO CURSO(FRENTE) VALUES("WEB DEV");
INSERT INTO CURSO(FRENTE) VALUES("DADOS");

INSERT INTO TURMA(CURSO) VALUES(1);
INSERT INTO TURMA(CURSO) VALUES(2);

INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("PEDRO VITOR", "49345334645", 1);
INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("CAROLINA SOUZA","49345334642",1);
INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("KARINA SILVA", "54958284942", 2);
INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("MIRNA RAMOS", "12345678910", 2);
INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("LARRISSA LIRA", "49494949494", 1);
INSERT INTO ALUNO(NOME, CPF, ID_TURMA) VALUES("RAMOM FERRAZ", "49494954842", 2);

INSERT INTO FACILITADOR(NOME, FRENTE, ID_TURMA) VALUES("LEO COSTA", "34566644432",1);
INSERT INTO FACILITADOR(NOME, FRENTE, ID_TURMA) VALUES("ANNA SOUSA", "43311122233",2);

INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.devmedia.com.br/responsive-design-dicas-para-tornar-seu-site-acessivel-em-qualquer-resolucao/28316', 1, 1, 1, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://regexcrossword.com/howtoplay', 1, 2, 1, 'mais que pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=RhDrRLdcvjs&t=144s', 1, 3, 2, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=cjkHhPDCYLs', 1, 4, 2, 'ainda não está pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=vOQDTM8cbR0', 1, 5, 1, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=tSAuUxnJlcA', 1, 6, 2, 'chegando lá');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.devmedia.com.br/responsive-design-dicas-para-tornar-seu-site-acessivel-em-qualquer-resolucao/28316', 2, 1, 1, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://regexcrossword.com/howtoplay', 2, 2, 1, 'mais que pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=RhDrRLdcvjs&t=144s', 2, 3, 2, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=cjkHhPDCYLs', 2, 4, 2, 'ainda não está pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=vOQDTM8cbR0', 2, 5, 1, 'pronto');
INSERT INTO entregas (link, modulo_projeto, id_aluno, id_turma, conceito) VALUES ('https://www.youtube.com/watch?v=tSAuUxnJlcA', 2, 6, 2, 'chegando lá');

#POPULANDO ATRIBUTO EMAIL DA TABELA ALUNO 

UPDATE aluno SET email ='pedromalabares@hotmail.com' WHERE ID = 1;
UPDATE aluno SET email = 'carolsouza@bol.com.br' WHERE ID = 2;
UPDATE aluno SET email = 'karinasilva@uol.com' WHERE ID = 3;
UPDATE aluno SET email = 'mirnaramos@outlook.com' WHERE ID = 4;
UPDATE aluno SET email = 'larrissalira@gmail.com' WHERE ID = 5;
UPDATE aluno SET email = 'larrissa@msn.com' WHERE ID = 6;

#criando database sprint_2 e tabelas CURSO, TURMA, ALUNO, FACILITADOR e ENTREGAS

create database sprint_2;
use sprint_2;

CREATE TABLE CURSO(
ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
FRENTE VARCHAR(255)
);

CREATE TABLE TURMA (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CURSO INT,
    FOREIGN KEY (CURSO)
        REFERENCES CURSO (ID)
);
    
CREATE TABLE ALUNO (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(255),
    CPF VARCHAR(11),
    ID_TURMA INT,
    FOREIGN KEY (ID_TURMA)
        REFERENCES TURMA (ID)
);

CREATE TABLE FACILITADOR (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(255),
    FRENTE VARCHAR(255),
    ID_TURMA INT,
    FOREIGN KEY (ID_TURMA)
        REFERENCES TURMA (ID)
);

CREATE TABLE ENTREGAS (
    ID_ENTREGA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    link VARCHAR(500),
    modulo_projeto INT NOT NULL,
    id_aluno INT,
    FOREIGN KEY (id_aluno)
        REFERENCES aluno (ID),
        ID_TURMA INT,
    FOREIGN KEY (ID_TURMA)
        REFERENCES TURMA (ID),
    conceito VARCHAR(255)
);

# ADICIONANDO ATRIBUTO EMAIL COM TYPE TEXT

ALTER TABLE aluno ADD email text;