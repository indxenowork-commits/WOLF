#!/bin/bash

echo "🔧 Rebuilding Wolf Bot Docker Container..."
echo ""

echo "📦 Stopping existing containers..."
docker-compose down

echo ""
echo "🏗️  Building fresh container (this may take a few minutes)..."
docker-compose build --no-cache

echo ""
echo "✅ Build complete!"
echo ""
echo "To start the bot, run: docker-compose up -d"
echo "To view logs, run: docker-compose logs -f wolf-bot"
