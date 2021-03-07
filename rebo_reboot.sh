#!/bin/bash
echo "Stopping Docker container"
docker container stop 883c50e483cc
sleep 15
echo "Starting container again"
docker container start 883c50e483cc
