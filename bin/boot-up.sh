#!/bin/bash

# Starts up the docker system for ngrok/frontend/nginx
# Checks the system architecture to install the proper ngrok version (arm/amd64)

if [ -z $(which jq) ]; then
  echo "Please install jq!"
  echo "sudo apt-get install jq"
  echo "or"
  echo "brew install jq"
  exit 1
fi

if [[ $(uname) = *"Darwin"* ]]; then
  ARCH="amd64"
elif [[ $(uname) = *"Linux"* ]]; then
  ARCH="arm"
fi

echo "Set arch to ${ARCH}"

echo "Starting build process"

docker-compose build --build-arg arch=$ARCH

echo "Starting up..."

docker-compose up -d

echo "All gravy! :D"

# Gets the public url for each of the created tunnels
echo "The tunnels created by ngrok:"
curl localhost:4040/api/tunnels | jq '.tunnels[]? | .public_url?'