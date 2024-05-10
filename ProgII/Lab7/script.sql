
CREATE TABLE cursos(
	idc INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	descr VARCHAR(500) NOT NULL,
	constraint pk_curso primary key (idc)
);

CREATE TABLE horarios (
	hora VARCHAR(20) NOT NULL,
	idh SERIAL NOT NULL,
	constraint pk_horario primary key (idh) 
);

CREATE TABLE disciplina(
	nome VARCHAR(25) NOT NULL,
	fase INTEGER NOT NULL,
	idd INTEGER NOT NULL,
	idc INTEGER NOT NULL,
	idh INTEGER,
	CONSTRAINT pk_disciplina primary key(idd),
	CONSTRAINT fk_disc_curso foreign key (idc) references cursos(idc),
	CONSTRAINT fk_disc_hora foreign key (idh) references horarios(idh)
);

INSERT INTO cursos(idc, nome, descr) VALUES
	(1, 'Ciência da Computação', 'O Curso de Ciência da Computação da UFFS é um curso que pretende, através de bases sólidas da área de computação, formar cientistas capazes de terem um papel importante em áreas da tecnologia da informação (TI), tanto na indústria quanto na academia.'),
	(2, 'Ciências Sociais', 'O Curso de Graduação em Ciências Sociais - Bacharelado, presencial, noturno, com oferta de 30 vagas anuais, ano, tem como principal objetivo promover a sólida formação nas áreas do conhecimento das Ciências Sociais (Antropologia, Ciência Política e Sociologia), formando indivíduos com capacidade de análise crítica e encorajando-os a desenvolverem novas aptidões além do estímulo ao desenvolvimento das competências próprias de cada um'),
	(3, 'Medicina', 'Sem descrição por ora');

INSERT INTO horarios(hora) VALUES
	('Sex1234'),
	('Qui1234'),
	('Ter1234'),
	('Seg1234'),
	('Qua123 Sex45'),
	('Sex123 Qui45'),
	('Ter123 Seg45'),
	('Ter45 Qua123');

INSERT INTO disciplina(idd, nome, fase, idc, idh) VALUES
	(1,'Algoritmos', 1, 1, 1),
	(2,'Matemática C', 1, 1, 2),
	(3,'Introução à Informática', 1, 1, 3),
	(4,'Introdução à Filosofia', 1, 1, 4),
	(5,'Estrutura de Dados', 1, 2, 5),
	(6,'Circuitos Digitais', 1, 2, 6),

	(7,'Estudos Sociais I', 1, 2, 7),
	(8,'Matemática A', 1, 2, 8),
	(9,'Sociologia Política I', 1, 2, 1),
	(10,'Introdução à Filosofia', 1, 2, 2),
	(11,'Sociologia II', 2, 2, 3),
	(12,'Antropologia I', 2, 2, 4),

	(13,'Fisiologia I', 1, 3, 5),
	(14,'Matemática C', 1, 3, 6),
	(15,'Introdução ao corpo', 1, 3, 7),
	(16,'Introdução à Filosofia', 1, 3, 8),
	(17,'Fisiologia II', 2, 3, 1),
	(18,'Saúde Pública I', 2, 3, 2);

