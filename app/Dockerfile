FROM python:3.9-slim
RUN apt-get update && appt-get install -y libpq-dev gcc
WORKDIR /app
COPY . . 
RUN pip install flask psycopg2-binary
CMD ["python", "app.py"]
