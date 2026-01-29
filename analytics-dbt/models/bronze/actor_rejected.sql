{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    actor_id,
    first_name,
    last_name,
    file_name,
    valid_from
FROM {{ ref("actor_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE