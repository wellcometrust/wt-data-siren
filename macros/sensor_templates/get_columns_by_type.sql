{% macro get_columns_by_type(database_to_scan, column_type, sample_rule, schema_name = None) %}

    {{ adapter.dispatch('get_columns_by_type', ['datasiren'])(database_to_scan, column_type, sample_rule, schema_name) }}

{%- endmacro -%}

