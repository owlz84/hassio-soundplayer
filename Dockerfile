#ARG BUILD_FROM
FROM ghcr.io/home-assistant/armv7-base:3.15

ENV LANG C.UTF-8

WORKDIR /home

# install dependencies
RUN apk update && \
    apk add python3 py3-pip py3-setuptools \
    alsa-utils alsa-utils-doc alsa-lib alsaconf \
    alsa-plugins-pulse ffmpeg ffmpeg-dev
ADD requirements.txt ./
RUN pip3 install -r requirements.txt

# Copy data for add-on
RUN mkdir -p /home/media
COPY media/ ./media/
ADD app.py ./

CMD [ "gunicorn", "--bind", "0.0.0.0:8099", "app:app" ]
