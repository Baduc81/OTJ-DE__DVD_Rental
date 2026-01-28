USE ROLE ACCOUNTADMIN;

-- CATEGORY
CREATE OR REPLACE TASK dvd_rental.bronze.category_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.category (category_id, category_name, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS category_id,
    $2 AS category_name,
    $3 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/category/
  WHERE METADATA$FILENAME ILIKE '%category%.csv'
);

-- FILM_CATEGORY
CREATE OR REPLACE TASK dvd_rental.bronze.film_category_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.film_category (film_category_id, film_id, category_id, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    CONCAT_WS('-', $1, $2) AS film_category_id,
    $1 AS film_id,
    $2 AS category_id,
    $3 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/film_category/
  WHERE METADATA$FILENAME ILIKE '%film_category%.csv'
);

-- FILM
CREATE OR REPLACE TASK dvd_rental.bronze.film_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.film (
  film_id, title, film_description, release_year, language_id,
  rental_duration, rental_rate, film_length, replacement_cost, rating,
  valid_from, special_features, fulltext, file_name, load_timestamp
)
FROM (
  SELECT
    $1 AS film_id,
    $2 AS title,
    $3 AS film_description,
    $4 AS release_year,
    $5 AS language_id,
    $6 AS rental_duration,
    $7 AS rental_rate,
    $8 AS film_length,
    $9 AS replacement_cost,
    $10 AS rating,
    $11 AS valid_from,
    $12 AS special_features,
    $13 AS fulltext,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/film/
  WHERE METADATA$FILENAME ILIKE '%film%.csv'
);

-- PAYMENT
CREATE OR REPLACE TASK dvd_rental.bronze.payment_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.payment (payment_id, customer_id, staff_id, rental_id, amount, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS payment_id,
    $2 AS customer_id,
    $3 AS staff_id,
    $4 AS rental_id,
    $5 AS amount,
    $6 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/payment/
  WHERE METADATA$FILENAME ILIKE '%payment%.csv'
);

-- FILM_ACTOR
CREATE OR REPLACE TASK dvd_rental.bronze.film_actor_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.film_actor (actor_id, film_id, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    CONCAT_WS('-', $1, $2) AS film_category_id,
    $1 AS actor_id,
    $2 AS film_id,
    $3 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/film_actor/
  WHERE METADATA$FILENAME ILIKE '%film_actor%.csv'
);

-- CUSTOMER
CREATE OR REPLACE TASK dvd_rental.bronze.customer_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.customer (
  customer_id, store_id, first_name, last_name, email, address_id,
  activebool, create_date, valid_from, active, file_name, load_timestamp
)
FROM (
  SELECT
    $1 AS customer_id,
    $2 AS store_id,
    $3 AS first_name,
    $4 AS last_name,
    $5 AS email,
    $6 AS address_id,
    $7 AS activebool,
    $8 AS create_date,
    $9 AS valid_from,
    $10 AS active,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/customer/
  WHERE METADATA$FILENAME ILIKE '%customer%.csv'
);

-- ADDRESS
CREATE OR REPLACE TASK dvd_rental.bronze.address_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.address (
  address_id, address, address2, district, city_id, postal_code, phone,
  valid_from, file_name, load_timestamp
)
FROM (
  SELECT
    $1 AS address_id,
    $2 AS address,
    $3 AS address2,
    $4 AS district,
    $5 AS city_id,
    $6 AS postal_code,
    $7 AS phone,
    $8 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/address/
  WHERE METADATA$FILENAME ILIKE '%address%.csv'
);

-- STAFF
CREATE OR REPLACE TASK dvd_rental.bronze.staff_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.staff (
  staff_id, first_name, last_name, address_id, email, store_id,
  active, username, staff_password, valid_from, picture, file_name, load_timestamp
)
FROM (
  SELECT
    $1 AS staff_id,
    $2 AS first_name,
    $3 AS last_name,
    $4 AS address_id,
    $5 AS email,
    $6 AS store_id,
    $7 AS active,
    $8 AS username,
    $9 AS staff_password,
    $10 AS valid_from,
    $11 AS picture,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/staff/
  WHERE METADATA$FILENAME ILIKE '%staff%.csv'
);

-- CITY
CREATE OR REPLACE TASK dvd_rental.bronze.city_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.city (city_id, city, country_id, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS city_id,
    $2 AS city,
    $3 AS country_id,
    $4 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/city/
  WHERE METADATA$FILENAME ILIKE '%city%.csv'
);

-- COUNTRY
CREATE OR REPLACE TASK dvd_rental.bronze.country_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.country (country_id, country, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS country_id,
    $2 AS country,
    $3 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/country/
  WHERE METADATA$FILENAME ILIKE '%country%.csv'
);

-- ACTOR
CREATE OR REPLACE TASK dvd_rental.bronze.actor_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.actor (actor_id, first_name, last_name, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS actor_id,
    $2 AS first_name,
    $3 AS last_name,
    $4 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/actor/
  WHERE METADATA$FILENAME ILIKE '%actor%.csv'
);

-- RENTAL
CREATE OR REPLACE TASK dvd_rental.bronze.rental_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.rental (
  rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, valid_from, file_name, load_timestamp
)
FROM (
  SELECT
    $1 AS rental_id,
    $2 AS rental_date,
    $3 AS inventory_id,
    $4 AS customer_id,
    $5 AS return_date,
    $6 AS staff_id,
    $7 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/rental/
  WHERE METADATA$FILENAME ILIKE '%rental%.csv'
);

-- LANGUAGE
CREATE OR REPLACE TASK dvd_rental.bronze.language_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.language (language_id, language_name, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS language_id,
    $2 AS language_name,
    $3 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/language/
  WHERE METADATA$FILENAME ILIKE '%language%.csv'
);

-- INVENTORY
CREATE OR REPLACE TASK dvd_rental.bronze.inventory_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.inventory (inventory_id, film_id, store_id, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS inventory_id,
    $2 AS film_id,
    $3 AS store_id,
    $4 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/inventory/
  WHERE METADATA$FILENAME ILIKE '%inventory%.csv'
);

-- STORE
CREATE OR REPLACE TASK dvd_rental.bronze.store_copy_task
  WAREHOUSE = compute_wh
  SCHEDULE  = 'USING CRON 0 0 * * * UTC'
AS
COPY INTO dvd_rental.bronze.store (store_id, manager_staff_id, address_id, valid_from, file_name, load_timestamp)
FROM (
  SELECT
    $1 AS store_id,
    $2 AS manager_staff_id,
    $3 AS address_id,
    $4 AS valid_from,
    METADATA$FILENAME AS file_name,
    CURRENT_TIMESTAMP() AS load_timestamp
  FROM @dvd_rental.bronze.dvd_rental_stage/store/
  WHERE METADATA$FILENAME ILIKE '%store%.csv'
);

SHOW TASKS IN dvd_rental.bronze;