USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE TABLE dvd_rental.bronze.category_rejected (
    category_id    INTEGER,
    category_name  VARCHAR,
    file_name      VARCHAR,
    valid_from     TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.film_category_rejected (
    film_category_id    VARCHAR,
    film_id             INTEGER,
    category_id         INTEGER,
    file_name           VARCHAR,
    valid_from          TIMESTAMPNTZ
);

CREATE OR REPLACE TABLE dvd_rental.bronze.film_rejected (
    film_id            INTEGER,
    title              VARCHAR,
    film_description   VARCHAR,
    release_year       INTEGER,
    language_id        INTEGER,
    rental_duration    FLOAT,
    rental_rate        FLOAT,
    film_length        INTEGER,
    replacement_cost   FLOAT,
    rating             VARCHAR,
    special_features   VARCHAR,
    film_fulltext      VARCHAR,
    file_name          VARCHAR,
    valid_from         TIMESTAMPNTZ
);

CREATE OR REPLACE TABLE dvd_rental.bronze.payment_rejected (
    payment_id      INTEGER,
    customer_id     INTEGER,
    staff_id        INTEGER,
    rental_id       INTEGER,
    amount          FLOAT,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.film_actor_rejected (
    film_actor_id   VARCHAR,
    actor_id        INTEGER,
    film_id         INTEGER,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);

-- address hierarchy & people
CREATE OR REPLACE TABLE dvd_rental.bronze.customer_rejected (
    customer_id     INTEGER,
    store_id        INTEGER,
    first_name      VARCHAR,
    last_name       VARCHAR,
    email           VARCHAR,
    address_id      INTEGER,
    activebool      VARCHAR,
    create_date     VARCHAR,
    active          VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.address_rejected (
    address_id      INTEGER,
    address         VARCHAR,
    address2        VARCHAR,
    district        VARCHAR,
    city_id         INTEGER,
    postal_code     VARCHAR,
    phone           VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);

CREATE OR REPLACE TABLE dvd_rental.bronze.staff_rejected (
    staff_id        INTEGER,
    first_name      VARCHAR,
    last_name       VARCHAR,
    address_id      INTEGER,
    email           VARCHAR,
    store_id        INTEGER,
    active          BOOLEAN,
    username        VARCHAR,
    staff_password  VARCHAR,
    picture         VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.city_rejected (
    city_id         INTEGER,
    city            VARCHAR,
    country_id      INTEGER,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.country_rejected (
    country_id      INTEGER,
    country         VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.actor_rejected (
    actor_id        INTEGER,
    first_name      VARCHAR,
    last_name       VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);

-- store & inventory & transactions
CREATE OR REPLACE TABLE dvd_rental.bronze.rental_rejected (
    rental_id       INTEGER,
    rental_date     TIMESTAMPNTZ,
    inventory_id    INTEGER,
    customer_id     INTEGER,
    return_date     VARCHAR,
    staff_id        INTEGER,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);

CREATE OR REPLACE TABLE dvd_rental.bronze.language_rejected (
    language_id     INTEGER,
    language_name   VARCHAR,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);


CREATE OR REPLACE TABLE dvd_rental.bronze.inventory_rejected (
    inventory_id    INTEGER,
    film_id         INTEGER,
    store_id        INTEGER,
    file_name       VARCHAR,
    valid_from      TIMESTAMPNTZ
);

CREATE OR REPLACE TABLE dvd_rental.bronze.store_rejected (
    store_id           INTEGER,
    manager_staff_id   INTEGER,
    address_id         INTEGER,
    file_name         VARCHAR,
    valid_from        TIMESTAMPNTZ
);

SHOW TABLES IN dvd_rental.bronze;