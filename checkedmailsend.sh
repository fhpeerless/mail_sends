#!/bin/bash

export API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"
export YOUX="68208932@qq.com"




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



export API_URL_BASE="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address="
export ADDRESSES=("0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1" "address2" "address3")
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

