###### QNIBTerminal Image
FROM qnib/terminal

ADD etc/yum.repos.d/grafana.repo /etc/yum.repos.d/
RUN echo "2015-12-09.1" && \ 
    dnf clean all && \
    dnf install -y grafana
ADD opt/qnib/grafana/bin/feed_random_metrics.sh /opt/qnib/grafana/bin/
ADD etc/supervisord.d/*.ini /etc/supervisord.d/
ADD etc/grafana/grafana.ini /etc/grafana/
ADD var/lib/grafana/grafana.db /var/lib/grafana/
ADD etc/consul.d/check_grafana2.json /etc/consul.d/
