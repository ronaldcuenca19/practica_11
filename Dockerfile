FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3-dev default-libmysqlclient-dev build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir --upgrade pip

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8000

CMD ["python", "app.py"]
