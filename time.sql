
--defesas e entrega em 04/12

--Utilizando a modelagem de um campeonato de basquete:

--Time (Codigo PK, Nome)
--Jogador (Codigo PK, Nome, Time FK)
--Jogo (Codigo PK, Time1 FK, Time2 FK, DataHora)
--JogoJogador (Jogo PK FK, Jogador PK FK, Cestas2, Cestas3, TirosLivres)

--Observações:
--* 10 times de 10 jogadores, 5 em quadra e 5 no banco.
--* Sem limite da quantidade de substituições durante os jogos.
--* Todos os times jogam uma única vez contra todos os outros times.
--* 2 pontos pela vitória, 1 ponto pelo empate.

--Considerando o jogo entre os times Mosqueteiro Azul e Saci Vermelho ocorrido as 20:30 do último sábado:
--1) Atribuir uma cesta de 3 pontos ao jogador Joao Palito do time Mosqueteiro Azul.
--2) Alterar a cesta de 2 pontos atribuída erroneamente ao jogador Joao Palito do time Mosqueteiro Azul para o jogador Pedro Cestinha do mesmo time.
--Considerando os jogos realizados até o momento:
--3) Mostrar os jogadores que pontuaram em todos os jogos de seus times.
--5) Mostrar o placar final de cada jogo.
--6) Mostrar a tabela de classificação do campeonato.

drop table jogojogador,
drop table jogo,
drop table jogador,
drop table time,

create table time (
  codigo integer not NULL,
  nome varchar(100) not NULL,
  primary key (codigo)
);

create table jogador(
  codigo integer not null,
  nome varchar(100) not null,
  time integer not null,
  foreign key (time) references time(codigo),
  primary key (codigo)
);

create table jogo(
  codigo integer not null,
  time1 integer,
  time2 integer,
  datahora timestamp not null,
  foreign key (time1) references time(codigo),
  foreign key (time2) references time(codigo),
  primary key (codigo)
);

create table jogojogador(
  jogo integer not null,
  jogador integer not null,
  cesta2 integer not null,
  cesta3 integer not null,
  tiroslivres integer not null,
  foreign key (jogo) references Jogo(codigo),
  foreign key (jogador) references jogador(codigo),
  primary key (jogo, jogador)
);

--<Inserts time>
insert into time (codigo, nome) values (1, 'time1');
insert into time (codigo, nome) values (2, 'time2');
insert into time (codigo, nome) values (3, 'time3');
insert into time (codigo, nome) values (4, 'time4');
insert into time (codigo, nome) values (5, 'time5');
insert into time (codigo, nome) values (6, 'time6');
insert into time (codigo, nome) values (7, 'time7');
insert into time (codigo, nome) values (8, 'time8');
insert into time (codigo, nome) values (9, 'time9');
insert into time (codigo, nome) values (10, 'time10');

