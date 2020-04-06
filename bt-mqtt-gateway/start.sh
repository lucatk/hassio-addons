#!/usr/bin/env bashio

if ! [ -f '/config/bt-mqtt-gateway.yaml' ]; then
    echo "There is no config.yaml! An example is created."
    cp /application/config.yaml.example /config/bt-mqtt-gateway.yaml
    exit 1
fi

cd /application
if [ "$DEBUG" = 'true' ]; then
    echo "Start in debug mode"
    python3 ./gateway.py -d
    status=$?
    echo "Gateway died..."
    exit $status
else
    echo "Start in normal mode"
    python3 ./gateway.py
fi
