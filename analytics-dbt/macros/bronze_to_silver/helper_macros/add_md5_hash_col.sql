{% macro add_md5_hash_col(source, standard_cols, unique_key) %}

--- purpose: to create a MD5 hash for each row for future comparision
--- source: a table
--- standard_cols: the columns which will be use to create MD5 hash
--- unique_key: the unique_col 

{% set clean_cols = [] -%}
{%- for col in standard_cols -%}
    {%- if col != 'file_name' -%}
    {%- do clean_cols.append(col) -%}
    {%- endif -%}
{%- endfor -%}

SELECT *,
    MD5(
        CONCAT_WS(
            '||',
            {{ unique_key }},
            {%- for col in clean_cols %}
            {{ col }}{%- if not loop.last -%}, {%- endif -%}
            {% endfor %}
        )
    ) AS record_hash
FROM
    {{ source }}
{% endmacro %}