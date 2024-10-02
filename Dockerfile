FROM python:3.11-slim
WORKDIR /tttm-randy

COPY tttm-randy.py /tttm-randy
COPY requirements.txt /tttm-randy

RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "tttm-randy:app", "-b", "0.0.0.0:5000", "-w", "4"]
