
#!/bin/sh

VERSION=0.14.0
VERSION_EPOCH=2:
VERSION_SUFFIX=os8
MAINTAINER="adrian@opensignal.com"

wget -c https://github.com/prometheus/node_exporter/releases/download/$VERSION/node_exporter-$VERSION.linux-amd64.tar.gz
tar xzf node_exporter-$VERSION.linux-amd64.tar.gz

fpm -f -m "$MAINTAINER" -t deb -s dir -n prometheus-node_exporter -v $VERSION_EPOCH$VERSION-$VERSION_SUFFIX \
  --deb-upstart init/prometheus-node_exporter  --deb-default default/prometheus-node_exporter \
  --post-install postinst \
  systemd/prometheus-node_exporter=/lib/systemd/system/prometheus-node_exporter.service \
  node_exporter-$VERSION.linux-amd64/node_exporter=/usr/lib/prometheus/node_exporter

