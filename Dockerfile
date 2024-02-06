FROM debian:12.4-slim

RUN apt-get update -y \
    && apt-get install -y ca-certificates curl gnupg cron \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && chmod a+r /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update -y \
    && apt-get install -y docker-ce-cli
ADD crontab /var/spool/cron/crontabs/root
RUN crontab /var/spool/cron/crontabs/root
# crondをフォアグラウンドで標準出力を使用して起動
CMD cron -f
