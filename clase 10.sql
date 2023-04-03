CREATE TABLE cuentas (
  id_cuenta INT PRIMARY KEY,
  saldo decimal(10,2)
);

CREATE TABLE transacciones(
id_cuenta int,
monto decimal(10,2)
);

INSERT INTO cuentas VALUES(1, 1000);


START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100  WHERE id_cuenta = 1;
INSERT INTO transacciones (id_cuenta, monto) VALUES (1, 100);
rollback;
commit;

SELECT * FROM cuentas;
SELECT * FROM transacciones;



CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(50) UNIQUE
);


INSERT INTO usuarios (id, nombre, email) VALUES (1, 'Juan Perez', 'juan@example.com');
INSERT INTO usuarios (id, nombre, email) VALUES (2, 'Maria Sanchez', 'juan@example.com');
INSERT INTO usuarios (id, nombre, email) VALUES (3, 'Pedro Garcia', 'pedro@example.com');


SELECT * FROM usuarios
