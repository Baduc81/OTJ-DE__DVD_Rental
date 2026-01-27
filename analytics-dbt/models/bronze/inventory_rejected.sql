{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    inventory_id,
    film_id,
    store_id,
    file_name,
    valid_from
FROM {{ ref("inventory_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE