FROM python:3.12-slim-bullseye

RUN apt-get update && apt-get install -y \
    git \
    build-essential

#RUN useradd -m worker
RUN mkdir /usr/src/app 

#&& chown worker:worker /usr/src/app

#USER worker
WORKDIR /usr/src/app

RUN pip install --upgrade pip six RPI.GPIO certifi smbus charset_normalizer idna urllib3

ADD SIP/. /usr/src/app

EXPOSE 80
EXPOSE 443

CMD ["python3", "sip.py"]
