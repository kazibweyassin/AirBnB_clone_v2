#!/usr/bin/python3

"""
    Hello route
"""

from . import app


@app.route('/')
def hello():
    """ Hello world"""
    return "Hello HBNB!"


if __name__ == "__main__":
    app.run(debug=True)
