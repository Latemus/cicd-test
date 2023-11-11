import asyncio
import logging
import os
import platform

from telegram.ext import Application


logger = logging.getLogger(__name__)
system_architecture = platform.machine()

logging_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
logging.basicConfig(format=logging_format, level=logging.INFO)  # NOSONAR

# Remember to add your values to the environment variables
# Required to run the bot
bot_token = os.getenv("BOT_TOKEN")

# Chat id to which a message is sent on startup
startup_notification_chat_id = os.getenv("STARTUP_NOTIFICATION_CHAT_ID")

async def notify_startup(application: Application) -> None:
    target_chat_id = startup_notification_chat_id
    await application.bot.send_message(chat_id=target_chat_id, text=f'Bot started on platform {system_architecture}!')


async def main() -> None:
    """ Initiate Telegram Python Bot application with its handlers"""
    if bot_token == "" or bot_token is None:
        logger.critical("BOT_TOKEN env variable is not set.")
        raise ValueError("BOT_TOKEN env variable is not set.")

    # Create the Application with bot's token and register message handler
    application = Application.builder().token(bot_token).build()
    # application.add_handler(MessageHandler(filters.ALL, reply_to_msg, block=False))

    async with application:
        await notify_startup(application)


if __name__ == "__main__":
    asyncio.run(main())
