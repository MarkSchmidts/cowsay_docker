#!/bin/bash
set -e

if [ "$1" = 'serve' ]; then
  /usr/local/bin/gunicorn -b 0.0.0.0:$PORT --timeout=90 wsgi:app
elif [ "$1" = 'debug' ]; then
  /usr/local/bin/gunicorn -b 0.0.0.0:$PORT --reload wsgi:app
else
  exec "$@"
fi