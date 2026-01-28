USE ROLE ACCOUNTADMIN;

-- category / film / bridges
CREATE OR REPLACE TABLE dvd_rental.bronze.category (
    category_id             INTEGER,
    category_name           VARCHAR,
    valid_from              TIMESTAMP_NTZ,
    file_name               VARCHAR,
    load_timestamp          TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.film_category (
    film_category_id    VARCHAR,
    film_id             INTEGER,
    category_id         INTEGER,
    valid_from          TIMESTAMP_NTZ,
    file_name           VARCHAR,
    load_timestamp      TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE dvd_rental.bronze.film (
    film_id             INTEGER,
    title               VARCHAR,
    film_description    VARCHAR,
    release_year        INTEGER,
    language_id         INTEGER,
    rental_duration     FLOAT,
    rental_rate         FLOAT,
    film_length         INTEGER,
    replacement_cost    FLOAT,
    rating              VARCHAR,
    valid_from          TIMESTAMP_NTZ,
    special_features    VARCHAR,
    film_fulltext       VARCHAR,
    file_name           VARCHAR,
    load_timestamp      TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE dvd_rental.bronze.payment (
    payment_id         INTEGER,
    customer_id        INTEGER,
    staff_id           INTEGER,
    rental_id          INTEGER,
    amount             FLOAT,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.film_actor (
    film_actor_id      VARCHAR,
    actor_id           INTEGER,
    film_id            INTEGER,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()    
);

-- address hierarchy & people
CREATE OR REPLACE TABLE dvd_rental.bronze.customer (
    customer_id        INTEGER,
    store_id           INTEGER,
    first_name         VARCHAR,
    last_name          VARCHAR,
    email              VARCHAR,
    address_id         INTEGER,
    activebool         VARCHAR,
    create_date        VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    active             VARCHAR,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.address (
    address_id         INTEGER,
    address            VARCHAR,
    address2           VARCHAR,
    district           VARCHAR,
    city_id            INTEGER,
    postal_code        VARCHAR,
    phone              VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE dvd_rental.bronze.staff (
    staff_id           INTEGER,
    first_name         VARCHAR,
    last_name          VARCHAR,
    address_id         INTEGER,
    email              VARCHAR,
    store_id           INTEGER,
    active             BOOLEAN,
    username           VARCHAR,
    staff_password     VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    picture            VARCHAR,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.city (
    city_id            INTEGER,
    city               VARCHAR,
    country_id         INTEGER,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.country (
    country_id         INTEGER,
    country            VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.actor (
    first_name         VARCHAR,
    actor_id           INTEGER,
    last_name          VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

-- store & inventory & transactions
CREATE OR REPLACE TABLE dvd_rental.bronze.rental (
    rental_id          INTEGER,
    rental_date        TIMESTAMP_LTZ,
    inventory_id       INTEGER,
    customer_id        INTEGER,
    return_date        VARCHAR,
    staff_id           INTEGER,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE dvd_rental.bronze.language (
    language_id        INTEGER,
    language_name      VARCHAR,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);


CREATE OR REPLACE TABLE dvd_rental.bronze.inventory (
    inventory_id        INTEGER,
    film_id             INTEGER,
    store_id            INTEGER,
    valid_from          TIMESTAMP_NTZ,
    file_name           VARCHAR,
    load_timestamp      TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE dvd_rental.bronze.store (
    store_id           INTEGER,
    manager_staff_id   INTEGER,
    address_id         INTEGER,
    valid_from         TIMESTAMP_NTZ,
    file_name          VARCHAR,
    load_timestamp     TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

SHOW TABLES IN dvd_rental.bronze;