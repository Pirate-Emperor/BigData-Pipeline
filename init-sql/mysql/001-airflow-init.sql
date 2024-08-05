DROP DATABASE IF EXISTS airflow_db;
DROP ROLE IF EXISTS airflow;
CREATE USER 'airflow'@'%' IDENTIFIED BY 'airflow';
CREATE DATABASE airflow_db;
GRANT ALL PRIVILEGES ON airflow_db.* TO 'airflow'@'%';