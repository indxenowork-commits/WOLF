# ---- Build stage ----
FROM python:3.11-bookworm AS builder

# Install Poetry
RUN pip install --no-cache-dir poetry==1.5.1

WORKDIR /app
COPY pyproject.toml poetry.lock ./

# Install dependencies (without dev)
RUN poetry install --no-root --no-dev

# Copy source and build
COPY . .
RUN poetry build

# ---- Runtime stage ----
FROM python:3.11-slim-bookworm AS runtime

# Install git and other lightweight tools if needed
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /app/dist /app

# Default command
CMD ["python", "main.py"]
