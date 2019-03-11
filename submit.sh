#!/usr/bin/bash

$SPARK_HOME/bin/spark-submit \
  --master mesos://apollo.cm.cluster:5050 \
  --deploy-mode client \
  --conf spark.deploy.spreadOut=false \
  --conf spark.eventLog.enabled=true \
  --conf spark.eventLog.dir=file:///var/spark/events \
  --conf spark.scheduler.mode=FIFO \
  --driver-memory 16g \
  /home/svendo/workshop/scripts/spark.lapply_example1.R
