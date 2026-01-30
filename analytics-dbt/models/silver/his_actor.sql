{%- set standard_cols = [
    "first_name",
    "last_name",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "actor_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_actor") }}