--<Inserts jogadores>
insert into jogador (codigo, nome, time) values (1, 'Lanny Dowling', 1);
insert into jogador (codigo, nome, time) values (2, 'Brucie Stellman', 2);
insert into jogador (codigo, nome, time) values (3, 'Corey Larcombe', 3);
insert into jogador (codigo, nome, time) values (4, 'Jonell Nottingham', 4);
insert into jogador (codigo, nome, time) values (5, 'Liv Raiker', 5);
insert into jogador (codigo, nome, time) values (6, 'Reagen Teape', 6);
insert into jogador (codigo, nome, time) values (7, 'Abby Marden', 7);
insert into jogador (codigo, nome, time) values (8, 'Darbie Robarts', 8);
insert into jogador (codigo, nome, time) values (9, 'Adrea Dubois', 9);
insert into jogador (codigo, nome, time) values (10, 'Irvin Carlisi', 10);
insert into jogador (codigo, nome, time) values (11, 'Gavan McAuliffe', 1);
insert into jogador (codigo, nome, time) values (12, 'Petrina FitzGibbon', 2);
insert into jogador (codigo, nome, time) values (13, 'Ernesto Rablen', 3);
insert into jogador (codigo, nome, time) values (14, 'Sharona Inglish', 4);
insert into jogador (codigo, nome, time) values (15, 'Almira Espasa', 5);
insert into jogador (codigo, nome, time) values (16, 'Nikki McCardle', 6);
insert into jogador (codigo, nome, time) values (17, 'Sanders Dudenie', 7);
insert into jogador (codigo, nome, time) values (18, 'Javier Gruszczak', 8);
insert into jogador (codigo, nome, time) values (19, 'Minnaminnie Lambertson', 9);
insert into jogador (codigo, nome, time) values (20, 'Cathyleen Hugo', 10);
insert into jogador (codigo, nome, time) values (21, 'Loralie Laxe', 1);
insert into jogador (codigo, nome, time) values (22, 'Gannie Lightoller', 2);
insert into jogador (codigo, nome, time) values (23, 'Mic Minthorpe', 3);
insert into jogador (codigo, nome, time) values (24, 'Inger Skingley', 4);
insert into jogador (codigo, nome, time) values (25, 'Gran Winsbury', 5);
insert into jogador (codigo, nome, time) values (26, 'Gabe Jillins', 6);
insert into jogador (codigo, nome, time) values (27, 'Gene Steddall', 7);
insert into jogador (codigo, nome, time) values (28, 'Erik Junkin', 8);
insert into jogador (codigo, nome, time) values (29, 'Hercules Levicount', 9);
insert into jogador (codigo, nome, time) values (30, 'Nelli Kinrade', 10);
insert into jogador (codigo, nome, time) values (31, 'Phillip Windrass', 1);
insert into jogador (codigo, nome, time) values (32, 'Gardy Bernetti', 2);
insert into jogador (codigo, nome, time) values (33, 'Marline Kornilyev', 3);
insert into jogador (codigo, nome, time) values (34, 'Gabi Fitchen', 4);
insert into jogador (codigo, nome, time) values (35, 'Thom Florey', 5);
insert into jogador (codigo, nome, time) values (36, 'Dacia Aulds', 6);
insert into jogador (codigo, nome, time) values (37, 'Joleen Caley', 7);
insert into jogador (codigo, nome, time) values (38, 'Amory Nendick', 8);
insert into jogador (codigo, nome, time) values (39, 'Earvin Shiliton', 9);
insert into jogador (codigo, nome, time) values (40, 'Gonzales Allain', 10);
insert into jogador (codigo, nome, time) values (41, 'Nye Vala', 1);
insert into jogador (codigo, nome, time) values (42, 'Christoper Geroldi', 2);
insert into jogador (codigo, nome, time) values (43, 'Cyndy Warmington', 3);
insert into jogador (codigo, nome, time) values (44, 'Elene Petrushkevich', 4);
insert into jogador (codigo, nome, time) values (45, 'Herold Eldrett', 5);
insert into jogador (codigo, nome, time) values (46, 'Arvie Millhouse', 6);
insert into jogador (codigo, nome, time) values (47, 'Teodoro Tregiddo', 7);
insert into jogador (codigo, nome, time) values (48, 'Donnell Molan', 8);
insert into jogador (codigo, nome, time) values (49, 'Pearce Falconer', 9);
insert into jogador (codigo, nome, time) values (50, 'Pasquale Latty', 10);
insert into jogador (codigo, nome, time) values (51, 'Kerrie Dibdall', 1);
insert into jogador (codigo, nome, time) values (52, 'Gaelan Wathey', 2);
insert into jogador (codigo, nome, time) values (53, 'Waldemar Chaffyn', 3);
insert into jogador (codigo, nome, time) values (54, 'Alyosha Artinstall', 4);
insert into jogador (codigo, nome, time) values (55, 'Zach Crolly', 5);
insert into jogador (codigo, nome, time) values (56, 'Jannelle Jeanel', 6);
insert into jogador (codigo, nome, time) values (57, 'Adela Gault', 7);
insert into jogador (codigo, nome, time) values (58, 'Karylin Caulket', 8);
insert into jogador (codigo, nome, time) values (59, 'Belvia Rocks', 9);
insert into jogador (codigo, nome, time) values (60, 'Celestine Keri', 10);
insert into jogador (codigo, nome, time) values (61, 'Aurore Strippling', 1);
insert into jogador (codigo, nome, time) values (62, 'Kelsi Crother', 2);
insert into jogador (codigo, nome, time) values (63, 'Seymour Reaveley', 3);
insert into jogador (codigo, nome, time) values (64, 'Nat Spackman', 4);
insert into jogador (codigo, nome, time) values (65, 'Lynna Burman', 5);
insert into jogador (codigo, nome, time) values (66, 'Barn Jorden', 6);
insert into jogador (codigo, nome, time) values (67, 'Morty Cathesyed', 7);
insert into jogador (codigo, nome, time) values (68, 'Winifred Sommerton', 8);
insert into jogador (codigo, nome, time) values (69, 'Phebe Klima', 9);
insert into jogador (codigo, nome, time) values (70, 'Johnette Worham', 10);
insert into jogador (codigo, nome, time) values (71, 'Antonius Iltchev', 1);
insert into jogador (codigo, nome, time) values (72, 'Geraldine Putton', 2);
insert into jogador (codigo, nome, time) values (73, 'Bret Cunliffe', 3);
insert into jogador (codigo, nome, time) values (74, 'Daniele Symcock', 4);
insert into jogador (codigo, nome, time) values (75, 'Nert Pettus', 5);
insert into jogador (codigo, nome, time) values (76, 'Latisha Joddens', 6);
insert into jogador (codigo, nome, time) values (77, 'Pearle Clements', 7);
insert into jogador (codigo, nome, time) values (78, 'Ashlan Board', 8);
insert into jogador (codigo, nome, time) values (79, 'Nananne Lavelle', 9);
insert into jogador (codigo, nome, time) values (80, 'Hendrika Peacey', 10);
insert into jogador (codigo, nome, time) values (81, 'Bride Colbeck', 1);
insert into jogador (codigo, nome, time) values (82, 'Malinda Drewes', 2);
insert into jogador (codigo, nome, time) values (83, 'Eadmund Spaughton', 3);
insert into jogador (codigo, nome, time) values (84, 'Martelle Hanretty', 4);
insert into jogador (codigo, nome, time) values (85, 'Giavani Twigge', 5);
insert into jogador (codigo, nome, time) values (86, 'Emalia Sommersett', 6);
insert into jogador (codigo, nome, time) values (87, 'Irma Allner', 7);
insert into jogador (codigo, nome, time) values (88, 'Pierce Cullity', 8);
insert into jogador (codigo, nome, time) values (89, 'Armstrong Stodd', 9);
insert into jogador (codigo, nome, time) values (90, 'Tobe MacDonagh', 10);
insert into jogador (codigo, nome, time) values (91, 'Yuma Linskill', 1);
insert into jogador (codigo, nome, time) values (92, 'Elianore Iorizzo', 2);
insert into jogador (codigo, nome, time) values (93, 'Rosemary Randlesome', 3);
insert into jogador (codigo, nome, time) values (94, 'Ann Joannidi', 4);
insert into jogador (codigo, nome, time) values (95, 'Jule Widocks', 5);
insert into jogador (codigo, nome, time) values (96, 'Robb Kohler', 6);
insert into jogador (codigo, nome, time) values (97, 'Baryram Daveran', 7);
insert into jogador (codigo, nome, time) values (98, 'Ula Celand', 8);
insert into jogador (codigo, nome, time) values (99, 'Trudy Chazelle', 9);
insert into jogador (codigo, nome, time) values (100, 'Lorianna Fladgate', 10);


