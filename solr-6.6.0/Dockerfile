FROM openjdk:alpine
#
MAINTAINER FansinZhao 171388204@qq.com

#mirrors.hust.edu.cn/apache/lucene/solr/6.6.0
RUN apk add --no-cache bash && \
    wget -O solr-6.6.0.tgz http://172.17.0.4/solr-6.6.0.tgz && \
    tar -zxvf solr-6.6.0.tgz && \
    rm solr-6.6.0.tgz && \
    chmod -R +x /solr-6.6.0/bin && \
    cp -R /solr-6.6.0/server/solr/configsets/basic_configs/ /solr-6.6.0/server/solr/configsets/nutch/
    
COPY schema.xml /solr-6.6.0/server/solr/configsets/nutch/conf/schema.xml
COPY solrconfig.xml /solr-6.6.0/server/solr/configsets/nutch/conf/solrconfig.xml

COPY entrypoint.sh entrypoint.sh

RUN rm /solr-6.6.0/server/solr/configsets/nutch/conf/managed-schema && \
    chmod a+x /entrypoint.sh

ENV PATH /solr-6.6.0/bin:$PATH

ENV SOLR /solr-6.6.0/

ENTRYPOINT ["/entrypoint.sh"]

