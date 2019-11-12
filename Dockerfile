FROM python:3.8.0

# install system dependencies (and cleanup after apt)
ENV COWSAYPATH='/usr/games/cowsay'
RUN apt-get update && apt-get install cowsay -y  \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# prepare entrypoint
COPY docker-entrypoint.sh /
RUN chmod u+x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
# container defaults to serve webservice but can also run gunciron debug mode or bash
CMD [ "serve" ]

# prepare python
# PYTHONDONTWRITEBYTECODE prevent python from creating .pyc files
# PYTHONUNBUFFERED configure python not to buffer output to prevent possible loss of stdout logging
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH="/var/www/app"

# prepare app
WORKDIR $PYTHONPATH
# force image layer caching for pip install
COPY ./app/requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY ./app ./