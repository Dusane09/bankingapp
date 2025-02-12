FROM python:3.10

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

CMD [ "gunicorn", "--bind", "0.0.0.0:8000", "banking_system.wsgi:application" ]