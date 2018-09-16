FROM golang AS building

LABEL maintainer="git@voronenko.info"
LABEL version="0.5.2"

ARG pushgateway_version="0.5.2"

RUN curl -LO https://github.com/prometheus/pushgateway/releases/download/v${pushgateway_version}/pushgateway-${pushgateway_version}.linux-armv6.tar.gz \
    && tar -xvzf pushgateway-${pushgateway_version}.linux-armv6.tar.gz  \
    && cp pushgateway-${pushgateway_version}.linux-armv6/pushgateway /tmp/

FROM arm32v6/alpine:latest

ADD qemu-arm-static /usr/bin

COPY --from=building /tmp/pushgateway /usr/local/bin/

EXPOSE     9091
RUN mkdir -p /pushgateway
WORKDIR    /pushgateway
ENTRYPOINT [ "/bin/pushgateway" ]
