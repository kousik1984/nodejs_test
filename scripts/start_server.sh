#!/bin/bash
set -e  # Exit script on any error

LOG_FILE="/home/ec2-user/deploy.log"

log_message() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

log_message "Starting Node.js application..."

# Install pm2 if it's not installed
if ! command -v pm2 > /dev/null; then
  log_message "pm2 not found. Installing pm2..."
  npm install -g pm2 >> $LOG_FILE 2>&1
  log_message "pm2 installed."
else
  log_message "pm2 is already installed."
fi

# Change to the application directory
cd /home/ec2-user/nodejs-app || { log_message "Failed to change directory to /home/ec2-user/nodejs-app"; exit 1; }

# Check if the app is already running and restart if it is
if pm2 list | grep -q "my-node-app"; then
  pm2 restart my-node-app >> $LOG_FILE 2>&1
  log_message "Node.js application restarted."
else
  pm2 start app.js --name "my-node-app" >> $LOG_FILE 2>&1
  log_message "Node.js application started."
fi

# Optionally, show the logs for the application
pm2 logs my-node-app >> $LOG_FILE 2>&1
