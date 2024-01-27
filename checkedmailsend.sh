#!/bin/bash

export API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"
export YOUX="68208932@qq.com"

 echo -n | openssl s_client -connect ec2-18-218-197-117.us-east-2.compute.amazonaws.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ~/.certs/q123.crt
 # 安装查询网址的证书

# 增加了 `-m 30`，设置超时时间为 30 秒
# RESPONSE=$(curl -k -s -m 30 $API_URL)
RESPONSE=$(curl -k -s -m 30 $API_URL)
STATUS=$? # status测得上一个api查询链接是否返回成功

if [ $STATUS -eq 0 ]; then  # eq为等于，
    BALANCE=$(echo $RESPONSE | jq '.balance')
    if [ ! -z "$BALANCE" ]; then
        echo "yu.e.shi: $BALANCE" | mail -s "export" $YOUX
    else
        echo "APIno=answer" | mail -s "Api error" $YOUX
    fi
else
    echo "can not API." | mail -s "network error" $YOUX
fi




