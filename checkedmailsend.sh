#!/bin/bash

export API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"
export YOUX="68208932@qq.com"

export API_URL_BASE="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address="
export ADDRESSES=("0x1F88ac245c8e3715c22C5A9c4aEe2C8aAB279F07" "0xC77572024f24Ef5159348Fd6bBE613918db87FDF" "0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1" "0xB463e29E3ec2fCeB2Db9e9398790149ADB78BD6b" "0x76A8B8fa6Db904cf7e89aa8D4CCc7FdAD1Ab0D6D")
export ERROR_EMAIL="682808932@qq.com"
export SUCCESS_EMAIL="68208932@qq.com"
EMAIL_SUBJECT="adress_balance" #地址报告
EMAIL_BODY=""

for ADDRESS in "${ADDRESSES[@]}"
do
  API_URL="${API_URL_BASE}${ADDRESS}"
  RESPONSE=$(curl --cacert ~/.certs/q123.crt -s -m 60 $API_URL)
  STATUS=$?
  
  if [ $STATUS -eq 0 ]; then
      BALANCE=$(echo $RESPONSE | jq '.balance')
      if [ ! -z "$BALANCE" ]; then
          EMAIL_BODY="${EMAIL_BODY}adress: ${ADDRESS}, balance: ${BALANCE}\n"
      else
          EMAIL_BODY="${EMAIL_BODY}adress: ${ADDRESS}, APInoanswer\n"
      fi
  else
      EMAIL_BODY="${EMAIL_BODY}adress: ${ADDRESS}, API,loser\n"
  fi
done

echo -e "$EMAIL_BODY" | mail -s "$EMAIL_SUBJECT" $SUCCESS_EMAIL




# 增加了 `-m 30`，设置超时时间为 30 秒
# RESPONSE=$(curl -I -k -s -m 60 $API_URL)
# RESPONSE=$(curl -k -s -m 30 $API_URL) 忽略证书

# RESPONSE=$(curl --cacert ~/.certs/q123.crt -s -m 60 $API_URL)
# STATUS=$? # status测得上一个api查询链接是否返回成功

# if [ $STATUS -eq 0 ]; then  # eq为等于，
#     BALANCE=$(echo $RESPONSE | jq '.balance')
#     if [ ! -z "$BALANCE" ]; then
#        echo "yu.e.shi: $BALANCE" | mail -s "balance" $YOUX
#     else
#        echo "APIno=answer" | mail -s "Api error" $YOUX
#     fi
#    else
#     echo "can not API." | mail -s "network error" $YOUX
# fi





