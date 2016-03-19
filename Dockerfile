FROM debian:jessie
MAINTAINER Arnold Bechtoldt <mail@arnoldbechtoldt.com>

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -qq && \
    apt-get upgrade -yV -o DPkg::Options::=--force-confold && \
    apt-get install -yV -o DPkg::Options::=--force-confold \
        wget && \
    wget --progress=dot:giga -O /kubectl https://storage.googleapis.com/kubernetes-release/release/v1.2.0/bin/linux/amd64/kubectl && \
    chmod +x /kubelet && \
    apt-get remove -yV wget && \
    apt-get autoremove -yV && \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
