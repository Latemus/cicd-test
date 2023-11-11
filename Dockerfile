# Choose a base image that supports multiple architectures, such as python:slim
FROM python:3.9-slim

# Set a working directory in the Docker image
WORKDIR /app

# Copy your application code to the Docker image
COPY . /app

# Install your application dependencies
RUN pip install --no-cache-dir python-telegram-bot==20.6

# Run your application when the Docker container starts
CMD ["python", "src/bot/main.py"]
