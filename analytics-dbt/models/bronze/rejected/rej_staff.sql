{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    store_id,
    active,
    username,
    staff_password,
    file_name,
    valid_from
FROM {{ ref("tmp_staff") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE