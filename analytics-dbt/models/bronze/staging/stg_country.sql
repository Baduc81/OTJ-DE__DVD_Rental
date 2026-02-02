select
    country_id,
    country,
    valid_from,
    file_name
from {{ source('dvd_rental', 'country_strm') }}