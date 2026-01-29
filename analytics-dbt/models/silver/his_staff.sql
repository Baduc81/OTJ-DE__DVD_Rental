{%- set standard_cols = [
    "first_name",
    "last_name",
    "address_id",
    "email",
    "store_id",
    "active",
    "username",
    "staff_password",
    "valid_from"
] -%}

{%- set unique_key = "staff_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_staff") }}