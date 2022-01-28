{% docs canary_sensor %}

Useful to determine when datasiren runs.  Will return exactly a single row as long as the specified database exists and has at least one column.

{% enddocs %}

{% docs column_value_sensor %}

A sensor template that scans a designated column for a given regular expression.
Parameters:

sensor_name: The name of the sensor as it should be shown in the audit result model.
column_name: The name of the column that should be scanned.
column_pattern: The regular expression that defines what sensitive data is being searched for.
other_identifier: A variant that may be used to identify where the sensitive data is in the table.
table_ref: A dbt model reference or the fully qualified table name, ie db_name.schema_name.some_table.
sample_rule: A number that specifies what percentage of the tables rows should be scanned.  Can also be used to designate the absolute number of rows that should be scanned by suffixing with ROWS, ie 10 ROWS.  For Postgres, follows the specifications of the sample function.

{% enddocs %}

{% docs columns_value_sensor %}
A sensor that supports scanning data from multiple columns in the same table at the same time.
{% enddocs %}

{% docs get_columns_by_type %}
Returns a query to retrieve a sample of columns of a specified type in the specified database.
{% enddocs %}

{% docs search_sample_columns_samples_for_pattern %}
Scans samples of the values in a sample of all columns of a particular type in the specified database for the specified regular expression.
Parameters:

sensor_name: Name of the sensor
database_to_scan: Name of the database to scan
column_type: The column data type (usually VARCHAR), that we want to scan for sensitive data
column_sample_rule: What sample of all the database columns are going to be scanned.
column_data_sample_rule: What sample of the data in each column is going to be scanned.
column_pattern: Regular expression defining what sensitive data is being searched for.
{% enddocs %}

{% docs find_columns_with_names_like %}
Uses the information schema of the specified database to find columns with names matching the specified pattern.
Uses the LIKE function.
{% enddocs %}

{% docs search_sample_of_column_for_pattern %}
A query that scans a sample of rows from the given model in search of where the specified column matches the specified regular expression.
{% enddocs %}

{% docs search_sample_of_columns_for_pattern %}
A query that scans a sample of rows from the given model in search of where one or more of the specified columns matches the specified regular expression.
{% enddocs %}
