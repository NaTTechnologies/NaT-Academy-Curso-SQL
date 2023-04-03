select 
id_cliente as cliente , 
count(*) cantidad_ordenes, 
sum(total) total_compra, 
avg(total) promedio_compra, 
max(total) maximo_orden, 
min(total) minimo_orden
from natacademy.ordenes
group by id_cliente
order by count(*) desc
limit 25 ;9

select * from natacademy.ordenes
where id_cliente=3;