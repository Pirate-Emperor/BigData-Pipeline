{{
    config(
        materialized='incremental'
    )
}}
WITH dw AS (
    SELECT
        *
    FROM {{ ref("stg_stock_info") }}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['stock_code']) }} as stock_id, 
    stock_code,
    stock_name,
    stock_status_code,
    listing_date,
    delisting_date,
    market_classification_code,
    CAST(initial_data_creation_datetime AS TIMESTAMP) AS initial_data_creation_datetime,
    CAST(last_data_modification_datetime AS TIMESTAMP) AS last_data_modification_datetime,
    CAST(current_timestamp AS DATE) AS effective_date,
    CAST(current_timestamp AS DATE) AS end_date,
    CAST(current_timestamp AS TIMESTAMP) AS dw_load_dt
FROM dw
{% if is_incremental() %}
    WHERE CAST(last_data_modification_datetime AS TIMESTAMP) > (SELECT max(last_data_modification_datetime) FROM {{ this }})
{% endif %}