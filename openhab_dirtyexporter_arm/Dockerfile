FROM voronenko/arm-alpine-quemu:3.5

ENV LANG C.UTF-8

COPY setup.py /src/setup.py
COPY src /src/src

RUN ["cross-build-start"]

RUN apk add --no-cache alpine-sdk libffi-dev openssl-dev && \
    pip install 'Twisted[tls]' 'arrow' && \
    cd /src && python setup.py install && \
    rm -rf /src && \
    apk del alpine-sdk

RUN ["cross-build-end"]

EXPOSE 9266

ENTRYPOINT ["openhab_exporter"]
