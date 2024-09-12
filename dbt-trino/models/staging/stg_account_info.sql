WITH source AS (
    SELECT
        account_number,
        -- customer_number,
        account_status_code,
        -- account_name, 
        -- account_password, 
        available_balance,
        account_creation_datetime,
        account_closure_datetime,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "account_info") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
-- WHERE last_data_modification_datetime