SELECT clientes.nombre, COUNT(*) as num_pedidos,
(SELECT COUNT(*) FROM pedidos) as total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
WHERE clientes.nombre LIKE 'J%'
GROUP BY clientes.nombre;

SELECT 'cliente' as tipo, nombre, id_cliente cod
FROM clientes
UNION
SELECT 'empleado' as tipo, nombre, id_empleado cod
FROM empleados;

CREATE TABLE empleados(
id_empleado int primary key,
nombre varchar(50),
email varchar(50),
telefono varchar(15)
);

SELECT *
FROM pedidos
INNER JOIN clientes on pedidos.id_cliente=clientes.id_cliente
WHERE clientes.id_cliente NOT IN (
    SELECT id_cliente
    FROM clientes
    WHERE left(nombre, 1) ='A'
);
