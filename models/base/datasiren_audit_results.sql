{{ config(
        materialized='incremental',
        full_refresh="false"
    )
}}

{% for sensor in dbt_utils.get_relations_by_prefix(var('datasiren:schema_name'), 'datasiren_', exclude='datairen_audit_results', database=this.database) %}

    SELECT * 
    FROM {{ sensor }}

    {% if is_incremental() %}
        WHERE time_detected > 
            ( 
                SELECT IFNULL(MAX(time_detected), '1900-01-01 00:00:00.000 +0000')
                FROM {{ this }}
                WHERE sensor_name in (
                    SELECT DISTINCT sensor_name
                    FROM {{ sensor }} 
                )
            )
    {% endif %}

    {% if not loop.last %}
        UNION ALL 
    {% endif %}

{% endfor -%}
