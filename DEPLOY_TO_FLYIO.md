# 🚀 Deploy Wolf Bot to Fly.io (Free 24/7 Hosting)

This guide will help you deploy your Discord bot to **Fly.io** for **free 24/7 hosting**.

## ✅ What You'll Get
- 🟢 **Free hosting** - No credit card required for basic tier
- 🌐 **Always online** - 24/7 uptime, no sleep mode
- 📊 **PostgreSQL database** - Included in Fly.io
- 🔒 **Secure secrets** - Environment variables managed safely

---

## 📋 Prerequisites

1. **Fly.io account** - Sign up at https://fly.io/app/sign-up
2. **Flyctl CLI** - Install the Fly.io command-line tool
3. **Your code on GitHub** (or local folder)

---

## 🛠️ Step 1: Install Flyctl

### On Mac/Linux:
```bash
curl -L https://fly.io/install.sh | sh
```

### On Windows:
```powershell
iwr https://fly.io/install.ps1 -useb | iex
```

After installation, verify:
```bash
flyctl version
```

---

## 🔑 Step 2: Login to Fly.io

```bash
flyctl auth login
```

This will open your browser to authenticate.

---

## 📦 Step 3: Prepare Your Project

### Option A: Clone from Replit

1. Download your Replit project as a ZIP
2. Extract it to a folder on your computer
3. Open terminal in that folder

### Option B: Use GitHub

1. Push your code to GitHub
2. Clone it to your computer:
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

---

## 🚀 Step 4: Create Fly.io App

In your project folder, run:

```bash
flyctl launch
```

**Answer the prompts:**
- App name: `wolf-discord-bot` (or choose your own)
- Region: Choose closest to you (e.g., `iad` for US East)
- PostgreSQL database: **YES** (select "Development" for free tier)
- Deploy now: **NO** (we need to set secrets first)

---

## 🔐 Step 5: Set Environment Variables (Secrets)

Set your Discord bot token and database URL:

```bash
# Discord Bot Token (REQUIRED)
flyctl secrets set DISCORD_TOKEN="YOUR_DISCORD_BOT_TOKEN_HERE"

# Get your PostgreSQL connection string from Fly.io
flyctl postgres connect -a YOUR_POSTGRES_APP_NAME

# Once connected, exit with \q, then set DATABASE_URL:
flyctl secrets set DATABASE_URL="postgres://postgres:PASSWORD@HOST/DATABASE"
```

**Replace:**
- `YOUR_DISCORD_BOT_TOKEN_HERE` with your actual Discord token
- Connection details will be shown after creating the Postgres database

### Optional Secrets (if you use them):
```bash
flyctl secrets set SERVER_LINK="https://discord.gg/your-server"
flyctl secrets set ERROR_LOG="your_webhook_url"
flyctl secrets set SHARD_LOG="your_webhook_url"
flyctl secrets set PUBLIC_LOG="your_webhook_url"
```

---

## 🎯 Step 6: Deploy!

Now deploy your bot:

```bash
flyctl deploy
```

Wait for the deployment to complete (2-5 minutes).

---

## ✅ Step 7: Verify Deployment

Check if your bot is running:

```bash
flyctl status
```

View logs:

```bash
flyctl logs
```

You should see:
```
[Wolf] Logged in as WOLF(...)
```

---

## 🔧 Managing Your Deployment

### View logs in real-time:
```bash
flyctl logs -f
```

### Restart your bot:
```bash
flyctl apps restart
```

### Scale resources (if needed):
```bash
flyctl scale vm shared-cpu-1x --memory 512
```

### Check secrets:
```bash
flyctl secrets list
```

### Update secrets:
```bash
flyctl secrets set DISCORD_TOKEN="new_token"
```

---

## 💾 Database Setup

Your PostgreSQL database is automatically created. To access it:

```bash
# Connect to database
flyctl postgres connect -a your-postgres-app-name

# Run SQL commands
\dt  # List tables
\q   # Quit
```

The bot will automatically create all necessary tables on first run.

---

## 🆓 Free Tier Limits

Fly.io free tier includes:
- ✅ Up to 3 shared-cpu-1x VMs
- ✅ 256MB RAM per VM
- ✅ 3GB persistent volume storage
- ✅ 160GB outbound data transfer

**This is MORE than enough for a Discord bot!**

---

## 🐛 Troubleshooting

### Bot not connecting?
```bash
flyctl logs
```
Check for errors in the logs.

### Database connection issues?
```bash
flyctl secrets list
```
Verify `DATABASE_URL` is set correctly.

### Out of memory?
```bash
flyctl scale vm shared-cpu-1x --memory 512
```

### Need to redeploy?
```bash
flyctl deploy --force
```

---

## 📱 Quick Reference Commands

```bash
# Deploy
flyctl deploy

# View status
flyctl status

# View logs
flyctl logs

# Restart app
flyctl apps restart

# SSH into container
flyctl ssh console

# Check secrets
flyctl secrets list

# Set secret
flyctl secrets set KEY=value

# Open dashboard
flyctl dashboard
```

---

## 🎉 Success!

Your Wolf Discord Bot is now running 24/7 on Fly.io for FREE!

**Next steps:**
1. Invite the bot to your Discord server
2. Create scrims using `w setup scrim`
3. Enjoy your always-online bot!

---

## 📞 Need Help?

- **Fly.io Docs**: https://fly.io/docs
- **Discord.py Docs**: https://discordpy.readthedocs.io
- **Check logs**: `flyctl logs`

Happy hosting! 🎉
