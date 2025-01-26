README - Base de Datos SAKILA + Consultas

DESCRIPCION
La base de datos SAKILA es un esquema diseñado para gestiona una tienda de alquiler de películas. 
Incluye tablas para almacenar datos sobre películas, actores, categorías, clientes, empleados, inventarios, alquileres y pagos, entre otros.

Está compuesta por varias tablas que se relacionan entre sí mediante claves primarias y foráneas.

Los nombre de las tablas son:
- actor
- address
- category
- city
- country
- customer
- film
- film_actor
- film_category
- film_text
- inventory
- language
- payment
- rental
- staff
- store

FUNCIONES PRINCIPALES
Gestión de películas: Detalles sobre títulos, clasificaciones, duraciones y categorías.
Seguimiento de alquileres: Registro de películas alquiladas por clientes y fechas de retorno.
Gestión de clientes: Información personal y actividad de alquiler de los clientes.
Inventario: Control de películas disponibles en cada tienda.
Pagos: Registro de los montos y fechas de pagos realizados por los clientes.

Charset: El conjunto de caracteres utilizado es utf8mb4.

He realizado las siguientes 22 consultas:

-- 1 Todos los nombres de las películas sin que aparezcan duplicados.

-- 2 Los nombres de todas las películas que tengan una clasificación de "PG-13".

-- 3 Título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

-- 4 Título de todas las películas que tengan una duración mayor a 120 minutos.

-- 5 Los nombres de todos los actores.

-- 6 El nombre y apellido de los actores que tengan "Gibson" en su apellido.

-- 7 Los nombres de los actores que tengan un actor_id entre 10 y 20.

-- 8 El título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

-- 9 Cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

-- 10 Cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

-- 11 Cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres

-- 12 Promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

-- 13 Nombre y apellido de los actores que aparecen en la película con title "Indian Love".

-- 14 Título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

-- 15 Actor o actriz que no aparezca en ninguna película en la tabla film_actor.

-- 16 Título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

-- 17 Título de todas las películas que son de la misma categoría que "Family".

-- 18 Nombre y apellido de los actores que aparecen en más de 10 películas.

-- 19 Título de todas las películas que son "R" y tienen una duración mayor a 2 horas en latabla film.

-- 20 Categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.

-- 21 Actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado. 

-- 22 Todas las películas que fueron alquiladas por más de 5 días. Realice una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego seleccione las películas correspondientes.

-- 23 Nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utilizando una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.

-- 24 Título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.






