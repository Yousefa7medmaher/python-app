# Stage 1: build stage
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Stage 2: production stage
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app

RUN useradd -m appuser
USER appuser

EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]
