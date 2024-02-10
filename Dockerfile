FROM alpine:3.19.1

RUN apk update && \
    apk add docker-cli
# crondをフォアグラウンドで標準出力を使用して起動
CMD /usr/bin/crontab /crontabs/root && /usr/sbin/crond -f -l 8
