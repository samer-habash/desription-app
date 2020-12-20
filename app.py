import secrets
import time
from flask import Flask, render_template

# Configure app
app = Flask(__name__)
app.secret_key = secrets.token_urlsafe(32)
app.config[ 'WTF_CSRF_SECRET_KEY' ] = secrets.token_urlsafe(32)


@app.route("/", methods=[ 'GET', 'POST' ])
def index():
    return render_template('description.html', reload=time.time())


app.run(host="0.0.0.0")
