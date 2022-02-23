{% macro canary_sensor(database) %}

    {# 
        This does not return anything specific, it effectively just
        gets a single column from the database of really any column_name
        as a result to indicate that the canary is still alive (i.e. the database).
    #}

    {{ adapter.dispatch('find_columns_with_names_like', 'datasiren')('canary_sensor', '%', database|trim) }}
    LIMIT 1

{%- endmacro %}
