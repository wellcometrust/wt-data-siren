{% macro postgres__get_columns_by_type(database_to_scan, column_type, sample_rule, schema_name = None) %}

    CREATE TEMP TABLE tmp_columns_table AS
        SELECT 
            table_schema        AS table_schema,
            table_name          AS table_name,
            column_name         AS column_name
        FROM "{{ database_to_scan }}".information_schema.columns
        WHERE LOWER(data_type) = LOWER('{{column_type}}')
        {% if schema_name %}
            AND LOWER(table_schema) = '{{schema_name|lower}}'
        {% endif %}

    SELECT * FROM tmp_columns_table TABLESAMPLE BERNOULLI ({{sample_rule}})


{%- endmacro -%}

