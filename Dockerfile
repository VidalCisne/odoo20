FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev libldap2-dev libsasl2-dev libxml2-dev \
    libxslt1-dev libjpeg-dev zlib1g-dev libfreetype6-dev libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]