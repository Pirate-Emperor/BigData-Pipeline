WITH source AS (
    SELECT
        order_date,
        order_sequence_number,
        execution_sequence_number,
        execution_quantity,
        execution_amount,
        execution_fee,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "execution_hist") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
-- WHERE last_data_modification_datetime > source("")