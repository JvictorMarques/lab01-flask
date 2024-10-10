FROM python:3.11-slim AS builder

WORKDIR /app

RUN apt update && apt install -y ca-certificates tzdata curl && update-ca-certificates

RUN apt update \
    && apt install -y gnupg curl \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt update \
    && ACCEPT_EULA=Y apt install -y msodbcsql17 unixodbc unixodbc-dev

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

ENV TZ=America/Sao_Paulo

# RUN flask db upgrade
# Teste

CMD ["python", "main.py"]