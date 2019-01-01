FROM debian:buster-slim
LABEL maintainer="Baptiste Mathus <batmat@batmat.net>"

RUN apt-get update \
    && apt-get install clamav -y \
    && rm -rf /var/lib/apt/lists/*

ENV DIRTOSCAN=/toscan
COPY scan.sh /scan.sh
ENTRYPOINT [ "/scan.sh" ]
