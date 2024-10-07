version: 0.0
os: linux
files:
  - source: /
    destination: /home/ec2-user/nodejs-app  # Adjust according to your app's structure

hooks:
  AfterInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root  # Specify root user here
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root  # Specify root user here
