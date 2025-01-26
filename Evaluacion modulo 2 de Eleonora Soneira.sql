-- 1 Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title as Nombre_Peliculas
FROM film;

-- 2 Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title as Pelicula, rating AS Clasificacion
FROM film
WHERE rating = 'PG-13';

-- 3 Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title as Pelicula, description AS descripcion
FROM film
WHERE description LIKE '%amazing%';

-- 4 Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title as Pelicula, length AS duracion_minutos
FROM film
WHERE length > 120; -- igual o mas larga que 120 minutos

-- 5 Recupera los nombres de todos los actores.
-- elegi unir los apellidos primero con los nombres y ordenarlos por apellido

SELECT CONCAT(last_name, ' ',first_name) AS Apellido_Nombre_Actores
FROM actor
ORDER BY Apellido_Nombre_Actores;

-- 6 Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT last_name AS Apellido, first_name AS Nombre
FROM actor
WHERE last_name = "Gibson";

-- 7 Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
-- el between incluye los valores 10 y 20
SELECT actor_id, first_name AS Nombre, last_name AS Apellido
FROM actor
WHERE actor_id BETWEEN 10 AND 20
ORDER BY actor_id;

-- 8 Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title as Nombre_Pelicula, rating AS Clasificacion
FROM film
WHERE rating NOT IN ('R', 'PG-13')
ORDER BY clasificacion;

-- 9 Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT rating AS Clasificacion, COUNT(film_id) AS Total_Peliculas
FROM film
GROUP BY rating;

-- 10 Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT  c.customer_id AS ID_Cliente, c.first_name AS Nombre, c.last_name AS Apellido, COUNT(r.rental_id) AS Peliculas_Alquiladas
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY Peliculas_Alquiladas DESC;

-- 11 Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres

SELECT  cat.name AS Nombre_Categoria, COUNT(r.rental_id) AS Total_Alquileres
FROM category cat
INNER JOIN film_category fc ON cat.category_id = fc.category_id
INNER JOIN inventory i ON fc.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY cat.name
ORDER BY Total_Alquileres DESC;

-- 12 Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT  rating AS Clasificacion, AVG(length) AS Promedio_Duracion
FROM film
GROUP BY clasificacion
ORDER BY Promedio_Duracion ASC;

-- 13 Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT a.first_name AS Nombre, a.Last_name AS Apellido, f.title AS Pelicula
FROM Actor a 
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title= "Indian Love";

-- 14 Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT  title AS Nombre_Pelicula, description AS Descripcion_Pelicula
FROM film
WHERE description LIKE "%dog%" OR description LIKE "%cat%";

-- 15 Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
SELECT first_name AS Nombre, last_name AS Apellido
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;

-- 16 Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title as Nombre_Pelicula, release_year as Anio_Lanzamiento
FROM film
WHERE release_year BETWEEN 2005 AND 2010;
-- otra forma: WHERE release_year >= 2005 AND release_year <= 2010;

-- 17 Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT f.title as Nombre_Pelicula, c.name as Categoria
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.name = "Family";

-- 18 Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT CONCAT(a.last_name, ' ',a.first_name) AS Apellido_Nombre_Actor, COUNT(fa.film_id) AS Cantidad_Peliculas
FROM actor a
INNER JOIN film_actor fa on fa.actor_id = a.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id)>10
ORDER BY Cantidad_Peliculas ASC;

-- 19 Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en latabla film.
SELECT title as Nombre_Pelicula, rating, length as Duracion
FROM film
WHERE rating = "R" and length > 120;

-- 20 Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT c.name as Categoria, AVG(length) as Promedio_Duracion
FROM category c
INNER JOIN film_category fc on fc.category_id= c.category_id
INNER JOIN film f on f.film_id = fc.film_id
GROUP BY fc.category_id
HAVING AVG(length)> 120;

-- 21 Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado. 
SELECT a.first_name AS Nombre, a.last_name AS Apellido, COUNT(fa.film_id) as Cantidad_Peliculas
FROM actor a
INNER JOIN film_actor fa ON a.actor_id=fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id)>=5
ORDER BY Cantidad_Peliculas ASC;

-- 22 Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
-- Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
-- HABIA VARIAS PELICULAS REPETIDAS XQ HABIAN SIDO VARIAS VECES ALQUILADAS POR MAS DE 5 DIAS, POR ESO EL DISTINCT
SELECT DISTINCT title AS Nombre_Pelicula
FROM film f 
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE DATEDIFF(r.return_date, r.rental_date) > 5;

-- 23 Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
-- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
SELECT a.first_name AS Nombre, a.last_name AS Apellido
FROM actor a
WHERE a.actor_id NOT IN (SELECT DISTINCT fa.actor_id
				FROM film_actor fa
				INNER JOIN film_category fc ON fa.film_id = fc.film_id
				INNER JOIN category c ON fc.category_id = c.category_id
				WHERE c.name = 'Horror');

-- 24 Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
-- LA TABLA DE CONEXION ENTRE FILM Y CATEGORY SIEMPRE ERA FILM CATEGORY
SELECT f.title AS Nombre_Pelicula
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy' AND f.length > 180;

