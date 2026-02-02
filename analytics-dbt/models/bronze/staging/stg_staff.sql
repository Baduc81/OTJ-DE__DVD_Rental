select 
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    store_id,
    active,
    username,
    staff_password,
    valid_from,
    file_name
from {{ source('dvd_rental', 'staff_strm') }}