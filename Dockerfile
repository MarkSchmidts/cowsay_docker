FROM python:3.8.0

RUN apt-get update
RUN apt-get install cowsay -y

WORKDIR /var/www/app
COPY ./ /var/www/app

RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]

CMD [ "app.py", "hello:app"]
