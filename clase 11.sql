##FUNCION RANK
## RANK() OVER (ORDER BY columna ASC/DESC)
SELECT id_pedido, fecha, total, RANK() OVER(ORDER BY total DESC) as rango
FROM pedidos;


##FUNCION LAG
## LAG(columna, n, valor_predeterminado) OVER (ORDER BY columna ASC/DESC)
SELECT id_pedido, fecha, total, total- (LAG(total, 1, total) OVER(ORDER BY fecha desc)) as diferencia
FROM pedidos;


##FUNCION RANK
SELECT 
  clientes.nombre, 
  SUM(pedidos.total) as monto_total,
  RANK() OVER (ORDER BY SUM(pedidos.total) ASC) as ranking
FROM clientes
JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
GROUP BY clientes.id_cliente;


##FUNCION LAG
SELECT 
  pedidos.id_pedido, 
  pedidos.id_cliente, 
  pedidos.total, 
  pedidos.fecha,
  LAG(pedidos.total) OVER (PARTITION BY pedidos.id_cliente ORDER BY pedidos.id_pedido) as monto_anterior,
  pedidos.total - LAG(pedidos.total) OVER (PARTITION BY pedidos.id_cliente ORDER BY pedidos.id_pedido) as diferencia_monto
FROM pedidos;


##FUNCION LEAD
## LEAD(columna, n, valor_predeterminado) OVER (ORDER BY columna ASC/DESC)
SELECT 
  pedidos.id_pedido, 
  pedidos.id_cliente, 
  pedidos.fecha, 
  LEAD(pedidos.fecha) OVER (PARTITION BY pedidos.id_cliente ORDER BY pedidos.fecha) as fecha_siguiente,
  DATEDIFF(LEAD(pedidos.fecha) OVER (PARTITION BY pedidos.id_cliente ORDER BY pedidos.fecha), pedidos.fecha) as dias_entre_pedidos
FROM pedidos;
