#!/bin/bash

API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"


RESPONSE=$(curl -s $API_URL)
STATUS=$?

if [ $STATUS -eq 0 ]; then
    BALANCE=$(echo $RESPONSE | jq '.balance')
    if [ ! -z "$BALANCE" ]; then
        echo "yu，e，shi: $BALANCE" | mail -s "export" 68208932@qq.com
    else
        echo "APIno=answer" | mail -s "Api error" 68208932@qq.com
    fi
else
    echo "can not API." | mail -s "network error" 68208932@qq.com
fi
# mail -v是显示传递细节
