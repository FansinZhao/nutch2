FROM openjdk:alpine
#
MAINTAINER FansinZhao 171388204@qq.com

#install required software
#
RUN apk add --no-cache bash openssh-server openssh-client rsync && \
    wget -O hadoop-2.8.1.tar.gz http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz && \
    tar -zxvf hadoop-2.8.1.tar.gz && \
    rm -r hadoop-2.8.1/share/doc && \
    rm hadoop-2.8.1.tar.gz

#generate ssh key
RUN ssh-keygen -A && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/id_rsa && \
    cp /etc/ssh/id_rsa.pub /etc/ssh/authorized_keys && \
    mkdir -p /root/.ssh && \
    cp -f /etc/ssh/ssh_config /root/.ssh/config && \
    cp /etc/ssh/authorized_keys /root/.ssh/authorized_keys && \
    cp /etc/ssh/id_rsa /root/.ssh/id_rsa

#skip input yes    
RUN sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/g' /etc/ssh/ssh_config

ENV HADOOP_HOME /hadoop-2.8.1/

#hadoop 
RUN sed -i "s#export JAVA_HOME=\${JAVA_HOME}#export JAVA_HOME=$JAVA_HOME#g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    sed -i '/<configuration/{n;s/<\/configuration/   <property>\n      <name>fs.defaultFS<\/name>\n      <value>hdfs:\/\/localhost:9900<\/value>\n    <\/property>\n&/g}' $HADOOP_HOME/etc/hadoop/core-site.xml && \
     sed -i '/<configuration/{n;s/<\/configuration/   <property>\n      <name>dfs.replication<\/name>\n      <value>1<\/value>\n    <\/property>\n&/g}' $HADOOP_HOME/etc/hadoop/hdfs-site.xml
  
#COPY etc/ /hadoop-2.8.1/etc/
COPY run.sh /

RUN chmod +x /run.sh

CMD ["/run.sh"]

