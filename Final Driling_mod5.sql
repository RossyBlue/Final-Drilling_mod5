-- Customer - insertar, modificar, eliminar
INSERT INTO public.customer
(store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES(3, 'Peggy', 'Morales', 'rjrkifogo@gmail.com', 410, true, '2006-02-14', '2013-05-26', 2);

UPDATE public.customer
SET store_id=3, first_name='Cinthia', last_name='Stockebrand', email='cstock@gmail.com', address_id=500, activebool=true, create_date='2023-06-09'::date, last_update=now(), active=0
WHERE customer_id= (3004);

DELETE FROM public.customer
WHERE customer_id= (3004);


-- Staff - insertar, modificar, eliminar
INSERT INTO public.staff
(first_name, last_name, address_id, email, store_id, active, username, "password", last_update, picture)
VALUES('Carlos', 'Araya', 5, 'caraya@gmail.com', 3, true, 'caraya', '12345', now(), null);

UPDATE public.staff
SET first_name='Andres', last_name='León', address_id=5, email='andy@gmail.com', store_id=3, active=true, username='andy', "password"='678910', last_update=now(), picture= null
WHERE staff_id=(8);

DELETE FROM public.staff
WHERE staff_id= (8);

-- Actor - insertar, modificar, eliminar
INSERT INTO public.actor
(first_name, last_name, last_update)
VALUES('Lionel', 'Messi', now());

UPDATE public.actor
SET first_name='Tom', last_name='Vicuña', last_update=now()
WHERE actor_id=(604);

DELETE FROM public.actor
WHERE actor_id= (604);


-- Listado rental y customer por año y mes 

select rental.rental_date, customer.first_name, customer.last_name
from rental 
join customer on rental.customer_id  = customer.customer_id 
where extract(year from rental.rental_date) = 2005
and extract(month from rental.rental_date) = 05

--Listado payment Número, Fecha y Total de todas las “payment”.

select payment.payment_id, payment.payment_date, sum(payment.amount) as total 
from payment 
group by payment.payment_id; 

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

select film.film_id, film.release_year, film.rental_rate 
from film
where release_year = 2006 and rental_rate > 4.0;


-- Diccionario 
SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.COLUMN_DEFAULT AS columna_defecto,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato,
 COALESCE(t1.NUMERIC_PRECISION,
 t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
 PG_CATALOG.COL_DESCRIPTION(t2.OID,
 t1.DTD_IDENTIFIER::int) AS columna_descripcion,
 t1.DOMAIN_NAME AS columna_dominio
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;
 
