{%- set standard_cols = [
    "manager_staff_id",
    "address_id",
    "valid_from",
    "file_name"
] -%}

{%- set unique_key = "store_id" -%}
{%- set join_table = "dvd_rental.silver.store" -%}
{#- set source = source("bronze", "store_strm") -#}
{%- set source = ref("stg_store") -%}


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