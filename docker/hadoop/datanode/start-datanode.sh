#!/bin/bash

if [ ! -d ${HDFS_DATANODE_DATA_DIR} ]; then
    echo "Datanode name directory not found: ${HDFS_DATANODE_DATA_DIR}"
    exit 2
fi

${HADOOP_HOME}/bin/hdfs --config ${HADOOP_CONF_DIR} datanode