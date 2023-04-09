#!/bin/bash

export OPENAI_API_KEY=$(aws secretsmanager get-secret-value --secret-id api_keys --query SecretString --output text | jq -r .OPENAI_API_KEY)
export PINECONE_API_KEY=$(aws secretsmanager get-secret-value --secret-id api_keys --query SecretString --output text | jq -r .PINECONE_API_KEY)

# API CONFIG
export OPENAI_API_MODEL=gpt-3.5-turbo # alternatively, gpt-4, text-davinci-003, etc
export PINECONE_ENVIRONMENT=us-central1-gcp

# TABLE CONFIG
export TABLE_NAME=test-table

# INSTANCE CONFIG
export BABY_NAME=BabyAGI

# RUN CONFIG
export OBJECTIVE="Write a 10 chapter book talking about the history of the world"
# For backwards compatibility
# FIRST_TASK can be used instead of INITIAL_TASK
export INITIAL_TASK="Develop a task list"

# Extensions
# List additional extensions to load (except .env.example!)
#DOTENV_EXTENSIONS=
# Set to true to enable command line args support
export ENABLE_COMMAND_LINE_ARGS=false
python3 babyagi.py

