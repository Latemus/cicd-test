# cicd-test
Simple Python Telegram Bot application that sends a message to a chat on startup. Created solely for learning CI/CD, Github Actions, Docker multi-arch builds, Dockerhub and automatic deployment from Raspberry Pi server.

Resulting images found from https://hub.docker.com/r/latemus/ci-cd-test/tags.

## How to run:
- Have following environmental variables set up
  - BOT_TOKEN: Token of Telegram bot that should send a startup notification
  - STARTUP_NOTIFICATION_CHAT_ID: Chat id to which the startup notification is sent.

Either build and deploy locally with `build_and_deploy_locally.sh` or check latest main-tag from docker hub and run it if it's newer than current one with `deploy_from_dockerhub.sh`.