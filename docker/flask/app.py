#!/usr/bin/env python3

from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return '<h1>Hello World!</h1>'

@app.route('/hello')
def hello():
    return '<h1>Hello!</h1>'

@app.route('/user/<name>')
def user(name):
    return '<h1>Hello, %s!</h1>' % name

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port = 5000)    
