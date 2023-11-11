#!/bin/bash

source "$(dirname "$0")/config.sh"  # Load configuration

# Define the Docker image name and version
IMAGE_NAME="latemus/ci-cd-test:main"
CONTAINER_NAME="ci-cd-test"

# Function to check if a new version is available
function is_new_version_available() {
    LATEST_VERSION=$(docker pull $IMAGE_NAME | grep "Status: Downloaded newer image" | wc -l)
    if [ $LATEST_VERSION -gt 0 ]; then
        return 0 # New version available
    else
        return 1 # No new version available
    fi
}

# Check if a new version is available
if is_new_version_available; then
    echo "New version of $IMAGE_NAME is available. Updating and restarting..."

    # Stop and remove the current running container
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME

    # Pull the latest image
    docker pull $IMAGE_NAME

    # Run the updated image
    docker run $IMAGE_NAME \
      -d \
      --name $CONTAINER_NAME \
      -e "$BOT_TOKEN" \
      -e "$STARTUP_NOTIFICATION_CHAT_ID" \

else
    echo "No new version available. Exiting..."
fi
