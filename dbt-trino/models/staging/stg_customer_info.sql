WITH source AS (
    SELECT
        customer_number,
        -- customer_name,
        customer_status_code,
        gender_code,
        date_of_birth,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "customer_info") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
-- WHERE last_data_modification_datetime < {{ ref("dim_stock_info") }}