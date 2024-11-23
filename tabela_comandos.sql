mysql -u root -p

SHOW DATABASES;

CREATE DATABASE cadastro;

use cadastro;
CREATE TABLE pessoas (
    nome varchar (30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

describe gafanhotos;

describe cursos;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
drop column profissao;

alter table pessoas
add column codigo int first;

alter table pessoas
modify column profissao int first;

alter table pessoas
modify column profissao varchar(20) not null default '';

alter table pessoas 
change column profissao prof varchar(20);

alter table pessoas 
rename to gente;

create table if not exists cursos (
    nome varchar (30) not null UNIQUE,
    descricao text,
    carga int UNSIGNED,
    totaulas int,
    ano year DEFAULT '2016'
) default charset = utf8;


DESC CURSOS;

alter table cursos 
add column idcurso int first;

alter table cursos
add primary key (idcurso);

select * from cursos;

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', ' 2014'),
( '4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5','Jarva', 'Introdução à Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Bancos de Dados MySQL', '30', '15', '2016' ),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9','Cozinha Arabe', 'Aprenda a fazer Kibe', '40 ', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018' );

update cursos 
 set nome = 'HTML5'
 WHERE idcurso = '1';

update cursos 
 set nome = 'PHP', ANO ='2015'
 WHERE idcurso = '4';

update cursos 
 set nome = 'Java', ANO ='2015', carga = '40'
 WHERE idcurso = '5'
 limit 1;

delete from cursos
where idcurso = '8';

delete from cursos
where ano = '2016';

truncate cursos;

CREATE DATABASE cadastro
    default character set utf8
    default collate utf8_general_ci;

use cadastro;

CREATE TABLE `pessoas` (
	`id` int not null auto_increment,
    `nome` varchar (30) not null,
    `nascimento` date,
	`sexo` enum ('M', 'F'),
    `peso` decimal (5,2),
    `altura` decimal (5,2),
	`nacionalidade` varchar(20) default 'Brasil',
    PRIMARY KEY (id)
) default charset  = utf8;

INSERT INTO pessoas values
(DEFAULT, 'Teste', '1999-01-02', 'M', '78', '1.70', default),
(DEFAULT, 'Teste1', '1994-01-02', 'M', '62', '1.90', default),
(DEFAULT, 'Teste2', '1994-01-02', 'M', '62', '1.90', 'Espanha');

select * from pessoas;

drop database cadastro;

desc gafanhotos;

alter table gafanhotos add cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select * from gafanhotos;

DELETE FROM CURSOS where idCURSO = '6';

select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1';

select nome, cursopreferido from gafanhotos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on c.idcurso = g.cursopreferido;

create table gafanhoto_assiste_curso (
		id int not null auto_increment,
		data date,
        idgafanhoto int,
        idcurso int,
        PRIMARY KEY (id),
        FOREIGN KEY (idgafanhoto) REFERENCES gafanhotos(id),
		FOREIGN KEY (idcurso) REFERENCES cursos(idcurso)
 ) default charset = utf8;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2');

select * from gafanhoto_assiste_curso;

select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c
on c.idcurso = a.idcurso
order by g. nome;





