{% snapshot scd_raw_customer_info %}

{{
    config(
        target_database='hive',
        target_schema="snap",        
        unique_key="customer_number",
        strategy="timestamp",
        updated_at="last_data_modification_datetime",
        invalid_hard_deletes=True
    )
}}
SELECT
    *
FROM {{ source("hdfs_source", "customer_info") }}


{% endsnapshot %}
