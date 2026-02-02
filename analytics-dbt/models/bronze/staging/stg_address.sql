select
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    valid_from,
    file_name
from {{ source('dvd_rental', 'address_strm') }}