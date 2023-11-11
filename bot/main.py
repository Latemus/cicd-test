import asyncio
import logging
import platform

from telegram.ext import Application

import bot.config

logger = logging.getLogger(__name__)
system_architecture = platform.machine()


async def notify_startup(application: Application) -> None:
    target_chat_id = config.startup_notification_chat_id
    await application.bot.send_message(chat_id=target_chat_id, text=f'Bot started on platform {system_architecture}!')


async def main() -> None:
    """ Initiate Telegram Python Bot application with its handlers"""
    bot_token = config.bot_token
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
