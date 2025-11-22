FROM python:3.11-slim

WORKDIR /app

# copy requirements before installing
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# copy app source and model artifacts
COPY src/api/ .
COPY models/trained/ models/trained/

EXPOSE 9000

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000" ]


