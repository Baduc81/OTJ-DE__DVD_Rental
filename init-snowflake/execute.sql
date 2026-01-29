-- CATEGORY
EXECUTE TASK dvd_rental.bronze.category_copy_task;
SELECT * FROM dvd_rental.bronze.category LIMIT 5;
SELECT * FROM dvd_rental.bronze.category_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.category_copy_task;

-- FILM CATEGORY
EXECUTE TASK dvd_rental.bronze.film_category_copy_task;
SELECT * FROM dvd_rental.bronze.film_category LIMIT 5;
SELECT * FROM dvd_rental.bronze.film_category_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.film_category_copy_task;

-- FILM
EXECUTE TASK dvd_rental.bronze.film_copy_task;
SELECT * FROM dvd_rental.bronze.film LIMIT 5;
SELECT * FROM dvd_rental.bronze.film_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.film_copy_task;

-- PAYMENT
EXECUTE TASK dvd_rental.bronze.payment_copy_task;
SELECT * FROM dvd_rental.bronze.payment LIMIT 5;
SELECT * FROM dvd_rental.bronze.payment_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.payment_copy_task;

-- FILM ACTOR
EXECUTE TASK dvd_rental.bronze.film_actor_copy_task;
SELECT * FROM dvd_rental.bronze.film_actor LIMIT 5;
SELECT * FROM dvd_rental.bronze.film_actor_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.film_actor_copy_task;

-- CUSTOMER
EXECUTE TASK dvd_rental.bronze.customer_copy_task;
SELECT * FROM dvd_rental.bronze.customer LIMIT 5;
SELECT * FROM dvd_rental.bronze.customer_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.customer_copy_task;

-- ADDRESS
EXECUTE TASK dvd_rental.bronze.address_copy_task;
SELECT * FROM dvd_rental.bronze.address LIMIT 5;
SELECT * FROM dvd_rental.bronze.address_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.address_copy_task;

-- STAFF
EXECUTE TASK dvd_rental.bronze.staff_copy_task;
SELECT * FROM dvd_rental.bronze.staff LIMIT 5;
SELECT * FROM dvd_rental.bronze.staff_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.staff_copy_task;

-- CITY
EXECUTE TASK dvd_rental.bronze.city_copy_task;
SELECT * FROM dvd_rental.bronze.city LIMIT 5;
SELECT * FROM dvd_rental.bronze.city_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.city_copy_task;

-- COUNTRY
EXECUTE TASK dvd_rental.bronze.country_copy_task;
SELECT * FROM dvd_rental.bronze.country LIMIT 5;
SELECT * FROM dvd_rental.bronze.country_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.country_copy_task;

-- ACTOR
EXECUTE TASK dvd_rental.bronze.actor_copy_task;
SELECT * FROM dvd_rental.bronze.actor LIMIT 5;
SELECT * FROM dvd_rental.bronze.actor_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.actor_copy_task;

-- RENTAL
EXECUTE TASK dvd_rental.bronze.rental_copy_task;
SELECT * FROM dvd_rental.bronze.rental LIMIT 5;
SELECT * FROM dvd_rental.bronze.rental_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.rental_copy_task;

-- LANGUAGE
EXECUTE TASK dvd_rental.bronze.language_copy_task;
SELECT * FROM dvd_rental.bronze.language LIMIT 5;
SELECT * FROM dvd_rental.bronze.language_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.language_copy_task;

-- INVENTORY
EXECUTE TASK dvd_rental.bronze.inventory_copy_task;
SELECT * FROM dvd_rental.bronze.inventory LIMIT 5;
SELECT * FROM dvd_rental.bronze.inventory_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.inventory_copy_task;

-- STORE
EXECUTE TASK dvd_rental.bronze.store_copy_task;
SELECT * FROM dvd_rental.bronze.store LIMIT 5;
SELECT * FROM dvd_rental.bronze.store_strm LIMIT 5;
DESCRIBE TASK dvd_rental.bronze.store_copy_task;