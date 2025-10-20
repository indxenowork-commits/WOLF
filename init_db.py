#!/usr/bin/env python3
"""Initialize the database schema"""
import asyncio
import sys
import os

# Change to src directory so imports work
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

async def init_database():
    from tortoise import Tortoise
    import config
    
    print("🔌 Connecting to database...")
    await Tortoise.init(config.TORTOISE)
    
    print("🏗️  Generating database schema...")
    await Tortoise.generate_schemas(safe=True)
    
    print("✅ Database schema initialized successfully!")
    
    # Check for existing scrims
    from models.esports.scrims import Scrim
    scrims = await Scrim.all()
    
    if scrims:
        print(f"\n📊 Found {len(scrims)} existing scrim(s) in database:")
        for scrim in scrims:
            print(f"  - ID: {scrim.id}, Name: {scrim.name}, Guild: {scrim.guild_id}")
            print(f"    Registration Channel: {scrim.registration_channel_id}")
            print(f"    Slots: {scrim.total_slots}, Opened: {scrim.opened}")
    else:
        print("\n⚠️  No scrims found in database")
    
    await Tortoise.close_connections()

if __name__ == "__main__":
    asyncio.run(init_database())
