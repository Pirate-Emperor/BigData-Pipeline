DROP TABLE IF EXISTS KUDU.DW.DIM_TEST;

CREATE TABLE IF NOT EXISTS KUDU.DW.DIM_TEST (
    TEST_ID                           INT         WITH (primary_key=true)
  , EFFECTIVE_DATE                    DATE        
  , END_DATE                          DATE        
  , DW_LOAD_DT                        TIMESTAMP   
) COMMENT 'TEST_TABLE'
WITH (
  partition_by_hash_columns = ARRAY['TEST_ID'],
  partition_by_hash_buckets = 5
);