/*
CREATE TEMPORARY TABLE tabla_temporal (
    columna_1 tipo_dato,
    columna_2 tipo_dato,
    ...
);
*/

CREATE TEMPORARY TABLE pedidos_2022 (
    id_pedido INT,
    cliente VARCHAR(50),
    fecha_pedido DATE,
    total_pedido FLOAT
);

SELECT * FROM pedidos_2022;

INSERT INTO pedidos_2022 (id_pedido, cliente, fecha_pedido, total_pedido) 
SELECT id_pedido, nombre, fecha, total
FROM pedidos 
inner join clientes on pedidos.id_cliente=clientes.id_cliente
WHERE fecha between '2022-01-01' and '2022-12-31';

select * from pedidos_2022;

/*
SELECT columna_pivot,
sum(CASE WHEN condicion THEN valorA ELSE 0 END)as ColumnaA,
sum(CASE WHEN condicion THEN valorA ELSE 0 END)as ColumnaB,
sum(CASE WHEN condicion THEN valorA ELSE 0 END)as ColumnaC,
sum(CASE WHEN condicion THEN valorA ELSE 0 END)as ColumnaD
FROM tabla
WHERE condiciones
GROUP BY columna_pivot;
*/

SELECT pedidos.id_cliente,
sum(CASE WHEN MONTH(fecha)=1 THEN total ELSE 0 END) 'Enero',
sum(CASE WHEN MONTH(fecha)=2 THEN total ELSE 0 END) 'Febrero',
sum(CASE WHEN MONTH(fecha)=3 THEN total ELSE 0 END) 'Marzo',
sum(CASE WHEN MONTH(fecha)=4 THEN total ELSE 0 END) 'Abril',
sum(CASE WHEN MONTH(fecha)=5 THEN total ELSE 0 END) 'Mayo',
sum(CASE WHEN MONTH(fecha)=6 THEN total ELSE 0 END) 'Junio',
sum(CASE WHEN MONTH(fecha)=7 THEN total ELSE 0 END) 'Julio',
sum(CASE WHEN MONTH(fecha)=8 THEN total ELSE 0 END) 'Agosto',
sum(CASE WHEN MONTH(fecha)=9 THEN total ELSE 0 END) 'Septiembre',
sum(CASE WHEN MONTH(fecha)=10 THEN total ELSE 0 END) 'Octubre',
sum(CASE WHEN MONTH(fecha)=11 THEN total ELSE 0 END) 'Noviembre',
sum(CASE WHEN MONTH(fecha)=12 THEN total ELSE 0 END) 'Diciembre',
SUM(total) Total_Anio
FROM pedidos 
inner join clientes on pedidos.id_cliente=clientes.id_cliente
WHERE year(fecha)=2022 
group by pedidos.id_cliente;


SELECT
    DATE_FORMAT(fecha, '%Y-%m') AS Mes,
    SUM(total) AS pedidos,
	COUNT(*) as NumPedidos
FROM pedidos
where year(fecha)=year(current_timestamp())
GROUP BY Mes


