select
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    address_id,
    activebool,
    create_date,
    valid_from,
    active,
    file_name
from {{ source('dvd_rental', 'customer_strm') }}