--Inserts jogo
--Time 1 contra todos em sequencia.
insert into jogo (codigo, time1, time2, datahora) values (1, 1, 2, now());
insert into jogo (codigo, time1, time2, datahora) values (2, 1, 3, now());
insert into jogo (codigo, time1, time2, datahora) values (3, 1, 4, now());
insert into jogo (codigo, time1, time2, datahora) values (4, 1, 5, now());
insert into jogo (codigo, time1, time2, datahora) values (5, 1, 6, now());
insert into jogo (codigo, time1, time2, datahora) values (6, 1, 7, now());
insert into jogo (codigo, time1, time2, datahora) values (7, 1, 7, now());
insert into jogo (codigo, time1, time2, datahora) values (8, 1, 8, now());
insert into jogo (codigo, time1, time2, datahora) values (9, 1, 9, now());
insert into jogo (codigo, time1, time2, datahora) values (10, 1, 10, now());


--Inserts jogojogador
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 2, 0, 0, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 1, 1, 0, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 9, 0, 1, 0);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 8, 1, 0, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 6, 1, 1, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 11, 0, 0, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 19, 0, 0, 0);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 15, 1, 1, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 12, 1, 0, 1);
insert into jogojogador (jogo, jogador, cesta2, cesta3, tiroslivres) values (1, 10, 0, 0, 0);
/*========================================================================================*/

--3) Mostrar os jogadores que pontuaram em todos os jogos de seus times.
select jogador.nome
from jogojogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
where (cesta2 > 0) or (cesta3 > 0) or (tiroslivres > 0);

--5) Mostrar o placar final de cada jogo.
select time.nome, count(cesta2) as cesta2, count(cesta3) as cesta3, count(tiroslivres) as tiroslivres
from JogoJogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
where (cesta2 > 0) or (cesta3 > 0) or (tiroslivres > 0)
      and jogador.time = time.codigo
group by time.nome;
