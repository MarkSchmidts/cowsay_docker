from flask import Flask, render_template
from settings import COWSAY_BINARY_PATH
import subprocess
app = Flask(__name__)

noun_plural = 'Wij'
verb_plural = 'zijn'
verb_singular = 'is'


@app.route('/', defaults={'name': None})
@app.route('/<name>')
def hello(name):
    if name is None:
        verb = verb_plural
        noun = noun_plural
    else:
        verb = verb_singular
        noun = name

    param = "{} {} in Hilversum.".format(noun, verb)
    result = subprocess.run([COWSAY_BINARY_PATH, param], stdout=subprocess.PIPE)
    formatted_result = result.stdout.decode('utf-8')

    return render_template('template.html', cowsay_stdout=formatted_result)