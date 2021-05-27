--Top 5 empresas da steam
select count(developer) as top_empresas, developer from steam 
group by developer
order by top_empresas desc
limit 5;

--Analisar o preço médio por plataforma
SELECT 
COUNT(*) as quantidade, unnest(string_to_array(platforms, ';')) as plataforma, avg(price), max(price)
FROM steam
GROUP BY plataforma
ORDER BY quantidade desc;

