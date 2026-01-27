{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    file_name
FROM {{ ref("payment_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE