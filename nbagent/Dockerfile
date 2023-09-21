FROM alpine

EXPOSE 10001
VOLUME [ "/data" ]
ENV XDG_DATA_HOME=/data
WORKDIR /data

RUN apk update && apk add python3 py3-pip
RUN python3 -m pip install nbagent
RUN apk del py3-pip

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "nbagent" ]
