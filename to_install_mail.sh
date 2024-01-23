sudo dnf install msmtp msmtp-mta mailx
touch ~/.msmtprc
chmod 600 ~/.msmtprc  #设置msmtp。

#创建配置文件于~/.msmtprc，并确保文件权限为600


# vi .msmtprc
# 写入以下内容
# defaults
# auth           on
# tls            on
# tls_certcheck  off
# logfile        ~/.msmtp.log

# account        qq
# host           smtp.qq.com
# port           587
# from           YOUR_EMAIL@qq.com
# user           YOUR_EMAIL@qq.com
# password       YOUR_AUTHORIZATION_CODE
# —————————————————-————

# vi /etc/mail.rc #添加以下内容
# set sendmail="/usr/bin/msmtp"
# set message-sendmail-extra-arguments="-a qq"

#邮件发送命令
# echo '这是测试邮件' | mail -s '邮件主题' target@example.com
