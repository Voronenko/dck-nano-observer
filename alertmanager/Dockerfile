FROM alpine:3.5

LABEL maintainer="git@voronenko.info"
LABEL version="0.15.2"

ARG alertmanager_version="0.15.2"

WORKDIR /alertmanager

RUN apk --no-cache add curl \
    && curl -LO https://github.com/prometheus/alertmanager/releases/download/v${alertmanager_version}/alertmanager-${alertmanager_version}.linux-amd64.tar.gz \
    && tar -xvzf alertmanager-${alertmanager_version}.linux-amd64.tar.gz \
    && cp alertmanager-${alertmanager_version}.linux-amd64/alertmanager /bin \
    && rm -rf alertmanager-${alertmanager_version}.linux-amd64

VOLUME /alertmanager
VOLUME /etc/alertmanager
ADD conf/config.yml /etc/alertmanager/
ENTRYPOINT ["alertmanager"]
CMD ["--config.file=/etc/alertmanager/config.yml", "--storage.path=/alertmanager"]
EXPOSE 9093
