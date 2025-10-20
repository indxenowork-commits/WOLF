#!/bin/bash

echo "🐺 Starting Wolf Bot..."
echo ""

# Install aiohttp first to prevent ModuleNotFoundError
echo "📦 Ensuring aiohttp is installed..."
./install_aiohttp.sh

if [ $? -ne 0 ]; then
    echo "❌ Failed to install aiohttp. Installing all dependencies..."
    ./setup.sh
fi

echo ""
echo "🚀 Starting bot..."
cd src && python bot.py
