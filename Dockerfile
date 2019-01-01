FROM debian:buster-slim
LABEL maintainer="Baptiste Mathus <batmat@batmat.net>"

RUN apt-get update
RUN apt-get install clamav -y
ENV DIRTOSCAN=/toscan
COPY scan.sh /scan.sh
ENTRYPOINT [ "/scan.sh" ]