-- Top 5 gêneros mais populares da steam. 
select unnest(string_to_array(genres, ';')) as generos,  COUNT(genres) as quantidade
from steam
group by generos
order by quantidade desc
limit 5;

--Analisar os top 5 jogos que têm maiores notas negativas 
select name,negative_ratings from steam
order by 2 desc
limit 5;

--Gêneros mais jogados e a média de jogadores em cada um deles.select generos, avg(intervalos::int) as intervalos
from (select unnest(string_to_array(genres,';')) as generos, unnest(string_to_array(owners,'-')) as intervalos
from steam) as tabela2
where intervalos != 'Null' and generos != 'NULL'
group by 1
order by 2 desc
limit 10;


--Quais sistemas operacionais possuem mais jogos disponíveis ? 
select unnest(string_to_array(platforms,';')) as plataformas, count(platforms) as quantidade
from steam
group by 1;