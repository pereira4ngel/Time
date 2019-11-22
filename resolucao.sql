/*Resoluções*/




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
