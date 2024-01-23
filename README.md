用于centos8.5 QQ邮箱的发送，进行设置，账号和授权码
git clone https://github.com/fhpeerless/mail_sends.git  克隆
cd mail_sends  移动到目录
------
chmod +x to_install_mail.sh   授予权限
------

./to_install_mail.sh  运行脚本


发送邮件
echo '这是测试邮件' | mail -s '邮件主题' target@example.com
