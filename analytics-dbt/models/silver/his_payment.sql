{%- set standard_cols = [
    "customer_id",
    "staff_id",
    "rental_id",
    "amount",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "payment_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_payment") }}