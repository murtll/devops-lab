FROM python:3.8.5

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT [ "gunicorn", "api_yamdb.wsgi:application" ]

CMD [ "--bind", "0.0.0.0:8000" ]