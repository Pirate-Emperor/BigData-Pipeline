FROM keyhong/custom-base-hadoop:v1.0.0

ENV HDFS_DATANODE_DATA_DIR=/data/hadoop/dfs/data

RUN mkdir -p ${HDFS_DATANODE_DATA_DIR}

COPY --chmod=755 ./docker/hadoop/datanode/start-datanode.sh /start-datanode.sh

EXPOSE 9864

CMD [ "/start-datanode.sh" ]