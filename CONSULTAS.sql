-- 1.Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.
SELECT * FROM usuarios;
SELECT * FROM usuarios
WHERE tipo_id = 1;
-- Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
SELECT nombre,email FROM usuarios
WHERE ciudad = 'Madrid';

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
