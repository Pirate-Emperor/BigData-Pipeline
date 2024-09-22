ARG JDK_VERSION=21.0.2_13-jdk-jammy

FROM eclipse-temurin:${JDK_VERSION} AS trino_build

ARG TRINO_VERSION=438

ARG TRINO_VERSION=${TRINO_VERSION:-438}

ENV TRINO_HOME=/opt/trino

ENV PATH=${TRINO_HOME}/bin/:${PATH}

RUN apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        python3.10 \
        netcat \
    && apt-get autoremove -yqq --purge \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.10 /usr/local/sbin/python

RUN mkdir -p ${TRINO_HOME}

ARG TRINO_URL=https://repo1.maven.org/maven2/io/trino/trino-server/${TRINO_VERSION}/trino-server-${TRINO_VERSION}.tar.gz

RUN wget -c -O trino.tar.gz ${TRINO_URL} \
    && tar -zxvf trino.tar.gz --directory=${TRINO_HOME} --strip 1 \
    && rm -rf trino.tar.gz \
    && mkdir -p ${TRINO_HOME}/etc/catalog /data/trino

# node.properties
COPY ./conf/trino/node.properties ${TRINO_HOME}/etc

# config.properties
COPY ./conf/trino/config.properties ${TRINO_HOME}/etc

# log.properties
COPY ./conf/trino/log.properties ${TRINO_HOME}/etc

# jvm.config
COPY ./conf/trino/jvm.config ${TRINO_HOME}/etc

# mysql.properties, kudu.properties, mysql.properties
COPY ./conf/trino/catalog/* ${TRINO_HOME}/etc/catalog

COPY --chmod=755 ./docker/trino/entrypoint.sh /entrypoint.sh

COPY --chmod=755 ./docker/trino/start-trino-server.sh /start-trino-server.sh

CMD [ "/start-trino-server.sh" ]