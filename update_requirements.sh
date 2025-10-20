#!/bin/bash

echo "📦 Updating requirements.txt from poetry.lock..."

# Install poetry if not already installed
if ! command -v poetry &> /dev/null; then
    echo "Installing Poetry..."
    pip install poetry==1.5.1
fi

# Export requirements from poetry
echo "Exporting requirements from poetry..."
poetry export -f requirements.txt --output requirements.txt --without-hashes

echo "✅ requirements.txt has been updated!"
echo ""
echo "Next steps:"
echo "1. Review requirements.txt to ensure all dependencies are correct"
echo "2. Rebuild Docker container: ./rebuild.sh"
