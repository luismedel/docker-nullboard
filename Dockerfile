FROM alpine

EXPOSE 10001
EXPOSE 80
WORKDIR /

VOLUME [ "/data" ]
ENV XDG_DATA_HOME=/data

COPY ./lighttpd.conf ./lighttpd.conf

RUN apk update && apk add git lighttpd python3 py3-pip && \
    git clone --depth 1 https://github.com/apankrat/nullboard /www && \
    mv /www/nullboard.html /www/index.html && \
    python3 -m pip install nbagent && \
    apk del git py3-pip

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "lighttpd -f ./lighttpd.conf & nbagent --data /data && fg" ]
