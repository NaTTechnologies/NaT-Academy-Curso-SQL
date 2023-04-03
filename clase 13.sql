CREATE TABLE seguimiento_clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TRIGGER agregar_seguimiento
AFTER INSERT ON clientes
FOR EACH ROW
  INSERT INTO seguimiento_clientes (id_cliente) VALUES (NEW.id_cliente);
  

INSERT INTO clientes (id_cliente, nombre, email, telefono) value (1004,'Fernando Campos','abccpr@example.com','(456) 444-555');

select * from seguimiento_clientes;
