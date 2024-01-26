#!/bin/bash

API_URL="https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1"

RESPONSE=$(curl -s $API_URL)
STATUS=$?

if [ $STATUS -eq 0 ]; then
    # 直接使用 API 响应作为邮件内容
    echo "$RESPONSE" | mail -s "API Response" 68208932@qq.com
else
    echo "Failed to reach the API." | mail -s "Network error" 68208932@qq.com
fi
