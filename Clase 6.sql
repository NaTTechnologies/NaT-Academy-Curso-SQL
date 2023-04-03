CREATE TABLE natacademy.clientes (
id_cliente INT PRIMARY KEY,
nombre VARCHAR(50),
email VARCHAR(50),
telefono VARCHAR(15)
);

CREATE TABLE natacademy.productos (
id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(50),
precio DECIMAL(8,2)
);

CREATE TABLE natacademy.pedidos (
id_pedido INT PRIMARY KEY,
id_cliente INT,
id_producto INT,
fecha DATE,
total DECIMAL(10, 2),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

SELECT COUNT(*) from natacademy.clientes
CROSS JOIN natacademy.pedidos  ;

SELECT COUNT(*) from natacademy.PEDIDOS;
