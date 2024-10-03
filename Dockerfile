FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --upgrade setuptools wheel \
    && pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

RUN rm requirements.txt

FROM builder

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /app/* .

CMD ["python", "main.py"]