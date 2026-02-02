select
    film_category_id,
    film_id,
    category_id,
    valid_from,
    file_name
from {{ source('dvd_rental', 'film_category_strm')}}