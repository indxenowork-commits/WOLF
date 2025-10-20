#!/bin/bash

echo "🔧 Installing Python dependencies..."
echo ""

# Check if running in Docker
if [ -f "/.dockerenv" ]; then
    echo "📦 Docker environment detected"
fi

# Install dependencies
if [ -f "poetry.lock" ] && [ -f "pyproject.toml" ]; then
    echo "Using Poetry for dependency installation..."
    pip install --no-cache-dir poetry==1.5.1
    poetry install --no-root
elif [ -f "requirements.txt" ]; then
    echo "Using pip for dependency installation..."
    pip install --no-cache-dir -r requirements.txt
else
    echo "❌ No dependency files found!"
    exit 1
fi

echo ""
echo "✅ Dependencies installed successfully!"
echo ""

# Verify critical dependencies
echo "🔍 Verifying critical dependencies..."
python3 -c "import aiohttp, discord, tortoise, fastapi; print('✓ aiohttp:', aiohttp.__version__); import discord.ext.commands; print('✓ discord.py: OK'); print('✓ All critical dependencies verified!')" || {
    echo "❌ Dependency verification failed!"
    exit 1
}
