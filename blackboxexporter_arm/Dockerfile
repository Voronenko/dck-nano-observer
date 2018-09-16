FROM arm32v6/alpine:latest
# ORIGINAL CREDITS:  https://github.com/nopp/grafana_alpine

LABEL maintainer "git@voronenko.info"
LABEL version="0.12.0"

ARG blackbox_exporter_version="0.12.0"

ADD qemu-arm-static /usr/bin

RUN apk --update upgrade && \
    apk add curl ca-certificates && \
    update-ca-certificates && \
    curl --retry 3 -L -o blackbox.tar.gz https://github.com/prometheus/blackbox_exporter/releases/download/v${blackbox_exporter_version}/blackbox_exporter-${blackbox_exporter_version}.linux-armv6.tar.gz && tar zx -f blackbox.tar.gz -C .  && \
    rm blackbox.tar.gz && \
    mkdir -p /etc/blackbox_exporter && \
    mv blackbox_exporter-${blackbox_exporter_version}.linux-armv6/blackbox_exporter  /bin/blackbox_exporter && \
    mv blackbox_exporter-${blackbox_exporter_version}.linux-armv6/blackbox.yml       /etc/blackbox_exporter/config.yml && \
    rm -rf blackbox_exporter-${blackbox_exporter_version}.linux-armv6 && \
    rm -rf /var/cache/apk/*

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]
