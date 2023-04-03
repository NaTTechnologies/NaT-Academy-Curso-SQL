SELECT id_cliente, COUNT(*) as num_pedidos
FROM pedidos
GROUP BY id_cliente
HAVING num_pedidos < 5;

SELECT DISTINCT id_producto FROM pedidos;

SELECT fecha, SUM(total) as total from pedidos
GROUP BY fecha
HAVING total>100000 ;