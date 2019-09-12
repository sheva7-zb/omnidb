FROM centos:7.4.1708

MAINTAINER cechealth DAQ team @zb

RUN curl "https://raw.githubusercontent.com/bumpx/oracle-instantclient/master/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm" -o /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm \
    && curl "https://omnidb.org/dist/2.16.0/omnidb-server_2.16.0-centos7-amd64.rpm" -o /tmp/omnidb-server_2.16.0-centos7-amd64.rpm

#also you can download *.rpm locally first.
#COPY oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm /tmp
#COPY omnidb-server_2.16.0-centos7-amd64.rpm /tmp

RUN yum -y update \
      && yum -y install /tmp/omnidb-server_2.16.0-centos7-amd64.rpm  \
	  && yum -y install /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm 

ENV LD_LIBRARY_PATH /usr/lib/oracle/12.2/client64/lib

EXPOSE 8000 25000

ENTRYPOINT ["omnidb-server", "-p", "8000", "-w", "25000", "-H", "0.0.0.0"]
