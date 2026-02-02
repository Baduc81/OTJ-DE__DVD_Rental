select
    city_id,
    city,
    country_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'city_strm') }}