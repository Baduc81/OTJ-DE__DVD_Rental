{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    address_id,
    activebool,
    create_date,
    active,
    file_name,
    valid_from
FROM {{ ref("customer_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE