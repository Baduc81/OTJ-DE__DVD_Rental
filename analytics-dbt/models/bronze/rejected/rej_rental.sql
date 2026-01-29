{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    file_name,
    valid_from
FROM {{ ref("tmp_rental") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE