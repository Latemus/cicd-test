import logging
import os

logging_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
logging.basicConfig(format=logging_format, level=logging.INFO)  # NOSONAR

# Remember to add your values to the environment variables
# Required to run the bot
bot_token = os.getenv("BOT_TOKEN")

# Chat id to which a message is sent on startup
startup_notification_chat_id = os.getenv("STARTUP_NOTIFICATION_CHAT_ID")
