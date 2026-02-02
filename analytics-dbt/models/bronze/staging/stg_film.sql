select
    film_id,
    title,
    film_description,
    release_year,
    language_id,
    rental_duration,
    rental_rate,
    film_length,
    replacement_cost,
    rating,
    valid_from,
    special_features,
    film_fulltext,
    file_name
from {{ source('dvd_rental', 'film_strm') }}