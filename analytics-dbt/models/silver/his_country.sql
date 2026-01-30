{%- set unique_key = "country_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="merge",
    unique_key = unique_key
) -}}

SELECT 
    country_id,
    country,
    valid_from,
    record_hash
FROM {{ ref("tmp_country") }}