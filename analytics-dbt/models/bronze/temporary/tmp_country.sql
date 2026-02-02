{%- set standard_cols = [
    "country",
    "valid_from",
    "file_name"
] -%}

{%- set unique_key = "country_id" -%}
{%- set join_table = "dvd_rental.silver.country" -%}
{%- set source = source("bronze", "country_strm") -%}

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
    {{ filter_dup_data_version("add_md5_hash_col_cte", join_table, unique_key, standard_cols, 'type1') }}
)

SELECT * FROM filter_dup_data_version_cte