{% macro truncate_temp_tables(tables_to_truncate) %}

    {% for table_ref in tables_to_truncate %}
        {% set query %}
            TRUNCATE TABLE {{ table_ref }};
        {% endset %}

        {% if execute %}
            {{ log("Truncating temporary table: " ~ table_ref, info=True) }}
            {% do run_query(query) %}
        {% endif %}
    {% endfor %}

{% endmacro %}