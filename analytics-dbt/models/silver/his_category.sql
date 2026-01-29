{%- set standard_cols = [
    "category_name",
    "valid_from"
] -%}

{%- set unique_key = "category_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_category") }}