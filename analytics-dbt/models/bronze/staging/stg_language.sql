select
    language_id,
    language_name,
    valid_from,
    file_name
from {{ source('dvd_rental', 'language_strm') }}