#!/bin/bash

API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"
ERROR_EMAIL="682808932@qq.com"
SUCCESS_EMAIL="68208932@qq.com"

RESPONSE=$(curl -s $API_URL)
STATUS=$?

if [ $STATUS -eq 0 ]; then
    BALANCE=$(echo $RESPONSE | jq '.balance')
    if [ ! -z "$BALANCE" ]; then
        echo "yu，e，shi: $BALANCE" | mail -s "export" $SUCCESS_EMAIL
    else
        echo "APIno answer。" | mail -s "Api error" $ERROR_EMAIL
    fi
else
    echo "can not API." | mail -s "network error" $ERROR_EMAIL
fi
# mail -v是显示传递细节
