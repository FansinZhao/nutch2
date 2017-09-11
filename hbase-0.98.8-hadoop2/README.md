# hbase(for nutch)

这个是为nutch而创建的镜像,版本比较老是0.98.8,如果使用其他新版本,nutch需要做很多处理.
这个镜像是在 fansin/hadoop 镜像基础添加hbase.

# HOW TO USE

    docker run --name my-hbase-nutch -itd fansin/hbase:0.98.8

启动成功后,可以通过web监控,hadoop http://172.17.0.2:50070  和 hbase http://172.17.0.7:60010/
`172.17.0.2` 是启动容器IP.

    docker inspect my-hbase-nutch | grep IP

日志所有日志,所以比较乱,可以通过exec单独查看相关日志

    docker logs -f my-hbase-nutch

# CUSTOMIZE

hadoop安装位置: `／hadoop-2.8.1`,可以通过覆盖或挂载相关配置文件

    docker cp configfile my-hadoop:/hadoop-2.8.1/configfile

hbase安装文件  `/hbase-0.98.8-hadoop2`,可以通过覆盖或挂载相关配置文件

    docker cp configfile my-hbase-nutch:/hbase-0.98.8-hadoop2/conf/configfile

已覆盖的配置文件,可以查看github

# QUESTIONS

 FansinZhao 171388204@qq.com

# THANKS

  谢谢

