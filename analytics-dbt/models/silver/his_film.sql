{%- set standard_cols = [
    "title",
    "film_description",
    "release_year",
    "language_id",
    "rental_duration",
    "rental_rate",
    "film_length",
    "replacement_cost",
    "rating",
    "special_features",
    "film_fulltext",
    "valid_from",
    "record_hash"
] -%}

{%- set unique_key = "film_id" -%}

{{- config(
    materialized="incremental",
    incremental_strategy="scd_type2_merge",
    unique_key = unique_key,
    standard_cols=standard_cols
) -}}

SELECT * FROM {{ ref("tmp_film") }}