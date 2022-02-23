{% macro postgres__find_columns_with_names_like(sensor_name, column_pattern_matching, database_to_scan) %}

    SELECT 
      '{{ sensor_name }}' AS sensor_name,
      table_catalog       AS database_name,
      table_schema        AS table_schema,
      table_name          AS table_name,
      column_name         AS column_name,
      NULL::JSONB         AS other_identifier,
      CURRENT_TIMESTAMP   AS time_detected
    FROM "{{ database_to_scan }}".datasiren.warehouse_table_columns
    WHERE LOWER(column_name) LIKE LOWER('{{column_pattern_matching}}')

{%- endmacro -%}

