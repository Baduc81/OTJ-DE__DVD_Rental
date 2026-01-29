{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
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
    special_features,
    film_fulltext,
    file_name,
    valid_from
FROM {{ ref("film_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE