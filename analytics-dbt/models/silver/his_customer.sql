{%- set standard_cols = [
    "store_id",
    "first_name",
    "last_name",
    "email",
    "address_id",
    "activebool",
    "create_date",
    "active",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "customer_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_customer") }}