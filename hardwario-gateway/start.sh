#!/bin/bash
# https://forum.hardwario.com/t/docker-on-rpi-node-red-big-clown/594

# some sane default values for configuration variables 
# not using localhost as we know for sure there is no MQTT broker there
MQTT_HOST=${MQTT_HOST:-mosquitto}
MQTT_PORT=${MQTT_PORT:-1883}
MQTT_USERNAME=${MQTT_USERNAME:-mosquitto}
DEVICE=${DEVICE:-/dev/ttyUSB0}

if [ -z "${DEVICE}" ]
then
    echo "No Hardwario dongle found!"
    exit 1
fi

echo "MQTT_HOST: $MQTT_HOST"
echo "MQTT_PORT: $MQTT_PORT"
echo "MQTT_USERNAME: $MQTT_USERNAME"
echo "MQTT_PASSWORD: $MQTT_PASSWORD"
echo "DEVICE: $DEVICE"

exec bcg --device "${DEVICE}" --mqtt-host "$MQTT_HOST" --mqtt-port "$MQTT_PORT" --mqtt-username "$MQTT_USERNAME" --mqtt-password "$MQTT_PASSWORD" $PARAMS
