FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install -y \
        gcc \
        musl-dev \
        python3-dev \
        libffi-dev \
        build-essential \
        libgeos-dev \
        libproj-dev \
        libgdal-dev \
        libjpeg62-turbo-dev \
        zlib1g-dev \
        libtiff5-dev \
        libwebp-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y --auto-remove \
        gcc \
        musl-dev \
        python3-dev \
        libffi-dev \
        build-essential \
        libgeos-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8000
COPY mapproxy.yaml /app/mapproxy.yaml
COPY init.py /app/init.py
COPY log.ini /app/log.ini
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "init:application"]
