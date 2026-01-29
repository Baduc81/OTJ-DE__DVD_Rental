{%- set standard_cols = [
    "manager_staff_id",
    "address_id",
    "valid_from"
] -%}

{%- set unique_key = "store_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("store_tmp") }}