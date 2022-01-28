{% macro canary_sensor(database) %}

    {{ adapter.dispatch('find_columns_with_names_like', ['datasiren'])('canary_sensor', '%', database|trim) }}
    LIMIT 1

{%- endmacro %}
