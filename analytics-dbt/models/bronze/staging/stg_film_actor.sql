select
    film_actor_id,
    actor_id,
    film_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'film_actor_strm') }}