ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# install dependencies
RUN apk update && \
    apk add python3 py3-pip py3-setuptools \
    alsa-utils alsa-utils-doc alsa-lib alsaconf \
    alsa-plugins-pulse ffmpeg ffmpeg-dev
COPY requirements.txt /
RUN pip3 install -r requirements.txt

# Copy data for add-on
COPY media/ /media/
COPY app.py /

CMD [ "gunicorn", "--bind", "0.0.0.0:8099", "app:app" ]