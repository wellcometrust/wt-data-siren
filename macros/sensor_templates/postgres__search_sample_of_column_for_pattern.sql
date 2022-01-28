{% macro postgres__search_sample_of_column_for_pattern(sensor_name, column_name, column_pattern, other_identifier, table_ref, sample_rule) %}

    SELECT 
      '{{ sensor_name }}'                 AS sensor_name,
      {% if table_ref.database %}
        '{{ table_ref.database }}'        AS database_name,
        '{{ table_ref.schema }}'          AS table_schema,
        '{{ table_ref.identifier }}'      AS table_name,
      {% else %}
        '{{ table_ref.split(".")[0] }}'   AS database_name,
        '{{ table_ref.split(".")[1] }}'   AS table_schema,
        '{{ table_ref.split(".")[2] }}'   AS table_name,
      {% endif %}
      '{{ column_name }}'                 AS column_name,
      {{ other_identifier }}              AS other_identifier,
      CURRENT_TIMESTAMP()                 AS time_detected
    FROM {{ table_ref }} sample ({{sample_rule}})
    WHERE REGEXP_LIKE("{{column_name}}", '{{ column_pattern }}')

{%- endmacro -%}

