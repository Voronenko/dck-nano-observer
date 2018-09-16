FROM golang AS building

LABEL maintainer="git@voronenko.info"
LABEL version="0.5.2"

ARG pushgateway_version="0.5.2"

RUN curl -LO https://github.com/prometheus/pushgateway/releases/download/v${pushgateway_version}/pushgateway-${pushgateway_version}.linux-amd64.tar.gz \
    && tar -xvzf pushgateway-${pushgateway_version}.linux-amd64.tar.gz  \
    && cp pushgateway-${pushgateway_version}.linux-amd64/pushgateway /tmp/

FROM alpine:3.5

COPY --from=building /tmp/pushgateway /usr/local/bin/

EXPOSE     9091
RUN mkdir -p /pushgateway
WORKDIR    /pushgateway
ENTRYPOINT [ "/bin/pushgateway" ]
