-- Fails if any film length is not positive
select
    film_id,
    title,
    film_length
from {{ ref('dim_film') }}
where film_length <= 0
