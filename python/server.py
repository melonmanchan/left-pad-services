#!/usr/bin/env python

from flask import Flask
from flask import request
from flask import jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify(str="hallo")

if __name__ == "__main__":
    app.run(port=3000)

