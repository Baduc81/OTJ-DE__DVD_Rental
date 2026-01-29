{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    store_id,
    manager_staff_id,
    address_id,
    file_name,
    valid_from
FROM {{ ref("store_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE