#!/bin/bash

response=$(curl -s 'https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x08a275F54FBdC0B627968E3dCa789de839fbc')

if [ $? -ne 0 ]; then
  echo "网络错误" | mailx -s "请求失败" 68208932@qq.com
else
  balance=$(echo $response | jq -r '.balance')
  echo "您的余额为 $balance" | mailx -s "余额信息" 68208932@qq.com
fi