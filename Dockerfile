#基于centos镜像来构建
FROM centos

#维护者信息
MAINTAINER liuzd_bj<liuzd_bj@si-tech.com.cn>

#镜像操作命令
#时间配置
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

#定义基础软件安装目录
RUN mkdir -p /interactive/install-tools/


#安装 
RUN yum install -y vim less wget curl gcc automake autoconf libtool make gcc-c++ zlib zip unzip bind-utils  

#安装perl
WORKDIR  /interactive/install-tools/

RUN wget http://www.cpan.org/src/5.0/perl-5.16.1.tar.gz
RUN tar -xzf  perl-5.16.1.tar.gz

WORKDIR perl-5.16.1

RUN ./Configure -des -Dprefix=/usr/local/perl

RUN make && make test && make install
