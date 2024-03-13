FROM python:3.9-buster

WORKDIR /

COPY requirements.txt requirements.txt 
COPY server.sh server.sh

ENV GOOGLE_APPLICATION_CREDENTIALS='./secrets/credentials'
ENV MLFLOW_ARTIFACT_UPLOAD_DOWNLOAD_TIMEOUT=-1
ENV MLFLOW_GCS_UPLOAD_CHUNK_SIZE=33554432 
ENV MLFLOW_HTTP_REQUEST_TIMEOUT=3600
RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

RUN chmod +x server.sh

ENTRYPOINT ["./server.sh"]