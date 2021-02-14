ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# install dependencies
COPY requirements.txt /
RUN pip3 install -r requirements.txt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]