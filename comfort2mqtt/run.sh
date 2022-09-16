#!/usr/bin/env bashio

# MQTT variables
declare host="127.0.0.1"
declare password=""
declare user=""
declare device=$(bashio::config 'device')
declare comfort_password=$(bashio::config 'comfort_password')

declare retained_inputs=""
if bashio::config.has_value "retained_inputs"; then
  retained_inputs=$(bashio::config 'retained_inputs')
fi

declare raw_msgs="0"
if bashio::config.has_value "raw_msgs"; then
  raw_msgs=$(bashio::config 'retained_inputs')
fi

if bashio::services.available "mqtt"; then
  host=$(bashio::services "mqtt" "host")
  user=$(bashio::services "mqtt" "username")
  password=$(bashio::services "mqtt" "password")
fi

export COMFORT2MQTT_MQTT_HOST=${host}
export COMFORT2MQTT_MQTT_USER=${user}
export COMFORT2MQTT_MQTT_PASSWORD=${password}
export COMFORT2MQTT_DEVICE=${device}
export COMFORT2MQTT_COMFORT_PASSWORD=${comfort_password}
export COMFORT2MQTT_RETAINED_INPUTS=${retained_inputs}
export COMFORT2MQTT_RAW_MSGS_ALLOWED=${raw_msgs}

bashio::log.info "Starting comfort2mqtt server..."
exec ./comfort2mqtt/comfort2mqtt
