FROM python:3.10-alpine

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir flask pytest
 && adduser -D appuser

USER appuser

EXPOSE 80
CMD ["python", "app.py"]
