#!/usr/bin/env python

from flask import Flask
from flask import request
from flask import jsonify

from leftpad import left_pad

app = Flask(__name__)

@app.route("/")
def index():
    str = request.args.get("str") or ""
    ch  = request.args.get("ch")  or " "
    len = request.args.get("len") or 0

    return jsonify(str=left_pad(str, ch, len))

if __name__ == "__main__":
    app.run(port=3000, debug=True)

