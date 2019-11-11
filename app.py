import subprocess
from flask import Flask, render_template
import os
app = Flask(__name__)

noun_plural = 'Wij'
verb_plural = 'zijn'
verb_singular = 'is'

PORT = int(os.environ.get('PORT', 5000))


@app.route('/', defaults={'name': None})
@app.route('/<name>')
def hello(name):
    if name is None:
        verb = verb_plural
        noun = noun_plural
    else:
        verb = verb_singular
        noun = name

    param = "{} {} in hilversum.".format(noun, verb)
    result = subprocess.run(['/usr/games/cowsay', param], stdout=subprocess.PIPE)
    formatted_result = result.stdout.decode('utf-8')

    return render_template('template.html', cowsay_stdout=formatted_result)


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=PORT)