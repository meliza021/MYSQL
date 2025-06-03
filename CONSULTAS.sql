-- 1.Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.
SELECT * FROM usuarios;
SELECT * FROM usuarios
WHERE tipo_id = 1;
-- Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
SELECT nombre,email FROM usuarios
WHERE ciudad = 'Madrid';