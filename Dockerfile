FROM --platform=linux/arm64 python:3.12-slim as build

RUN apt-get update && apt-get install -y --no-install-recommends && rm -rf /var/lib/apt//lists/*

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install django djangorestframework

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
