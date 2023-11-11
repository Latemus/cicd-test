#!/bin/bash

source "$(dirname "$0")/config.sh"  # Load configuration

# These environmental variables should be set
echo "BOT_TOKEN: $BOT_TOKEN"
echo "STARTUP_NOTIFICATION_CHAT_ID: $STARTUP_NOTIFICATION_CHAT_ID"

# Define the Docker image name and version
IMAGE_NAME="latemus/ci-cd-test"
CONTAINER_NAME="ci-cd-test"

# Stop and remove the current running container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Pull the latest image
docker build -t $IMAGE_NAME .

# Run the updated image
docker run -d --name $CONTAINER_NAME \
  -e BOT_TOKEN \
  -e STARTUP_NOTIFICATION_CHAT_ID \
$IMAGE_NAME
