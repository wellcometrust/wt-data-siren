{% macro search_sample_columns_samples_for_pattern(sensor_name, database_to_scan, column_type, column_sample_rule, column_data_sample_rule, column_pattern, schema_name = None) %}

    {% set query %}
        WITH columns_by_type AS (
            {{ datasiren.get_columns_by_type(database_to_scan, column_type, column_sample_rule, schema_name) }}
        )
        SELECT 
          table_schema,
          table_name,
          ARRAY_AGG(DISTINCT column_name)::VARCHAR
        FROM columns_by_type
        GROUP BY 1,2
    {% endset %}

    {% if execute %}
        {% set columns = run_query(query) %}
        {% for row in columns.rows.values() %}
            {% set qualifier = database_to_scan ~ '.' ~ row[0] ~ '.' ~ row[1] %}
            {% set column_names = fromjson(row[2]) %}
            {% set other_identifier %}
                PARSE_JSON('{ "md5({{column_names[0]}})": "' || md5("{{ column_names[0] }}") || '"}')
            {% endset %}
            {{ datasiren.columns_value_sensor(sensor_name, column_names, column_pattern, other_identifier, qualifier, column_data_sample_rule) }}

            {% if not loop.last %}
                UNION ALL
            {% endif %}
        {% endfor %}

    {% endif %}

{%- endmacro -%}

