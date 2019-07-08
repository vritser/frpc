FROM arm64v8/alpine

ENV FRPS_VERSION=0.27.0
EXPOSE 7000

RUN FRPS_TAR=frp_${FRPS_VERSION}_linux_arm64.tar.gz && \
    FRPS_DIR=frp_${FRPS_VERSION}_linux_arm64 && \
    wget --no-check-certificate -q https://github.com/fatedier/frp/releases/download/v${FRPS_VERSION}/${FRPS_TAR} && \
    tar xzf ${FRPS_TAR} && \
    mv ${FRPS_DIR} /frpc && \
    rm ${FRPS_TAR}

VOLUME /conf

ENTRYPOINT ["/frpc/frpc", "-c", "/conf/frpc.ini"]
