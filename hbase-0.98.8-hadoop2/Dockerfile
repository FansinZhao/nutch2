FROM fansin/hadoop
#
MAINTAINER FansinZhao 171388204@qq.com

#http://archive.apache.org/dist/hbase/hbase-0.98.8/hbase-0.98.8-hadoop2-bin.tar.gz
RUN wget -O hbase-0.98.8-hadoop2.tar.gz http://172.17.0.4/hbase-0.98.8-hadoop2-bin.tar.gz && \
    tar -zxvf hbase-0.98.8-hadoop2.tar.gz && \
    rm -r hbase-0.98.8-hadoop2/docs && \
    rm hbase-0.98.8-hadoop2.tar.gz

ENV HBASE_HOME /hbase-0.98.8-hadoop2

#COPY 
RUN sed -i "s#\# export JAVA_HOME=/usr/java/jdk1.6.0/#export JAVA_HOME=$JAVA_HOME#g" $HBASE_HOME/conf/hbase-env.sh && \
    sed -i '/<configuration/{n;s/<\/configuration/   <property>\n      <name>hbase.cluster.distributed<\/name>\n      <value>true<\/value>\n    <\/property>\n   <property>\n      <name>hbase.rootdir<\/name>\n      <value>hdfs:\/\/localhost:9900\/hbase<\/value>\n    <\/property>\n&/g}' $HBASE_HOME/conf/hbase-site.xml

ENV PATH /hbase-0.98.8-hadoop2/bin:$PATH

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [""]
