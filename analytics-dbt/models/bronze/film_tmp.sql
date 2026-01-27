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
    "file_name"
] -%}

{%- set unique_key = "film_id" -%}
{%- set join_table = "dvd_rental.silver.film" -%}
{%- set source = source("bronze", "film_strm") -%}

WITH add_total_occurrneces_col_cte as (
    {{ add_total_occurrneces_col(source, standard_cols, unique_key) }}
),
filter_dup_data_within_file_cte as (
    {{ filter_dup_data_within_file("add_total_occurrneces_col_cte") }}
),
add_md5_hash_col_cte as (
    {{ add_md5_hash_col("filter_dup_data_within_file_cte", standard_cols, unique_key) }}
),
filter_dup_data_version_cte as (
    {{ filter_dup_data_version("add_md5_hash_col_cte", join_table, unique_key, standard_cols) }}
)

SELECT * FROM filter_dup_data_version_cte