CREATE VIEW nombre_vista AS SELECT columna1, columna2, … FROM nombre_tabla WHERE condición;

CREATE VIEW vista_pedidos as
SELECT clientes.nombre, pedidos.id_pedido, pedidos.fecha, pedidos.total
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

SELECT * FROM vista_pedidos;








CREATE PROCEDURE nombre_procedimiento( /*parametros*/)
BEGIN
   -- Código del procedimiento
END;

SELECT SUM(total) FROM pedidos WHERE id_cliente = 1;

DELIMITER //
CREATE PROCEDURE total_ventas_cliente(IN id_cliente INT) 
BEGIN
   SELECT SUM(total) FROM pedidos WHERE pedidos.id_cliente = id_cliente;
END
//

CALL total_ventas_cliente(1);

DELIMITER //
CREATE PROCEDURE PedidosPorCliente( )
BEGIN
  SELECT c.Nombre, COUNT(p.Id_Pedido) AS NumPedidos
  FROM Clientes c
  LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
  GROUP BY c.id_cliente, c.Nombre;
END
//


call PedidosPorCliente()

