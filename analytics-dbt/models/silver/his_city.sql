{%- set unique_key = "city_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="merge",
    unique_key = unique_key
) -}}

SELECT 
    city_id,
    city,
    country_id,
    valid_from,
    record_hash
FROM {{ ref("tmp_city") }}