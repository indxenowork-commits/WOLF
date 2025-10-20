# ⚡ Quick Deploy to Fly.io (5 Minutes)

The fastest way to get your Wolf bot online 24/7 for FREE.

## 🏃 Super Fast Steps

### 1️⃣ Install Flyctl (One-time)

**Mac/Linux:**
```bash
curl -L https://fly.io/install.sh | sh
```

**Windows:**
```powershell
iwr https://fly.io/install.ps1 -useb | iex
```

### 2️⃣ Login
```bash
flyctl auth login
```

### 3️⃣ Get Your Code

**Download from Replit:**
- Click ⋮ menu → Download as ZIP
- Extract to a folder
- Open terminal in that folder

### 4️⃣ Launch App
```bash
flyctl launch
```

**Answer:**
- App name: (press Enter for random name)
- Region: (choose closest)
- PostgreSQL: **YES** → Development
- Deploy now: **NO**

### 5️⃣ Set Your Discord Token
```bash
flyctl secrets set DISCORD_TOKEN="paste_your_token_here"
```

**Get your token:** https://discord.com/developers/applications

### 6️⃣ Set Database URL

Fly.io will show you the Postgres connection string. Set it:
```bash
flyctl secrets set DATABASE_URL="postgres://username:password@host/database"
```

### 7️⃣ Deploy!
```bash
flyctl deploy
```

### 8️⃣ Check Logs
```bash
flyctl logs
```

You should see: `[Wolf] Logged in as WOLF(...)`

---

## ✅ Done!

Your bot is now **LIVE 24/7 FOR FREE**! 🎉

---

## 🔄 Update Your Bot Later

```bash
# Make code changes in Replit
# Download new ZIP
# Extract and open terminal
flyctl deploy
```

---

## 📋 Useful Commands

```bash
flyctl status        # Check if running
flyctl logs          # View logs
flyctl apps restart  # Restart bot
flyctl dashboard     # Open web dashboard
```

---

**Need detailed help?** See `DEPLOY_TO_FLYIO.md`
