import os

PORT = int(os.environ.get('PORT', 5000))
COWSAY_BINARY_PATH = os.environ.get('COWSAYPATH', '/usr/games/cowsay')