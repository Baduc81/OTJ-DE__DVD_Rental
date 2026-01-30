{%- set standard_cols = [
    "actor_id",
    "film_id",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "film_actor_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_film_actor") }}