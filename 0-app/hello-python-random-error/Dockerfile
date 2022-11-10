FROM python:3.7-alpine3.15

WORKDIR /hello-python-random-error

COPY "requirements.txt" .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY "app.py" .

CMD [ "python", "app.py" ]