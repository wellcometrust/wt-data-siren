{% macro postgres__get_columns_by_type(database_to_scan, column_type, sample_rule, schema_name = None) %}

    SELECT 
      table_schema        AS table_schema,
      table_name          AS table_name,
      column_name         AS column_name
    FROM "{{ database_to_scan }}".datasiren.warehouse_table_columns TABLESAMPLE BERNOULLI ({{sample_rule}})
    WHERE LOWER(data_type) = LOWER('{{column_type}}')
    {% if schema_name %}
      AND LOWER(table_schema) = '{{schema_name|lower}}'
    {% endif %}


{%- endmacro -%}

