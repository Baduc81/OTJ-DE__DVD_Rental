{%- set standard_cols = [
    "rental_date",
    "inventory_id",
    "customer_id",
    "return_date",
    "staff_id",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "rental_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_rental") }}