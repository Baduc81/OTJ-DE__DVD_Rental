select 
    first_name,
    actor_id,
    last_name,
    valid_from,
    file_name
from {{ source('dvd_rental', 'actor_strm') }}