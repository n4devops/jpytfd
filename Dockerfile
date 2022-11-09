FROM python:3.8.0-slim
RUN pip install -r requirements.txt
COPY . ./
EXPOSE 9090
CMD gunicorn -b 0.0.0.0:80 app.app:server
