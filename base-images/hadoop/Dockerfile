ARG JDK_VERSION=8-jdk-slim-buster

FROM openjdk:${JDK_VERSION}

ARG HADOOP_VERSION=3.3.6

ARG HADOOP_VERSION=${HADOOP_VERSION:-3.3.6}

ENV HADOOP_HOME=/opt/hadoop \
    HADOOP_CONF_DIR=/etc/hadoop

USER root

ENV PATH=${HADOOP_HOME}/bin/:${PATH}

RUN apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        apt-utils \
        curl \
        wget \
        netcat \
    && apt-get autoremove -yqq --purge \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p ${HADOOP_HOME}

ARG HADOOP_URL=http://apache.mirror.cdnetworks.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

RUN wget -c -O hadoop.tar.gz ${HADOOP_URL} \
    && tar -zxvf hadoop.tar.gz --directory=${HADOOP_HOME} --exclude=hadoop-${HADOOP_VERSION}/share/doc --strip 1 \
    && rm -rf hadoop.tar.gz \
    && ln -s ${HADOOP_HOME}/etc/hadoop ${HADOOP_CONF_DIR} \
    && mkdir -p ${HADOOP_HOME}/logs \
    && mkdir -p /data


COPY ./conf/hadoop/ ${HADOOP_CONF_DIR}

COPY --chmod=755 ./base-images/hadoop/entrypoint.sh ./

ENTRYPOINT [ "/entrypoint.sh" ]






