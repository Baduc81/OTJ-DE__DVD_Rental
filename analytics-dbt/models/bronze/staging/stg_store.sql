select
    store_id,
    manager_staff_id,
    address_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'store_strm') }}