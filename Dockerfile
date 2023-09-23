FROM alpine

EXPOSE 10001
EXPOSE 80
WORKDIR /

VOLUME [ "/data" ]
ENV XDG_DATA_HOME=/data

RUN apk update && apk add git lighttpd python3 py3-pip util-linux jq && \
    git clone --depth 1 https://github.com/luismedel/nullboard /www && \
    mv /www/nullboard.html /www/index.html && \
    python3 -m pip install nbagent && \
    apk del git py3-pip

COPY ./lighttpd.conf ./lighttpd.conf
COPY ./init.sh ./init.sh
RUN chmod +x ./init.sh

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "./init.sh" ]
