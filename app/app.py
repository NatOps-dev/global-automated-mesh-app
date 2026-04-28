from flask import Flask
import psycopg2
import os

app = Flask(__name__)

#These settings match the db-deployment.yaml file
DB_HOST ="postgres-db"
DB_NAME = "postgres"
DB_USER = "postgres"
DB_PASSWORD = "tek2kloud-sercret-pass"

@app.route('/')
def hello():
    try:
        # Connect to the PostgreSQL database
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )
        return "<h1>Project 2: Success!</h1><p>Connected to the PostgreSQL database successfully.</p>"
    except Exception as e:
        return f"<h1>Project 2: Failed!</h1><p>Failed to connect to the PostgreSQL database. Error: {str(e)}</p>"
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) # Listen on all interfaces and port 5000