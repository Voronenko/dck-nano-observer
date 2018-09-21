FROM alpine:3.5
# ORIGINAL CREDITS:  https://github.com/nopp/grafana_alpine

LABEL maintainer "git@voronenko.info"
LABEL version="4.6.3"

ARG grafana_version="4.6.3"
ARG GF_UID="472"
ARG GF_GID="472"

ENV PATH=/opt/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

RUN apk update \
    && apk add openssl curl shadow \
    && groupadd -r -g $GF_GID grafana \
    && useradd -r -u $GF_UID -g grafana grafana \
    && mkdir -p "$GF_PATHS_PROVISIONING/datasources" \
    "$GF_PATHS_PROVISIONING/dashboards" \
    "$GF_PATHS_LOGS" \
    "$GF_PATHS_PLUGINS" \
    "$GF_PATHS_DATA" \
    && curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
	&& curl -LO https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${grafana_version}.linux-x64.tar.gz \
	&& apk add glibc-2.23-r3.apk \
	&& tar xzvf grafana-${grafana_version}.linux-x64.tar.gz \
	&& mv grafana-${grafana_version}/ grafana/ \
	&& rm -rf grafana-${grafana_version}.linux-x64.tar.gz \
	&& rm -rf glibc-2.23-r3.apk \
	&& apk del curl openssl \
    && cp "$GF_PATHS_HOME/conf/sample.ini" "$GF_PATHS_CONFIG" \
    && cp "$GF_PATHS_HOME/conf/ldap.toml" /etc/grafana/ldap.toml \
    && mkdir -p "$GF_PATHS_HOME/.aws" \
    && chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" \
    && chmod 777 "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS"

ADD docker_entrypoint /docker_entrypoint
RUN chmod +x docker_entrypoint

USER grafana

WORKDIR $GF_PATHS_HOME

EXPOSE 3000

CMD ["/docker_entrypoint"]
