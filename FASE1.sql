--1. Total de ordenes registradas

SELECT COUNT(*) AS total_ordenes
FROM ordenes;

--2. Número de clientes con ordenes desde 1 de enero de 2021 hasta hoy

SELECT COUNT(DISTINCT cliente_id) AS clientes_activos
FROM ordenes
WHERE fecha >= '2021-01-01';

--3. Total clientes con ordenes

SELECT cliente_id, COUNT(*) AS numero_ordenes
FROM ordenes
GROUP BY cliente_id
ORDER BY numero_ordenes DESC;

--4. Detalle mayor pedido 2020

SELECT c.*, o.fecha, p.nombre_producto, od.cantidad
FROM ordenes o
JOIN clientes c ON o.cliente_id = c.id
JOIN orden_detalle od ON o.id = od.orden_id
JOIN productos p ON od.producto_id = p.id
WHERE EXTRACT(YEAR FROM o.fecha) = 2020
ORDER BY o.valor_total DESC
LIMIT 1;

--5. Ventas mes y año

SELECT 
  EXTRACT(YEAR FROM fecha) AS año,
  EXTRACT(MONTH FROM fecha) AS mes,
  SUM(valor_total) AS total_vendido
FROM ordenes
GROUP BY año, mes
ORDER BY año, mes;

--6 detalle cliente

SELECT 
  p.nombre_producto,
  COUNT(*) AS veces_comprado,
  SUM(od.precio_unitario * od.cantidad) AS total_gastado
FROM ordenes o
JOIN clientes c ON o.cliente_id = c.id
JOIN orden_detalle od ON o.id = od.orden_id
JOIN productos p ON od.producto_id = p.id
WHERE c.cedula = '123456'
GROUP BY p.nombre_producto
ORDER BY total_gastado DESC;

--7 Situacion, actualizar los datos del último mes sin porder usar comando "ADD COLUMN" y "ALTER TABLE"

/*En esta situación hipotética crearía una tabla temporal que contenga la información de la ciudad en una columna,
en dicha tabla insertaría los datos del mes actual y uniría esta infpormación a la tabla histórica usando el comando
"UNION"*/

CREATE TABLE ordenes_nueva (
  id INT,
  cliente_id INT,
  fecha DATE,
  valor_total DECIMAL,
  ciudad VARCHAR(100)
);

INSERT INTO ordenes_nueva
SELECT * FROM ordenes_mes_actual;

INSERT INTO ordenes_nueva
SELECT *, NULL AS ciudad FROM ordenes_historicas;
