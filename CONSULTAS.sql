-- Active: 1749066624531@@127.0.0.1@3307@TALLER
-- Consultas básicas


-- Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.
SELECT nombre,precio  FROM productos
WHERE precio > 100000;

-- Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.


SELECT nombre,puesto,salario 
FROM empleados 
JOIN usuarios AS u ON empleados.usuario_id = u.usuario_id
WHERE salario > 2500000;
-- Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente
SELECT nombre FROM productos
WHERE categoria = 'Electronica'
ORDER BY nombre ASC;

-- Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.
SELECT * FROM pedidos
WHERE  estado = 'pendiente'

-- Encuentra el nombre y el precio del producto más caro en la base de datos.
SELECT nombre, precio
FROM productos
WHERE precio = (SELECT MAX(precio) FROM productos);
-- Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
SELECT cliente_id, COUNT(pedido_id) AS total_pedidos
FROM pedidos
GROUP BY cliente_id;

-- Calcula el promedio de salario de todos los empleados en la empresa.
SELECT AVG(salario) AS promedio FROM empleados;
-- Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos
SELECT categoria,COUNT(categoria) FROM productos
GROUP BY categoria;
-- Obtén una lista de productos con un precio mayor a $75 USD, mostrando solo el nombre, el precio y su respectivo precio en USD.
SELECT nombre, precio, precio / 4126.73  FROM productos

-- Lista todos los proveedores registrados.
SELECT * FROM proveedores;
-- Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos
SELECT categoria,COUNT(categoria) FROM productos
GROUP BY categoria;
-- Obtén una lista de productos con un precio mayor a $75 USD, mostrando solo el nombre, el precio y su respectivo precio en USD.
SELECT nombre, precio, precio / 4126.73  FROM productos

-- Lista todos los proveedores registrados.
SELECT * FROM proveedores;


-- Consultas multitabla joins
-- Encuentra los nombres de los clientes y los detalles de sus pedidos.
SELECT us.nombre, 
d.pedido_id,
d.detalle_id,
d.cantidad,
d.precio_unitario
FROM usuarios AS us
JOIN pedidos AS f ON f.cliente_id = us.usuario_id 
JOIN detalles_pedidos AS d ON d.pedido_id = f.pedido_id

-- Lista todos los productos pedidos junto con el precio unitario de cada pedido
SELECT pr.nombre,
de.precio_unitario
FROM detalles_pedidos AS de 
JOIN productos AS pr ON de.producto_id = pr.producto_id

-- Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos

 SELECT us.nombre AS 'Cliente',
 em_usuario.nombre AS 'Empleado'
 FROM pedidos AS pe
 JOIN usuarios AS us ON pe.cliente_id = us.usuario_id
 JOIN empleados AS em ON pe.empleado_id = em.empleado_id
 JOIN usuarios AS em_usuario ON em.usuario_id = em_usuario.usuario_id

-- 1. Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
SELECT pe.pedido_id,
pe.cliente_id,
pe.empleado_id,
pr.nombre 
FROM  pedidos AS pe 
LEFT JOIN detalles_pedidos AS de ON de.pedido_id = pe.pedido_id
LEFT JOIN productos AS pr ON pr.producto_id = de.producto_id

-- Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
SELECT
    pr.nombre,
    de.detalle_id,
    de.producto_id 
FROM
    productos AS pr
RIGHT JOIN
    detalles_pedidos AS de ON pr.producto_id = de.producto_id;

-- Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.
SELECT
    em.empleado_id,
    pe.pedido_id,
    pe.fecha_pedido
FROM
    empleados AS em
LEFT JOIN
    pedidos AS pe ON em.empleado_id = pe.empleado_id;
-- Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.
SELECT em.empleado_id,
    pe.pedido_id
FROM empleados AS em
LEFT JOIN  pedidos AS pe ON  em.empleado_id = pe.empleado_id
WHERE pedido_id IS NULL;
-- Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
SELECT
    pe.pedido_id,
    SUM(de.precio_unitario * de.cantidad) AS total_gastado
FROM
    pedidos AS pe
JOIN
    detalles_pedidos AS de ON pe.pedido_id = de.pedido_id
GROUP BY
    pe.pedido_id;
-- Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.
SELECT
    us.nombre AS nombre_usuario,
    pr.nombre AS nombre_producto
FROM
    usuarios AS us
CROSS JOIN
    productos AS pr;
