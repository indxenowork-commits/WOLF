# Dependency Version Reference

This file tracks important dependency versions to prevent version conflicts.

## Critical Dependencies

| Package | Version | Notes |
|---------|---------|-------|
| aiohttp | 3.13.1 | **UPDATED** - Was 3.8.4, updated to match pyproject.toml |
| discord.py | 2.3.0 | Discord bot framework |
| tortoise-orm | 0.19.3 | Database ORM |
| fastapi | 0.98.0 | Web API framework |
| python-socketio | 5.8.0 | WebSocket support |
| asyncpg | 0.27.0 | PostgreSQL async driver |
| numpy | 2.3.4 | **UPDATED** - Was 1.25.0 |
| scipy | 1.16.2 | **UPDATED** - Was 1.9.3 |
| bidict | 0.23.1 | **UPDATED** - Was 0.22.1 |
| line-profiler | 5.0.0 | **UPDATED** - Was 4.0.3 |
| pywavelets | 1.9.0 | **UPDATED** - Was 1.4.1 |
| import-expression | 2.2.1 | **UPDATED** - Was 1.1.4 |

## Keeping Dependencies in Sync

### Source of Truth
- `pyproject.toml` is the source of truth for all dependency versions
- `requirements.txt` is generated from `pyproject.toml` via Poetry

### To Update Dependencies

1. **Modify `pyproject.toml`** with the desired versions
2. **Run the update script:**
   ```bash
   ./update_requirements.sh
   ```
3. **Rebuild the Docker container:**
   ```bash
   ./rebuild.sh
   ```

### Manual Update (if update script fails)

```bash
pip install poetry==1.5.1
poetry lock --no-update
poetry export -f requirements.txt --output requirements.txt --without-hashes
./rebuild.sh
```

## Version Conflict Resolution

If you encounter "ModuleNotFoundError" or version conflicts:

1. Verify `requirements.txt` matches `pyproject.toml`
2. Run `./update_requirements.sh` to regenerate requirements
3. Rebuild Docker: `./rebuild.sh`
4. For direct Python: `./setup.sh`

## Last Updated
October 20, 2025 - Synchronized all versions between pyproject.toml and requirements.txt
