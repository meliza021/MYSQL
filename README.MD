🧠 Taller de SQL: Consultas y Subconsultas con MySQL
¡Bienvenido/a al Taller de SQL! En este espacio práctico y guiado aprenderás desde lo más básico hasta técnicas intermedias de consultas SQL, utilizando una base de datos relacional modelada para escenarios reales.

🎯 Objetivos del Taller
Durante este taller aprenderás a:

✅ Realizar consultas SQL básicas para extraer, filtrar y organizar datos.
✅ Aplicar subconsultas en cláusulas como WHERE y FROM para resolver problemas complejos.
✅ Utilizar funciones de agregación y ordenar resultados de manera eficiente.
✅ Crear consultas multitabla usando JOIN para obtener insights más completos.
✅ Diseñar consultas útiles para casos del mundo real.

🧑‍🏫 ¿Qué Vamos a Aprender?
El contenido del taller está organizado en las siguientes secciones:

1️⃣ Consultas Básicas
Aprenderás el uso de SELECT, WHERE, ORDER BY, GROUP BY y funciones agregadas como COUNT, AVG, MAX, SUM.

2️⃣ Subconsultas en WHERE
Descubrirás cómo usar subconsultas para crear filtros avanzados.

3️⃣ Subconsultas en FROM
Explorarás cómo crear tablas temporales a partir de subconsultas y realizar cálculos sobre ellas.

4️⃣ Ejercicios Prácticos
Resolverás desafíos con datos reales para aplicar todo lo aprendido.

🗃️ Estructura de la Base de Datos
Este esquema simula una tienda con múltiples actores:

usuarios: Registro de clientes y empleados.

tipos_usuarios: Identifica si un usuario es cliente o empleado.

empleados: Detalles laborales y salariales.

productos: Catálogo de productos con categorías, precios y stock.

proveedores: Empresas que proveen productos.

proveedores_productos: Relación N:M entre productos y proveedores.

pedidos: Registro de compras realizadas por los clientes.

detalles_pedidos: Detalles individuales de cada producto dentro de un pedido.

🔢 Ejercicios de Consultas
🟢 Consultas Básicas
Ver todos los datos de la tabla usuarios.

Mostrar nombres y correos de clientes de Madrid.

Listar productos con precio mayor a $100.000.

Empleados con salario superior a $2.500.000.

Productos de la categoría Electrónica, ordenados alfabéticamente.

Pedidos en estado "Pendiente".

Producto más caro.

Total de pedidos por cliente.

Promedio de salario de empleados.

Número de productos por categoría.

Productos con precio en USD (1 USD = 3750 COP, por ejemplo).

Listado de todos los proveedores.

🔗 Consultas Multitabla (JOINs)
Clientes y detalles de sus pedidos.

Productos pedidos y su precio unitario.

Clientes y empleados que gestionaron sus pedidos.

Pedidos con y sin productos (LEFT JOIN).

Productos y detalles de pedidos inexistentes (RIGHT JOIN).

Empleados y pedidos gestionados (LEFT JOIN).

Empleados sin pedidos.

Total gastado por pedido.

CROSS JOIN entre clientes y productos.

Clientes y productos comprados (incluye clientes sin compras).

Proveedores de un producto.

Productos de un proveedor específico.

Proveedores sin productos.

Cantidad de proveedores por producto.

Productos suministrados por el proveedor_id = 3.

Proveedores que distribuyen el producto_id = 1.

Número de proveedores por producto.

Productos por proveedor.

🔍 Subconsultas
Clientes con pedidos mayores a $500.000.

Productos nunca pedidos.

Empleados que gestionaron pedidos en los últimos 6 meses.

Pedido con mayor total en ventas.

Clientes con más pedidos que el promedio.

Productos con precio superior al promedio.

Clientes con gasto total mayor a $1.000.000.

Empleados con salario superior al promedio.

Productos con ingresos mayores al ingreso promedio.

Cliente del pedido más reciente.

Productos pedidos en los últimos 3 meses.

Empleados sin pedidos.

Clientes que compraron más de 3 tipos de productos distintos.

Producto más caro pedido al menos 5 veces.

Clientes cuyo primer pedido fue un año después de su registro.

Productos con stock inferior al promedio.

Clientes con menos de 3 pedidos.

Productos comprados por clientes registrados en el último año.

Empleado con más pedidos gestionados.

Productos con cantidades compradas superiores al promedio.

Proveedores con más productos que el promedio.

Proveedores que solo suministran productos de categoría "Electrónica".

Productos con proveedores registrados hace más de un año.

📦 Datos de Ejemplo
El dataset incluye información completa y realista con:

+20 clientes de diferentes ciudades y países.

+20 empleados con cargos y salarios variados.

+20 productos de categorías como Electrónica, Muebles, Hogar, etc.

+20 proveedores de distintas ciudades.

Relación de productos con proveedores y múltiples pedidos con detalles.

Esto permite trabajar con consultas ricas en relaciones y volumen, ideales para practicar habilidades reales de análisis de datos.

🧪 ¿Listo para practicar?
Este entorno está preparado para que explores, experimentes y mejores tu dominio de SQL en un contexto empresarial completo y realista.

¡A escribir consultas como un profesional! 🚀