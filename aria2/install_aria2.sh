# 安装软件
yum install -y wget curl crontab yum-cron httpd git

# 创建目录
mkdir /root/aria2
chmod -R 755 /root/aria2

# 从git上下载webui-aria2 UI端
git clone https://github.com/ziahamza/webui-aria2 /root/aria2
mv /root/aria2/webui-aria2/ /var/www/html/

# 创建下载目录
mkdir /root/Download/
mkdir /root/OneDrive/

# 赋予权限
chmod 777 -R /root/Download/
chmod 755 -R /var/www/html/webui-aria2

# aria2
cd /root/aria2
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/aria2.sh && chmod +x aria2.sh

# 安装 aria2
echo -e "1\ny\n\n"| bash /root/ssrexp/aria2.sh

# 添加自动移动脚本
echo "seed-time=1" >> /root/.aria2/aria2.conf
echo "on-download-stop=/root/ssrexp/delete.sh" >> /root/.aria2/aria2.conf
echo "on-download-complete=/root/ssrexp/autoupload.sh" >> /root/.aria2/aria2.conf


# echo "on-download-complete=/root/move.sh" >> /root/.aria2/aria2.conf

# rclone mount onedrive:/ /root/OneDrive/ --dir-perms 0777 --file-perms 0777 --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --daemon --umask 000
