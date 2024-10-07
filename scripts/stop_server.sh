#!/bin/bash
echo "Stopping the Node.js application using pm2"
pm2 stop all || true
pm2 delete all || true
