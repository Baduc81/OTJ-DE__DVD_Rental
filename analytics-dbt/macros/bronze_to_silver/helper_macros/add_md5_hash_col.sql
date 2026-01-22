{%- macro add_md5_hash_col(source, standard_cols, unique_key) -%}

{%- set clean_cols = [] -%}
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
{%- endmacro -%}