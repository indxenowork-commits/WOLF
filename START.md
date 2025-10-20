# Wolf Bot - Quick Start Guide

## Running the Bot

### Option 1: Docker (Recommended for Production)

1. **First Time Setup / After Dependency Changes:**
   ```bash
   # Rebuild the Docker container to install all dependencies
   docker-compose build --no-cache
   ```

2. **Start the Bot:**
   ```bash
   docker-compose up -d
   ```

3. **View Logs:**
   ```bash
   docker-compose logs -f wolf-bot
   ```

4. **Stop the Bot:**
   ```bash
   docker-compose down
   ```

### Option 2: Direct Python (For Development)

1. **Install Dependencies:**
   ```bash
   # Run the setup script
   ./setup.sh
   ```
   
   OR manually:
   ```bash
   pip install poetry==1.5.1
   poetry install --no-root
   ```

2. **Run the Bot:**
   ```bash
   ./start_bot.sh
   ```
   
   Or manually:
   ```bash
   cd src && python bot.py
   ```

## Troubleshooting

### "ModuleNotFoundError: No module named 'aiohttp'" or similar errors

If you see module not found errors:

1. **For Docker (Recommended):** Rebuild the container
   ```bash
   ./rebuild.sh
   ```
   
   Or manually:
   ```bash
   docker-compose down
   docker-compose build --no-cache
   docker-compose up -d
   ```

2. **For Direct Python:** Reinstall dependencies
   ```bash
   ./setup.sh
   ```

### Updating Dependencies

If you've modified `pyproject.toml` and need to update `requirements.txt`:

```bash
./update_requirements.sh
./rebuild.sh
```

### Dependencies Not Installing

Make sure you have:
- Python 3.11 installed
- Poetry installed (the setup script installs this)
- Docker and Docker Compose installed (for Docker option)

### Version Conflicts

The project uses:
- `aiohttp==3.13.1` (Updated from 3.8.4)
- All dependencies are synced between `pyproject.toml` and `requirements.txt`
- If you encounter version conflicts, run `./update_requirements.sh` to regenerate `requirements.txt`

## Environment Variables

Make sure to set up your environment variables (like `DISCORD_TOKEN`) before running the bot.

## QA Testing Notes

- **Have QA validate premium flows and tourney tooling**