-- Encuentra los nombres de los clientes y los productos que han comprado, si existen, incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`. 
SELECT
    us.nombre AS nombre_cliente,
    pr.nombre AS nombre_producto
FROM
    usuarios AS us
LEFT JOIN
    pedidos AS pe ON us.usuario_id = pe.cliente_id
LEFT JOIN
    detalles_pedidos AS de ON pe.pedido_id = de.pedido_id
LEFT JOIN
    productos AS pr ON de.producto_id = pr.producto_id;


-- Listar todos los proveedores que suministran un determinado producto.
SELECT 
    pr.nombre,
    po.nombre
FROM
    proveedores AS pr
JOIN
    proveedores_productos AS pro ON pr.proveedor_id = pro.proveedor_id
JOIN 
    productos AS po ON pro.producto_id =  po.producto_id;

-- Obtener todos los productos que ofrece un proveedor específico.
SELECT 
    pr.nombre,
    po.nombre
FROM
    proveedores AS pr
JOIN
    proveedores_productos AS pro ON pr.proveedor_id = pro.proveedor_id
JOIN 
    productos AS po ON pro.producto_id =  po.producto_id
WHERE pr.nombre = 'Tech Supplies S.A.'

-- Lista los proveedores que no están asociados a ningún producto (es decir, que aún no suministran).
SELECT 
    pr.nombre,
    po.nombre
FROM
    proveedores AS pr
LEFT JOIN
    proveedores_productos AS pro ON pr.proveedor_id = pro.proveedor_id
LEFT JOIN 
    productos AS po ON pro.producto_id =  po.producto_id
WHERE po.nombre IS NULL

-- Contar cuántos proveedores tiene cada producto.
SELECT
    p.nombre AS nombre_producto,
    COUNT(DISTINCT pp.proveedor_id) AS numero_de_proveedores
FROM
    productos AS p
LEFT JOIN
    proveedores_productos AS pp ON p.producto_id = pp.producto_id
GROUP BY
    p.nombre
ORDER BY
    p.nombre;

-- Lista los proveedores que no están asociados a ningún producto (es decir, que aún no suministran).
SELECT 
    *
FROM
    proveedores AS pr
WHERE proveedor_id NOT IN (
    SELECT proveedor_id FROM proveedores_productos
) 

SELECT * FROM proveedores;
SELECT * FROM proveedores_productos;

SELECT * FROM productos;

-- Para un proveedor determinado (p. ej. `proveedor_id = 3`), muestra el nombre de todos los productos que suministra.
    pro.nombre AS Producto,
    pr.nombre AS Proveedor
FROM proveedores_productos ppr
JOIN proveedores pr ON pr.proveedor_id = ppr.proveedor_id
JOIN productos pro ON pro.producto_id = ppr.producto_id
WHERE pr.proveedor_id = 3;

-- Para un producto específico (p. ej. `producto_id = 1`), muestra todos los proveedores que lo distribuyen, con sus datos de contacto.

SELECT 
    pro.nombre AS Producto,
    pr.nombre AS Proveedor
FROM proveedores_productos ppr
JOIN proveedores pr ON pr.proveedor_id = ppr.proveedor_id
JOIN productos pro ON pro.producto_id = ppr.producto_id
WHERE pro.producto_id = 1;

-- Cuenta cuántos proveedores tiene cada producto, listando `producto_id`, `nombre` y `cantidad_proveedores`.
SELECT 
    pr.nombre,
    COUNT(pro.proveedor_id) AS total_provedores
FROM 
    productos AS pr
JOIN 
    proveedores_productos AS pro ON pr.producto_id = pro.producto_id
JOIN
    productos AS du ON  pro.producto_id = du.producto_id
GROUP BY pr.nombre

-- Cuenta cuántos productos suministra cada proveedor, mostrando `proveedor_id`, `nombre_proveedor` y `total_productos`.
SELECT
    ps.nombre AS nombre_producto,
    pro.nombre AS nombre_proveedor,
    ps.stock,
    COUNT(pr.proveedor_id) AS numero_de_entradas
FROM
    productos AS ps
JOIN
    proveedores_productos AS pr ON ps.producto_id = pr.producto_id
JOIN
    proveedores AS pro ON pr.proveedor_id = pro.proveedor_id
GROUP BY
    ps.nombre, pro.nombre, ps.stock
ORDER BY
    ps.nombre, pro.nombre;