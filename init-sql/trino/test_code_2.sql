-- Executing a union SQL between heterogeneous databases(Hive, Kudu).
SELECT * FROM HIVE.DW.DIM_TEST
UNION
SELECT table_catalog, CURRENT_TIMESTAMP(6) FROM KUDU.INFORMATION_SCHEMA.COLUMNS LIMIT 2;
