FROM keyhong/custom-base-hadoop:v1.0.0

RUN mkdir -p /hadoop/yarn/timeline

VOLUME [ "/hadoop/yarn/timeline" ]

COPY start-historyserver.sh start-historyserver.sh

RUN chmod +x start-historyserver.sh

EXPOSE 8188

CMD [ "./start-historyserver.sh" ]