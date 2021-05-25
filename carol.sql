--1. Série temporal dos lançamentos de jogos durante os anos. 

SELECT date_trunc('month', CAST("public"."steam"."release_date" AS timestamp)) AS "release_date", count(*) AS "count"
FROM "public"."steam"
WHERE ("public"."steam"."release_date" >= date_trunc('year', CAST((CAST(now() AS timestamp) + (INTERVAL '-20 year')) AS timestamp))
   AND "public"."steam"."release_date" < date_trunc('year', CAST((CAST(now() AS timestamp) + (INTERVAL '1 year')) AS timestamp)))
GROUP BY date_trunc('month', CAST("public"."steam"."release_date" AS timestamp))
ORDER BY date_trunc('month', CAST("public"."steam"."release_date" AS timestamp)) ASC

-- Qual tag mais aparece. 
--(Coloquei as 10 tags que mais aparecem.)
SELECT 
	COUNT(*) as quantidade, unnest(string_to_array(steamspy_tags, ';')) as tags
FROM steam
GROUP BY tags
ORDER BY quantidade desc
limit 10;

-- Número de jogos em cada plataforma Windows;mac;linux.

SELECT 
	COUNT(*) as quantidade, unnest(string_to_array(platforms, ';')) as plataforma
FROM steam
GROUP BY plataforma
ORDER BY quantidade desc;
