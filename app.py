from flask import Flask
import redis
import os

app = Flask(__name__)
redis_host = os.environ.get("REDIS_HOST", "localhost")
r = redis.Redis(host=redis_host, port=6379)

@app.route('/')
def hello():
    count = r.incr('hits')
    return f'Hello from Docker! This page has been viewed {count} times.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)