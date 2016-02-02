
#!/bin/sh

VERSION=0.12.0rc1
VERSION_SUFFIX=os1
MAINTAINER="adrian@opensignal.com"

https://github.com/prometheus/node_exporter/releases/download/0.12.0rc1/node_exporter-0.12.0rc1.linux-amd64.tar.gz
wget -c https://github.com/prometheus/node_exporter/releases/download/$VERSION/node_exporter-$VERSION.linux-amd64.tar.gz
tar xzf node_exporter-$VERSION.linux-amd64.tar.gz
chmod +x node_exporter

fpm -f -m "$MAINTAINER" -t deb -s dir -n prometheus-node_exporter -v $VERSION-$VERSION_SUFFIX \
  node_exporter=/usr/lib/prometheus/node_exporter \
  init.conf=/etc/init/prometheus-node_exporter.conf \
  defaults=/etc/defaults/prometheus-node_exporter
