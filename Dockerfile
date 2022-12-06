FROM python:3.8.5-slim-buster

WORKDIR /code
RUN adduser app

RUN apt update -y && apt install -y libpq-dev \
                                 gcc

USER app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT [ "gunicorn", "api_yamdb.wsgi:application" ]
CMD [ "--bind", "0.0.0.0:8000" ]