FROM golang AS building

LABEL maintainer="git@voronenko.info"
LABEL version="0.16.0"

ARG exporter_version="0.16.0"

RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v${exporter_version}/node_exporter-${exporter_version}.linux-armv6.tar.gz \
    && tar -xvzf node_exporter-${exporter_version}.linux-armv6.tar.gz  \
    && cp node_exporter-${exporter_version}.linux-armv6/node_exporter /tmp/

FROM arm32v6/alpine:latest

ADD qemu-arm-static /usr/bin

RUN apk update && apk add libc6-compat && ln -s /lib/ld-linux-armhf.so.3 /lib/ld-linux.so.3

COPY --from=building /tmp/node_exporter /usr/local/bin/

ENTRYPOINT node_exporter --path.procfs=/usr/proc --path.sysfs=/usr/sys \
            --collector.filesystem.ignored-mount-points="^(/rootfs|/host|)/(sys|proc|dev|host|etc)($$|/)" \
            --collector.filesystem.ignored-fs-types="^(sys|proc|auto|cgroup|devpts|ns|au|fuse\.lxc|mqueue)(fs|)$$"

EXPOSE 9100

