FROM alpine

EXPOSE 80
WORKDIR /

RUN apk update && apk add python3 git
RUN git clone --depth 1 https://github.com/apankrat/nullboard
RUN mv /nullboard/nullboard.html /nullboard/index.html
RUN apk del git

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "python3 -m http.server -b 0.0.0.0 80 -d /nullboard" ]
