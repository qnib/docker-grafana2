###### grafana images
FROM qnib/terminal:light
MAINTAINER "Christian Kniep <christian@qnib.org>"

ADD etc/yum.repos.d/grafana.repo /etc/yum.repos.d/
RUN yum install -y grafana
ADD opt/qnib/grafana/bin/feed_random_metrics.sh /opt/qnib/grafana/bin/
ADD etc/supervisord.d/*.ini /etc/supervisord.d/
ADD etc/grafana/grafana.ini /etc/grafana/
ADD var/lib/grafana/grafana.db /var/lib/grafana/
ADD etc/consul.d/check_grafana2.json /etc/consul.d/
