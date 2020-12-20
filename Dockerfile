FROM python:3.6-slim-buster
WORKDIR /app
COPY requirements.txt ./
RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

ADD  description-app.tar ./
EXPOSE 5000

CMD ["python", "app.py"]