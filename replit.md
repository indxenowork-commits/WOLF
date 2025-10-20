# Wolf Discord Bot

## Overview
Wolf is an open-source Discord bot designed for comprehensive esports server management. It automates scrims, facilitates tournament management, and provides various community engagement tools. The project aims to offer a robust solution for esports communities on Discord, enhancing organization and interaction.

## User Preferences
I prefer clear, concise explanations and direct answers. When proposing changes, please outline the impact and ask for confirmation before proceeding. I value iterative development and prefer to review changes in smaller, manageable chunks. Do not make changes to the `data/` or `tests/` folders.

## System Architecture

### Technology Stack
- **Language:** Python 3.11
- **Discord Framework:** discord.py 2.3.0
- **Database:** PostgreSQL (Replit's built-in)
- **ORM:** Tortoise ORM 0.19.3
- **Migrations:** Aerich 0.7.1
- **Web Framework:** FastAPI 0.98.0 (for payment/API endpoints)
- **WebSockets:** python-socketio 5.8.0

### Project Structure
The project is organized into a `src/` directory containing the core bot logic, cogs for modular features, database models, and server-side components. `data/` holds static assets.

```
src/
├── bot.py              # Main entry point
├── config.py           # Configuration
├── constants.py        # Bot constants and utilities
├── cogs/              # Discord bot command modules (esports, events, mod, premium, misc, reminder, utility)
├── core/              # Core bot classes (Bot, Context, Help)
├── models/            # Database models (Tortoise ORM)
├── server/            # FastAPI server for payments
├── sockets/           # SocketIO server for dashboard
└── utils/             # Utility functions
```

### UI/UX Decisions
- **Branding:** Consistent "Wolf" branding across all user-facing elements, including prefixes (`w`), premium tiers (Wolf Premium, Wolf Pro), and audit logs.
- **Emoji Usage:** Utilizes custom emojis for status indicators (e.g., `<:aadat_toxic:1426620476817408071>` for rejected registrations).
- **Interactive Elements:** Extensive use of Discord UI components (buttons, modals, select menus) for features like slot claiming, team management, and image generation.
- **Image Generation:** Professional image generation for points tables and slot lists using PIL, custom backgrounds, team logos, and watermarks. Options for "Scrims" or "Tournament" headings and channel selection for posting.
- **Bot Status:** Dynamic bot status (`whelp w setup`).

### Technical Implementations & Feature Specifications
- **Automated Scrims & Tournaments:** Core functionality for managing esports events, including registration, slot claiming, IDP transfer, and points tracking.
- **Premium Features:** Access control based on premium user or guild status, enabling advanced features like multiple easy tag channels, custom emojis, and webhook publishing.
- **Database Management:** Tortoise ORM with Aerich for schema generation and migrations. Models cover guild settings, scrims/tournaments, user data, and various bot configurations.
- **Error Handling & Logging:** Webhook-based logging for errors, shards, and public events.
- **Configurability:** `config.py` uses environment variables for sensitive data and dynamic settings. Guild-specific customization for prefix, color, and footer for premium guilds.
- **Integrated Team Logo Upload:** Streamlined process for users to upload team logos directly during team creation, supporting PNG, JPG, GIF, and URL inputs.
- **Image Generation Enhancements:** Points table generation with random backgrounds, team logos, kills, placement points, and custom headers/footers. "Send Image" feature allows selecting a channel for posting generated images.
- **Slotlist Display:** Reverted to a reliable embed-based slotlist display.

## External Dependencies

- **Discord API:** Accessed via `discord.py` for all bot interactions.
- **PostgreSQL Database:** Used for persistent storage, integrated via Replit's built-in database service.
- **FastAPI:** Powers web-based payment and API endpoints.
- **python-socketio:** Used for WebSocket communication, likely for a dashboard.
- **Pillow (PIL):** For image generation and manipulation, particularly for points tables and slot lists.
- **Aerich:** Database migration tool for Tortoise ORM.
- **jishaku:** A debugging and development tool for Discord bots.
- **Webhook Services:** Utilized for error, shard, and public event logging.

## QA Testing Notes

- **Have QA validate premium flows and tourney tooling**

## Running the Bot

### Development Environment (Replit)
To run directly in Replit:

1. **Run the bot:**
   ```bash
   cd src && python bot.py
   ```

The bot will automatically connect to the Replit PostgreSQL database.

### Docker Environment (Production)
To run the bot in Docker and avoid dependency issues:

1. **First time or after dependency changes:**
   ```bash
   ./rebuild.sh
   ```
   This rebuilds the Docker container with all dependencies.

2. **Start the bot:**
   ```bash
   docker-compose up -d
   ```

3. **View logs:**
   ```bash
   docker-compose logs -f wolf-bot
   ```

## 🚀 Deploying to Fly.io (Free 24/7 Hosting)

For **always-online FREE hosting**, deploy to Fly.io:

**Quick Start:**
1. See `QUICK_DEPLOY.md` for 5-minute setup
2. See `DEPLOY_TO_FLYIO.md` for detailed guide

**Benefits:**
- ✅ Free 24/7 hosting
- ✅ No sleep/idle timeouts
- ✅ PostgreSQL database included
- ✅ Easy deployment with Flyctl CLI

### Troubleshooting "ModuleNotFoundError"
If you encounter missing module errors:

1. **Rebuild Docker container:**
   ```bash
   ./rebuild.sh
   ```

2. **If dependencies were updated:**
   ```bash
   ./update_requirements.sh
   ./rebuild.sh
   ```

**Important:** The `requirements.txt` file has been updated to match `pyproject.toml` versions:
- `aiohttp` updated to 3.13.1 (was 3.8.4)
- All dependencies are now synchronized

See `START.md` for more detailed instructions.