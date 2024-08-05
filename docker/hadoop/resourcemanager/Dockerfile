FROM keyhong/custom-base-hadoop:v1.0.0

COPY start-resourcemanager.sh start-resourcemanager.sh

RUN chmod +x start-resourcemanager.sh

EXPOSE 8088

CMD [ "./start-resourcemanager.sh" ]