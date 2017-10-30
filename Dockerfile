FROM python:2

RUN pip install paho-mqtt broadlink

WORKDIR /app
RUN wget https://github.com/eschava/broadlink-mqtt/archive/master.tar.gz \
  && tar -zxvf master.tar.gz \
  && mv broadlink-mqtt-master/* ./ \
  && rm -rf master.tar.gz broadlink-mqtt-master

ENV MQTT_SERVER=localhost
ENV MQTT_PORT=1883
ENV MQTT_USER=mqtt_user
ENV MQTT_PASS=password
ENV MQTT_TOPIC_PREFIX=broadlink/
ENV DEVICE_HOST=192.168.1.50
ENV DEVICE_MAC=01:23:45:67:ab:00

COPY mqtt.conf.template /app
COPY start.sh /app

CMD ["./start.sh"]