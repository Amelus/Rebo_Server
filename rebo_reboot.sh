#!/bin/bash
echo "Stopping Docker container"
cd /home/ahamidovic/Rebo_Server/
/usr/local/bin/docker-compose stop
sleep 15
echo "Rebuilding Docker"
/usr/local/bin/docker-compose build --no-cache
sleep 15
echo "Starting container again"
/usr/local/bin/docker-compose up -d
