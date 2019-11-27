FROM centos:7
# aria2 
RUN cd /root \
    && yum install -y wget curl crontab yum-cron httpd git
RUN git clone https://github.com/Weicoz/aria2_docker.git /root/aria2 \
    && bash /root/aria2/install_aria2.sh
RUN yum clean headers \
    && yum clean packages \
    && yum clean metadata
CMD ["sh", "-c", "httpd;/etc/init.d/aria2 restart;bash;"]