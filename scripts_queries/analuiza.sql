--Top 5 jogos mais populares da steam entre 2020 e 2021.
select gamename, avg(avg)
from popularity
where year between 2010 and 2020
group by gamename
order by 2 desc
limit 5

--analisar o preço médio dos jogos por empresa
select publisher, avg(price) as media_preco
from steam s 
group by publisher
order by 2 desc
limit 10;

--Analisar se a plataforma (windows/linux/mac) influencia no seu preço.
--O preço médio dos jogos
--windows
select case platforms
        when 'windows' then 'windows'
        when 'windows;mac' then 'windows'
        when 'windows;mac;linux' then 'windows'
        when 'windows;linux' then 'windows'
        --else 'outros'
        end platforms,
        avg(price)
from steam 
where platforms like '%windows%'
group by 1
order by 2 desc;


-- linux
select case platforms
        when 'linux' then 'linux'
        when 'mac;linux' then 'linux'
        when 'windows;mac;linux' then 'linux'
        when 'windows;linux' then 'linux'
        --else 'outros'
        end platforms,
        avg(price)
from steam 
where platforms like '%linux%'
group by 1
order by 2 desc;
-- mac
select case platforms
        when 'mac' then 'mac'
        when 'mac;linux' then 'mac'
        when 'windows;mac;linux' then 'mac'
        when 'windows;mac' then 'mac'
        --else 'outros'
        end platforms,
        avg(price)
from steam 
where platforms like '%mac%'
group by 1
order by 2 desc;

--Alternativa:
SELECT 
COUNT(*) as quantidade, unnest(string_to_array(platforms, ';')) as plataforma, avg(price), max(price)
FROM steam
GROUP BY plataforma
ORDER BY quantidade desc;


