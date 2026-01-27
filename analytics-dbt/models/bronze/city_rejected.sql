{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    city_id,
    city,
    country_id,
    file_name,
    valid_from
FROM {{ ref("city_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE