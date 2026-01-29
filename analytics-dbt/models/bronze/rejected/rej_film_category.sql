{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    film_category_id,
    film_id,
    category_id,
    file_name,
    valid_from
FROM {{ ref("film_category_tmp") }}
WHERE is_duplicated_version = TRUE
    OR is_duplicated_file = TRUE