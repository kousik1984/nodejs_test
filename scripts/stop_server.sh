#!/bin/bash
set -e  # Exit script on any error
echo "Stopping Node.js application" >> /home/ec2-user/deploy.log

# Example using pm2
if pm2 status; then
  pm2 stop all >> /home/ec2-user/deploy.log 2>&1
  pm2 delete all >> /home/ec2-user/deploy.log 2>&1
else
  echo "pm2 not found or no processes running" >> /home/ec2-user/deploy.log 2>&1
fi
