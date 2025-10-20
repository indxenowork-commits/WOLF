#!/bin/bash

echo "Installing aiohttp and critical dependencies..."

pip install --no-cache-dir aiohttp==3.13.1
pip install --no-cache-dir aiohttp-asgi==0.5.2
pip install --no-cache-dir aiocache[msgpack]==0.12.1

echo "Verifying aiohttp installation..."
python3 -c "import aiohttp; print('✓ aiohttp version:', aiohttp.__version__)"

if [ $? -eq 0 ]; then
    echo "✓ aiohttp installed successfully!"
    exit 0
else
    echo "✗ Failed to install aiohttp"
    exit 1
fi
