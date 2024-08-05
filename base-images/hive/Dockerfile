FROM keyhong/custom-base-hadoop:v1.0.0

ARG HIVE_VERSION=3.1.3

ARG HIVE_VERSION=${HIVE_VERSION:-3.1.3}

ENV HIVE_HOME=/opt/hive

ENV PATH=${HIVE_HOME}/bin:${PATH}

RUN mkdir -p ${HIVE_HOME}

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends procps \
    && apt-get autoremove -yqq --purge \
    && rm -rf /var/lib/apt/lists/*

ARG HIVE_URL=http://apache.mirror.cdnetworks.com/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz

RUN wget -c -O hive.tar.gz ${HIVE_URL} \
    && tar -zxvf hive.tar.gz --directory=${HIVE_HOME} --strip 1 \
    && rm -rf hive.tar.gz \
    && rm -rf /opt/hive/lib/log4j-slf4j-impl*

COPY ./conf/hive/hive-site.xml ${HIVE_HOME}/conf

COPY ./base-images/hive/mysql-connector-j-8.3.0.jar ${HIVE_HOME}/lib/

COPY --chmod=755 ./base-images/hive/entrypoint.sh ./

ENTRYPOINT [ "/entrypoint.sh" ]