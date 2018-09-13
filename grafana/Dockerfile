FROM alpine:3.5
# ORIGINAL CREDITS:  https://github.com/nopp/grafana_alpine

LABEL maintainer "git@voronenko.info"
LABEL version="4.6.3"

ARG grafana_version="4.6.3"

RUN apk update \
	&& apk add openssl curl \
	&& curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
	&& curl -LO https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${grafana_version}.linux-x64.tar.gz \
	&& apk add glibc-2.23-r3.apk \
	&& tar xzvf grafana-${grafana_version}.linux-x64.tar.gz \
	&& mv grafana-${grafana_version}/ grafana/ \
	&& mkdir -p grafana/data/plugins \
	&& rm -rf grafana-${grafana_version}.linux-x64.tar.gz \
	&& rm -rf glibc-2.23-r3.apk \
	&& apk del curl openssl

WORKDIR /grafana

EXPOSE 3000

CMD ["./bin/grafana-server"]
