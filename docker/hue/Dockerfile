FROM gethue/hue:4.10.0

USER root

RUN mv /etc/apt/sources.list.d/nodesource.list /etc/apt/sources.list.d/nodesource.list.disabled

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends netcat ca-certificates libgnutls30 \
    && apt-get autoremove -yqq --purge \
    && rm -rf /var/lib/apt/lists/*        

RUN mv /etc/apt/sources.list.d/nodesource.list.disabled /etc/apt/sources.list.d/nodesource.list

COPY ./entrypoint.sh .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["./startup.sh"]