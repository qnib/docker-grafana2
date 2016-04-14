#!/bin/bash

METRIC=${1-mymetric.test}
SLEEP=${1-5}

if [ "X${RANDOM_METRICS}" != "Xtrue" ];then
   echo "RANDOM_METRICS is not set to true, therefore I skip this"
   exit 0
fi

while [ true ];do 
    echo "put ${METRIC} $(date +%s) ${RANDOM} host=grafana"|nc -w1 opentsdb.service.consul 4242
    sleep ${SLEEP}
done
