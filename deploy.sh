#!/bin/bash

# Set the image name
IMAGE_NAME="latemus/ci-cd-test:latest"
CONTAINER_NAME="ci-cd-test"

## Load local environment variables
# should have a 'config.sh' file in the same directory that exports required environment variables like:
# config.sh:
# export TELEGRAM_BOT_TOKEN="bot_Token"
# export TELEGRAM_CHAT_ID="chat_id"
#
source "$(dirname "$0")/config.sh"  # Load configuration

# Check for newer version of the image on Docker Hub
LOCAL_IMAGE_ID=$(docker inspect --format='{{.Id}}' $IMAGE_NAME 2>/dev/null || true)
REMOTE_IMAGE_ID=$(docker pull $IMAGE_NAME | grep -oP '(?<=Digest: ).*')

# Redeploy if there is a newer image available
if [ "$REMOTE_IMAGE_ID" != "" ] && [ "$LOCAL_IMAGE_ID" != "$REMOTE_IMAGE_ID" ]; then
  # Stop and remove the existing container if it's running
  docker stop $CONTAINER_NAME || true
  docker rm $CONTAINER_NAME || true

  # Run the new image as a container
  docker run -d --name $CONTAINER_NAME \
    -e TELEGRAM_BOT_TOKEN \
    -e TELEGRAM_CHAT_ID \
    $IMAGE_NAME
else
  echo "No updates found. Current image is up to date."
fi
