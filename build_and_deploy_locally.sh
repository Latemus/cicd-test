#!/bin/bash

source "$(dirname "$0")/config.sh"  # Load configuration

# Define the Docker image name and version
IMAGE_NAME="latemus/ci-cd-test"
CONTAINER_NAME="ci-cd-test"

# Stop and remove the current running container
docker stop $IMAGE_NAME

# Pull the latest image
docker build -t $IMAGE_NAME .

# Run the updated image
docker run -d --name $CONTAINER_NAME \
  -e TELEGRAM_BOT_TOKEN \
  -e TELEGRAM_CHAT_ID \
$IMAGE_NAME
