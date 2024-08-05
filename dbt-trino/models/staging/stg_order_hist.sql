WITH source AS (
    SELECT
        order_date,
        order_sequence_number,
        account_number,
        stock_code,
        order_processing_status_code,
        buy_sell_classification_code,
        order_quantity,
        order_amount,
        filled_quantity,
        unfilled_quantity,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "order_hist") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
-- WHERE last_data_modification_datetime