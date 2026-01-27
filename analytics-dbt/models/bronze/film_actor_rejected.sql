{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    actor_id,
    film_id,
    file_name,
    valid_from
FROM {{ ref("film_actor_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE