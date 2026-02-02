select
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'rental_strm') }}