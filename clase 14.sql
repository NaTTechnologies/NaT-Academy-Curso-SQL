CREATE TABLE ventas (
id_venta int not null primary key,
id_producto int,
fecha date,
cantidad decimal(8,2),
precio  decimal(8,2),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO ventas VALUES (1, 1, '2023-02-01',11, 541);
INSERT INTO ventas VALUES (2, 2, '2023-01-05',22, 386);
INSERT INTO ventas VALUES (3, 3, '2023-02-11',33, 798);
INSERT INTO ventas VALUES (4, 4, '2023-02-05',40, 911);
INSERT INTO ventas VALUES (5, 5, '2023-03-21',5, 810);
INSERT INTO ventas VALUES (6, 6, '2023-01-11',67, 476);
INSERT INTO ventas VALUES (7, 6, '2023-01-11',67, 476);
INSERT INTO ventas VALUES (8, 1, '2023-02-01',11, 541);
INSERT INTO ventas VALUES (9, 2, '2023-01-05',22, 386);
INSERT INTO ventas VALUES (10, 3, '2023-02-11',33, 798);
INSERT INTO ventas VALUES (11, 4, '2023-02-05',40, 911);
INSERT INTO ventas VALUES (12, 5, '2023-03-21',5, 810);
INSERT INTO ventas VALUES (13, 6, '2023-01-11',67, 476);

select * from ventas;

DELIMITER //
CREATE PROCEDURE consulta_dinamica(IN producto int, IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SET @sql = CONCAT('SELECT SUM(cantidad * precio) AS total FROM ventas WHERE id_producto = ''', producto, ''' AND fecha BETWEEN ''', fecha_inicio, ''' AND ''', fecha_fin, '''');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//


call consulta_dinamica (2, '2023-01-01', '2023-01-31');


CREATE TABLE precios (
id_precio int not null primary key,
id_producto int,
fecha date,
precio  decimal(8,2),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO precios VALUES (1, 1, '2022-02-01', 386);
INSERT INTO precios VALUES (2, 2, '2022-02-01', 387);
INSERT INTO precios VALUES (3, 1, '2022-02-02', 386);
INSERT INTO precios VALUES (5, 1, '2022-02-03', 387);
INSERT INTO precios VALUES (6, 1, '2022-02-04', 457);
INSERT INTO precios VALUES (7, 1, '2022-02-05', 444);
INSERT INTO precios VALUES (8, 1, '2022-02-06', 447);
INSERT INTO precios VALUES (9, 1, '2022-02-07', 489);

##DINAMICAS
SET @producto='1';
SET @fecha = '2022-02-02';
SET @sql = CONCAT('SELECT precio, fecha FROM precios WHERE id_producto = ''', @producto, ''' AND fecha =''', @fecha, '''');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


SET @precio = 500;
SET @consulta = CONCAT('SELECT * FROM productos WHERE precio > ', @precio);
PREPARE consulta_dinamica FROM @consulta;
EXECUTE consulta_dinamica;
