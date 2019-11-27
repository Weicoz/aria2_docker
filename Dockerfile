FROM centos:7
# aria2 
RUN cd /root \
    && yum install -y wget curl crontab yum-cron httpd git
COPY aria2 /root
RUN bash /root/aria2/install_aria2.sh
RUN yum clean headers \
    && yum clean packages \
    && yum clean metadata
CMD ["sh", "-c", "httpd;/etc/init.d/aria2 restart;bash;"]