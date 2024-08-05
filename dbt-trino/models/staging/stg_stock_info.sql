WITH source AS (
    SELECT
        stock_code,
        stock_name,
        stock_status_code,
        listing_date,
        delisting_date,
        market_classification_code,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "stock_info") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
{% if is_incremental() %}
    WHERE last_data_modification_datetime > (SELECT max(last_data_modification_datetime) FROM {{ this }})
{% endif %}