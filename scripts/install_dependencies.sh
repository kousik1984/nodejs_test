
#!/bin/bash
set -e  # Exit script on any error

# Log file
LOG_FILE="/home/ec2-user/deploy.log"

# Function to log messages
log_message() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

log_message "Starting installation of Node.js dependencies..."

# Navigate to the application directory (adjust as necessary)
cd /home/ec2-user/nodejs-app || exit 1  # Change this to your app's path

# Optional: Remove existing node_modules if you want a fresh install
if [ -d "node_modules" ]; then
  log_message "Removing existing node_modules directory..."
  rm -rf node_modules
fi

# Install npm dependencies
log_message "Installing npm dependencies..."
npm install >> $LOG_FILE 2>&1

log_message "Node.js dependencies installation completed."
