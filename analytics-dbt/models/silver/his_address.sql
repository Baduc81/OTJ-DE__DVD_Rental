{%- set standard_cols = [
    "address",
    "address2",
    "district",
    "city_id",
    "postal_code",
    "phone",
    "valid_from"
] -%}

{%- set unique_key = "address_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_address") }}