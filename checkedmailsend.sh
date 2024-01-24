#!/bin/bash

response=$(curl -s 'https://ec2-18-218-197-117.us-east-2.compute.amazonaws.com/balance?address=0x4b570b98FC419992CfFFa7fe92f011A4741A1Da1')

if [ $? -ne 0 ]; then
  echo "network" | mailx -s "error" 68208932@qq.com
else
  balance=$(echo $response | jq -r '.balance')
  echo "mount is $balance" | mailx -s "yu,e" 68208932@qq.com
fi
