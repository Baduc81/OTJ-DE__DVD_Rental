{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    file_name,
    valid_from
FROM {{ ref("tmp_address") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE