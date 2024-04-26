#!/bin/bash 

mlflow db upgrade $POSTGRESQL_URL
mlflow server \
  --host 0.0.0.0 \
  --port 8080 \
  --backend-store-uri $POSTGRESQL_URL \
  --artifacts-destination $STORAGE_URL \
  --gunicorn-opts "--log-level debug --timeout 8000 --graceful-timeout 75 --keep-alive 3600" \
  --serve-artifacts