{% macro columns_value_sensor(sensor_name, column_names, column_pattern, other_identifier, table_ref, sample_rule) %}

    {{ adapter.dispatch('search_sample_of_columns_for_pattern', ['datasiren'])(sensor_name, column_names, column_pattern, other_identifier, table_ref, sample_rule) }}

{%- endmacro -%}

