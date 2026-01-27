CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.category_tmp (
    category_id             INTEGER,
    category_name           VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.film_category_tmp (
    film_id                 INTEGER,
    category_id             INTEGER,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.film_tmp (
    film_id                 INTEGER,
    title                   VARCHAR,
    description             VARCHAR,
    release_year            INTEGER,
    language_id             INTEGER,
    rental_duration         FLOAT,
    rental_rate             FLOAT,
    film_length             INTEGER,
    replacement_cost        FLOAT,
    rating                  VARCHAR,
    special_features        VARCHAR,
    fulltext                VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.payment_tmp (
    payment_id              INTEGER,
    customer_id             INTEGER,
    staff_id                INTEGER,
    rental_id               INTEGER,
    amount                  FLOAT,
    payment_date            TIMESTAMPNTZ,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.film_actor_tmp (
    actor_id                INTEGER,
    film_id                 INTEGER,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

-- address hierarchy & people
CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.customer_tmp (
    customer_id             INTEGER,
    store_id                INTEGER,
    first_name              VARCHAR,
    last_name               VARCHAR,
    email                   VARCHAR,
    address_id              INTEGER,
    activebool              VARCHAR,
    create_date             VARCHAR,
    active                  VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.address_tmp (
    address_id              INTEGER,
    address                 VARCHAR,
    address2                VARCHAR,
    district                VARCHAR,
    city_id                 INTEGER,
    postal_code             VARCHAR,
    phone                   VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.staff_tmp (
    staff_id                INTEGER,
    first_name              VARCHAR,
    last_name               VARCHAR,
    address_id              INTEGER,
    email                   VARCHAR,
    store_id                INTEGER,
    active                  BOOLEAN,
    username                VARCHAR,
    staff_password          VARCHAR,
    picture                 VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.city_tmp (
    city_id                INTEGER,
    city                   VARCHAR,
    country_id             INTEGER,
    file_name              VARCHAR,
    valid_from             TIMESTAMPNTZ,
    is_duplicated_version  BOOLEAN,
    is_duplicated_file     BOOLEAN,
    record_hash            VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.country_tmp (
    country_id              INTEGER,
    country                 VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.actor_tmp (
    actor_id                INTEGER,
    first_name              VARCHAR,
    last_name               VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

-- store & inventory & transactions
CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.rental_tmp (
    rental_id               INTEGER,
    rental_date             TIMESTAMPNTZ,
    inventory_id            INTEGER,
    customer_id             INTEGER,
    return_date             VARCHAR,
    staff_id                INTEGER,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.language_tmp (
    language_id             INTEGER,
    language_name           VARCHAR,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);


CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.inventory_tmp (
    inventory_id            INTEGER,
    film_id                 INTEGER,
    store_id                INTEGER,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);

CREATE OR REPLACE TRANSIENT TABLE dvd_rental.bronze.store_tmp (
    store_id                INTEGER,
    manager_staff_id        INTEGER,
    address_id              INTEGER,
    file_name               VARCHAR,
    valid_from              TIMESTAMPNTZ,
    is_duplicated_version   BOOLEAN,
    is_duplicated_file      BOOLEAN,
    record_hash             VARCHAR
);