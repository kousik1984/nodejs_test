#!/bin/bash
set -e  # Exit script on any error

LOG_FILE="/home/ec2-user/deploy.log"
log_message() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

log_message "Starting Node.js application..."

# Change to the application directory
cd /home/ec2-user/nodejs-app || exit 1  # Change this to your app's path

# Start the application using pm2
if command -v pm2 > /dev/null; then
  pm2 start app.js --name "my-node-app" >> $LOG_FILE 2>&1
  log_message "Node.js application started."
else
  log_message "pm2 not found. Please install pm2."
  exit 1
fi
