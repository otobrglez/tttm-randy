FROM python:3.11-slim

LABEL "maintainer"="Oto Brglez <otobrglez@gmail.com>"
LABEL "org.opencontainers.image.url"="https://github.com/otobrglez/tttm-randy"
LABEL "org.opencontainers.image.source"="https://github.com/otobrglez/tttm-randy"
LABEL description="This is a sample tic-tac-toe player server for tttm challenge"

WORKDIR /tttm-randy

COPY tttm-randy.py /tttm-randy
COPY requirements.txt /tttm-randy

RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "tttm-randy:app", "-b", "0.0.0.0:5000", "-w", "4"]
