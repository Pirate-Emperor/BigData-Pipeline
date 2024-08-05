#!/bin/bash

if [ -z $(ls -A "${HDFS_NAMENODE_DATA_DIR}") ]; then
  echo "Formatting namenode name directory: ${HDFS_NAMENODE_DATA_DIR}"


  ${HADOOP_HOME}/bin/hdfs namenode -format ${CLUSTER_NAME}
fi

if [ -z "${CLUSTER_NAME}" ]; then
    echo "Cluster name not specified"
    exit 2
fi

${HADOOP_HOME}/bin/hdfs --config ${HADOOP_CONF_DIR} namenode