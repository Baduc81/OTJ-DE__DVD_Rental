{%- set standard_cols = [
    "film_id",
    "category_id",
    "valid_from"
] -%}

{%- set unique_key = "film_category_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("film_category_tmp") }}