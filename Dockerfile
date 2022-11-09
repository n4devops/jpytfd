FROM python:3.8.0-slim
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY . ./
EXPOSE 9090
ENTRYPOINT ["python", "app.py"]
#CMD gunicorn -b 0.0.0.0:80 app.app:server
