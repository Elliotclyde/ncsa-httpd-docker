FROM ubuntu:latest

RUN apt update
# Curl and vim are just for debugging
RUN apt-get install -y curl 
RUN apt-get install -y vim  
# Required for building ncsa-httpd
RUN apt-get install -y make 
RUN apt-get install -y gcc 
RUN apt-get install -y libgdbm-compat-dev 
RUN apt-get install -y git 

RUN mkdir -p '/usr/local/etc/httpd'
RUN mkdir -p '/usr/local/etc/httpd/conf'
RUN mkdir -p '/usr/local/etc/httpd/htdocs'
RUN mkdir -p '/usr/local/etc/httpd/logs'

RUN mkdir -p /tmp

RUN git clone https://github.com/rfinnie/ncsa-httpd.git

RUN cd ./ncsa-httpd/src/ && make linux

RUN cd ./ncsa-httpd/ && cp conf/httpd.conf-dist /usr/local/etc/httpd/conf/httpd.conf
RUN cd ./ncsa-httpd/ && cp conf/srm.conf-dist /usr/local/etc/httpd/conf/srm.conf
RUN cd ./ncsa-httpd/ && cp conf/mime.types /usr/local/etc/httpd/conf/mime.types
RUN cd ./ncsa-httpd/ && cp conf/access.conf-dist /usr/local/etc/httpd/conf/access.conf

RUN echo '<html><head><title>NCSA server test</title></head><body><h1>NCSA server test!</h1></body></html>' >> /usr/local/etc/httpd/htdocs/index.html

RUN cd ./ncsa-httpd/ && ./httpd
