
-- Category Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.category (
    category_id      INTEGER,
    category_name    VARCHAR,
    valid_from       TIMESTAMPNTZ,
    valid_to         TIMESTAMPNTZ,
    is_current       BOOLEAN,
    is_delete        BOOLEAN,
    record_hash      VARCHAR
);


-- Film Category Bridge Table

CREATE OR REPLACE TABLE dvd_rental.silver.film_category (
    film_category_id VARCHAR,
    film_id          INTEGER,
    category_id      INTEGER,
    valid_from       TIMESTAMPNTZ,
    valid_to         TIMESTAMPNTZ,
    is_current       BOOLEAN,
    is_delete        BOOLEAN,
    record_hash      VARCHAR
);


-- Film Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.film (
    film_id           INTEGER,
    title             VARCHAR,
    film_description  VARCHAR,
    release_year      INTEGER,
    language_id       INTEGER,
    rental_duration   FLOAT,
    rental_rate       FLOAT,
    film_length       INTEGER,
    replacement_cost  FLOAT,
    rating            VARCHAR,
    special_features  VARCHAR,
    film_fulltext     VARCHAR,
    valid_from        TIMESTAMPNTZ,
    valid_to          TIMESTAMPNTZ,
    is_current        BOOLEAN,
    is_delete         BOOLEAN,
    record_hash       VARCHAR
);


-- Payment Fact Table

CREATE OR REPLACE TABLE dvd_rental.silver.payment (
    payment_id   INTEGER,
    customer_id  INTEGER,
    staff_id     INTEGER,
    rental_id    INTEGER,
    amount       FLOAT,
    valid_from   TIMESTAMPNTZ,
    valid_to     TIMESTAMPNTZ,
    is_current   BOOLEAN,
    is_delete    BOOLEAN,
    record_hash  VARCHAR
);


-- Film Actor Bridge Table

CREATE OR REPLACE TABLE dvd_rental.silver.film_actor (
    film_actor_id VARCHAR,
    actor_id      INTEGER,
    film_id       INTEGER,
    valid_from    TIMESTAMPNTZ,
    valid_to      TIMESTAMPNTZ,
    is_current    BOOLEAN,
    is_delete     BOOLEAN,
    record_hash   VARCHAR
);


-- Customer Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.customer (
    customer_id  INTEGER,
    store_id     INTEGER,
    first_name   VARCHAR,
    last_name    VARCHAR,
    email        VARCHAR,
    address_id   INTEGER,
    activebool   VARCHAR,
    create_date  VARCHAR,
    active       VARCHAR,
    valid_from   TIMESTAMPNTZ,
    valid_to     TIMESTAMPNTZ,
    is_current   BOOLEAN,
    is_delete    BOOLEAN,
    record_hash  VARCHAR
);


-- Address Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.address (
    address_id   INTEGER,
    address      VARCHAR,
    address2     VARCHAR,
    district     VARCHAR,
    city_id      INTEGER,
    postal_code  VARCHAR,
    phone        VARCHAR,
    valid_from   TIMESTAMPNTZ,
    valid_to     TIMESTAMPNTZ,
    is_current   BOOLEAN,
    is_delete    BOOLEAN,
    record_hash  VARCHAR
);


-- Staff Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.staff (
    staff_id      INTEGER,
    first_name    VARCHAR,
    last_name     VARCHAR,
    address_id    INTEGER,
    email         VARCHAR,
    store_id      INTEGER,
    active        BOOLEAN,
    username      VARCHAR,
    staff_password VARCHAR,
    picture       VARCHAR,
    valid_from    TIMESTAMPNTZ,
    valid_to      TIMESTAMPNTZ,
    is_current    BOOLEAN,
    is_delete     BOOLEAN,
    record_hash   VARCHAR
);


-- City Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.city (
    city_id     INTEGER,
    city        VARCHAR,
    country_id  INTEGER,
    valid_from  TIMESTAMPNTZ,
    valid_to    TIMESTAMPNTZ,
    is_current  BOOLEAN,
    is_delete   BOOLEAN,
    record_hash VARCHAR
);


-- Country Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.country (
    country_id  INTEGER,
    country     VARCHAR,
    valid_from  TIMESTAMPNTZ,
    valid_to    TIMESTAMPNTZ,
    is_current  BOOLEAN,
    is_delete   BOOLEAN,
    record_hash VARCHAR
);


-- Actor Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.actor (
    actor_id    INTEGER,
    first_name  VARCHAR,
    last_name   VARCHAR,
    valid_from  VARCHAR,
    valid_to    TIMESTAMPNTZ,
    is_current  BOOLEAN,
    is_delete   BOOLEAN,
    record_hash VARCHAR
);


-- Rental Fact Table

CREATE OR REPLACE TABLE dvd_rental.silver.rental (
    rental_id    INTEGER,
    rental_date  TIMESTAMPNTZ,
    inventory_id INTEGER,
    customer_id  INTEGER,
    return_date  VARCHAR,
    staff_id     INTEGER,
    valid_from   TIMESTAMPNTZ,
    valid_to     TIMESTAMPNTZ,
    is_current   BOOLEAN,
    is_delete    BOOLEAN,
    record_hash  VARCHAR
);


-- Language Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.language (
    language_id   INTEGER,
    language_name VARCHAR,
    valid_from    TIMESTAMPNTZ,
    valid_to      TIMESTAMPNTZ,
    is_current    BOOLEAN,
    is_delete     BOOLEAN,
    record_hash   VARCHAR
);


-- Inventory Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.inventory (
    inventory_id INTEGER,
    film_id      INTEGER,
    store_id     INTEGER,
    valid_from   TIMESTAMPNTZ,
    valid_to     TIMESTAMPNTZ,
    is_current   BOOLEAN,
    is_delete    BOOLEAN,
    record_hash  VARCHAR
);


-- Store Dimension Table

CREATE OR REPLACE TABLE dvd_rental.silver.store (
    store_id         INTEGER,
    manager_staff_id INTEGER,
    address_id       INTEGER,
    valid_from       VARCHAR,
    valid_to         TIMESTAMPNTZ,
    is_current       BOOLEAN,
    is_delete        BOOLEAN,
    record_hash      VARCHAR
);