-- Fails if release year is outside valid range (1000-2026)
select
    film_id,
    title,
    release_year
from {{ ref('dim_film') }}
where release_year < 1000 or release_year > 2026
