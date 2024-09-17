FROM keyhong/custom-base-hadoop:v1.0.0

ENV HDFS_NAMENODE_DATA_DIR=/data/hadoop/dfs/name

RUN mkdir -p ${HDFS_NAMENODE_DATA_DIR}

COPY --chmod=755 ./docker/hadoop/namenode/start-namenode.sh /start-namenode.sh

EXPOSE 9870

CMD [ "/start-namenode.sh" ]