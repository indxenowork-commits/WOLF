FROM python:3.11-buster as builder

RUN pip install --no-cache-dir poetry==1.5.1

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN touch README.md

RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --without dev --no-root

FROM python:3.11-slim-buster as runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH" \
    PYTHONUNBUFFERED=1

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

WORKDIR /app

# Install aiohttp explicitly to prevent errors
RUN pip install --no-cache-dir aiohttp==3.13.1 aiohttp-asgi==0.5.2

COPY src src

# Copy .git directory
COPY .git .git

# Verify dependencies are installed
RUN python -c "import aiohttp; print('✓ aiohttp:', aiohttp.__version__)" && \
    python -c "import discord, tortoise, fastapi; print('✓ All dependencies verified!')"

ENTRYPOINT ["python","src/bot.py"]
