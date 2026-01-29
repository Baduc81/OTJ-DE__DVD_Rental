{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT
    language_id,
    language_name,
    file_name,
    valid_from
FROM {{ ref("language_tmp") }}
WHERE is_duplicated_file = TRUE
    OR is_duplicated_version = TRUE