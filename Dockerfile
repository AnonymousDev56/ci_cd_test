# ---------- test stage ----------
FROM python:3.10-alpine AS test

WORKDIR /app

# 1. Сначала зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. Потом код
COPY . .

CMD ["pytest"]

# ---------- runtime stage ----------
FROM python:3.10-alpine

WORKDIR /app

# 1. Сначала зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && adduser -D appuser

# 2. Потом код
COPY . .

USER appuser

EXPOSE 80
CMD ["python", "app.py"]
