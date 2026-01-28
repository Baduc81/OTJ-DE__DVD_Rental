USE ROLE ACCOUNTADMIN;

-- category / film / bridges
CREATE OR REPLACE STREAM dvd_rental.bronze.category_strm
  ON TABLE bronze.category
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.film_strm
  ON TABLE bronze.film
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.film_category_strm
  ON TABLE bronze.film_category
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.language_strm
  ON TABLE bronze.language
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.film_actor_strm
  ON TABLE bronze.film_actor
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

-- address hierarchy & people
CREATE OR REPLACE STREAM dvd_rental.bronze.address_strm
  ON TABLE bronze.address
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.city_strm
  ON TABLE bronze.city
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.country_strm
  ON TABLE bronze.country
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.customer_strm
  ON TABLE bronze.customer
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.actor_strm
  ON TABLE bronze.actor
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.staff_strm
  ON TABLE bronze.staff
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

-- store & inventory & transactions
CREATE OR REPLACE STREAM dvd_rental.bronze.store_strm
  ON TABLE bronze.store
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.inventory_strm
  ON TABLE bronze.inventory
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.rental_strm
  ON TABLE bronze.rental
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

CREATE OR REPLACE STREAM dvd_rental.bronze.payment_strm
  ON TABLE bronze.payment
  APPEND_ONLY = TRUE
  SHOW_INITIAL_ROWS = FALSE;

SHOW STREAMS IN dvd_rental.bronze;