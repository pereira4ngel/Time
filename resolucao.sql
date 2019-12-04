/*Resoluções*/
ultimo sabado

select (( date_part('day', datahora)  +  (2 * date_part('month', datahora)) + (3 * (date_part('month', datahora)+1) / 5 ) + 
date_part('year', datahora) +  (date_part('year', datahora) / 4) - (date_part('year', datahora) / 100) + (date_part('year', datahora) / 100) + 2)/ 7)::integer % 7 as diasemana



--1) Atribuir uma cesta de 3 pontos ao jogador Joao Palito do time Mosqueteiro Azul.

INSERT INTO jogojogador(jogo, jogador, cesta2, cesta3, tiroslivres)
SELECT jogo, jogador, cesta2, 3, tiroslivres FROM jogojogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
WHERE lower(jogador.nome) like 'joao palito' and lower(time.nome) like 'mosqueteiro azul'

2)
Alterar a cesta de 2 pontos atribuída erroneamente ao jogador Joao Palito do time Mosqueteiro Azul para o jogador Pedro Cestinha do mesmo time.




INSERT INTO jogojogador(jogo, jogador, cesta2, cesta3, tiroslivres)

update jogojogador
set cesta2 = 2
where jogador = (SELECT jogador.nome FROM jogojogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
WHERE lower(jogador.nome) like 'joao palito' and lower(time.nome) like 'mosqueteiro azul')


update jogojogador
set cesta2 = 0
where jogador = (SELECT jogador.nome FROM jogojogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
WHERE lower(jogador.nome) like 'Pedro Cestinha' and lower(time.nome) like 'mosqueteiro azul')








--3) Mostrar os jogadores que pontuaram em todos os jogos de seus times.
select jogador.nome
from jogojogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
where (cesta2 > 0) or (cesta3 > 0) or (tiroslivres > 0);

--4) --Mostrar os jogadores que fizeram cestas de 3 pontos em 3 jogos consecutivos de seus times.
select  jogador.nome from jogo
join jogojogador on jogo.codigo = jogojogador.jogo
join jogador on jogojogador.jogador = jogador.codigo
where cesta3 = 3
order by jogo.datahora desc limit 3


--5) Mostrar o placar final de cada jogo.
select time.nome, count(cesta2) as cesta2, count(cesta3) as cesta3, count(tiroslivres) as tiroslivres
from JogoJogador
join jogador on jogojogador.jogador = jogador.codigo
join time on jogador.time = time.codigo
where (cesta2 > 0) or (cesta3 > 0) or (tiroslivres > 0)
      and jogador.time = time.codigo
group by time.nome;
