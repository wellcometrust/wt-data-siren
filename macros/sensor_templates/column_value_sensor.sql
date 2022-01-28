{% macro column_value_sensor(sensor_name, column_name, column_pattern, other_identifier, table_ref, sample_rule) %}

    {{ adapter.dispatch('search_sample_of_column_for_pattern', 'datasiren')(sensor_name, column_name, column_pattern, other_identifier, table_ref, sample_rule) }}

{%- endmacro -%}
