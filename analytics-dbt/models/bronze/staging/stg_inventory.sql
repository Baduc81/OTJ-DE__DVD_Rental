select
    inventory_id,
    film_id,
    store_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'inventory_strm') }}