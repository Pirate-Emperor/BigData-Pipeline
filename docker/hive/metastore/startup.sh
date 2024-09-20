#!/bin/bash

if [ ! -f "/schematool-check/initialized" ]; then
  echo "Configuring Hive..."
  
  ${HADOOP_HOME}/bin/hdfs dfs -mkdir -p /tmp
  ${HADOOP_HOME}/bin/hdfs dfs -chmod g+w /tmp
  
  ${HADOOP_HOME}/bin/hdfs dfs -mkdir -p /user/hive/warehouse
  ${HADOOP_HOME}/bin/hdfs dfs -chmod g+w /user/hive/warehouse

  ${HIVE_HOME}/bin/schematool -ifNotExists -dbType mysql -initSchema --verbose
  touch "/schematool-check/initialized"
fi

${HIVE_HOME}/bin/hive --service metastore