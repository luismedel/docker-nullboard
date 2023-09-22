FROM alpine

EXPOSE 10001
EXPOSE 80
WORKDIR /

VOLUME [ "/data" ]
ENV XDG_DATA_HOME=/data

COPY ./lighttpd.conf ./lighttpd.conf

RUN apk update && apk add git lighttpd
RUN git clone --depth 1 https://github.com/apankrat/nullboard /www
RUN mv /www/nullboard.html /www/index.html
RUN apk del git

RUN apk add python3 py3-pip
RUN python3 -m pip install nbagent
RUN apk del py3-pip

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "lighttpd -f ./lighttpd.conf & nbagent --data /data && fg" ]
