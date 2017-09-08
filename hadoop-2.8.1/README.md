#fansin/hadoop

基于openjdk:alpine镜像,集成了hadoop2.8.1,镜像为简单单机镜像,创建容器成功后,
将会启动三个进程(节点),namenode,secondarynamenode,datanode.

#HOW TO USE

    docker run --name my-hadoop -itd fansin/hadoop

启动成功后,可以通过web监控,http://172.17.0.2:50070 `172.17.0.2` 是启动容器IP.

    docker inspect my-hadoop | grep IP

日志包含三个节点日志

    docker logs -f my-hadoop

#CUSTOMIZE

hadoop安装位置: ｀／hadoop-2.8.1｀,可以通过覆盖或挂载相关配置文件

    docker cp configfile my-hadoop:/hadoop-2.8.1/configfile

#QUESTIONS

 FansinZhao 171388204@qq.com


