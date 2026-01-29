{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    film_actor_id,
    actor_id,
    film_id,
    file_name,
    valid_from
FROM {{ ref("tmp_film_actor") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE