FROM python:3.8.5-slim-buster

WORKDIR /code

RUN apt update -y && apt install -y libpq-dev \
                                 gcc \
                                 wget \
                                 curl

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000