--1.Preço médio por jogos.
select avg(price) as Preço_Medio  from Steam;

--2.Analisar os top 5 jogos que tem maiores notas positivas. 
select st.name as Top_5, positive_ratings as Total_positivo
  from Steam  st
  order by positive_ratings desc
  limit 5;

--3.Preço médio de jogos por categoria ou gênero. 
select unnest(string_to_array(genres,';')) as Genero,avg(price)as Preço_Medio
  from Steam
  group by Genero
  order by 2 desc
  limit 8;
