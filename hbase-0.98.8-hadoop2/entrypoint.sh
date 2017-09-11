#!/usr/bin/env bash
/usr/sbin/sshd
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh &&\
start-hbase.sh
tail -f  $HADOOP_HOME/logs/hadoop-root-*.log $HBASE_HOME/logs/hbase-*.log

