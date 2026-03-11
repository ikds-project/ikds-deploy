FROM alpine:3.19

RUN apk add --no-cache \
    bash \
    inotify-tools \
    docker-cli

ARG DBA_PASSWORD
ENV DBA_PASSWORD=$DBA_PASSWORD

WORKDIR .

COPY watcher.sh .
COPY update.sh .

RUN chmod +x watcher.sh
RUN chmod +x update.sh

CMD ["/watcher.sh"]
