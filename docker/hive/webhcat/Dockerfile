FROM keyhong/custom-base-hive:v1.0.0

ENV PYTHON_CMD=/usr/bin/python

COPY --chmod=755 ./docker/hive/webhcat/startup.sh /startup.sh

EXPOSE 50111

CMD [ "/startup.sh" ]