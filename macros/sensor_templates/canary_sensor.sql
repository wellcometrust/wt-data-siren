{% macro canary_sensor(database) %}

    {{ adapter.dispatch('find_columns_with_names_like', ['datsiren'])('canary_sensor', '%', database|trim) }}
    LIMIT 1

{%- endmacro %}
