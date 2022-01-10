{% docs datasiren_audit_results %}

The primary model of datasiren. Its primary purpose is to aggregate all hits collected from sensors for all time. However, for a sensor to be included in this aggregation, its dbt identifier must be specified as part of the `datasiren::sensorlist` dbt project variable.

{% enddocs %}
