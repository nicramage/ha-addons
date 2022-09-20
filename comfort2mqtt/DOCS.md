# Comfort-to-Mqtt - A Comfort alarm panel / MQTT bridge

This add-on makes the [comfort2mqtt service][comfort2mqtt] available within a Home Assistant
installation.

## Installation

The installation of this add-on is pretty straightforward and not different in comparison to
installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Set at least the serial device and Comfort password in the connfiguration section.
1. Start the "comfort2mqtt" add-on.
1. Check the logs of the "Comfort-to-Mqtt" add-on to see it in action.

## Configuration
### Option: `Serial device/port` ![required]
Use this option to select the serial port or device that is connected to your Comfort system.

### Option: `Comfort password` ![required]
Set the Comfort login password to use when connecting to your Comfort system.  It is recommended that you
create a user in your Comfort system specifically for this purpose.

### Option: `Retained Inputs` ![optional]
This option allows you to specify which of the Comfort inputs you would like to publish as MQTT 'retained'
messages.  This is useful on inputs that represent a door or window.  If the published state is not retained
and the add-on is restarted, then these inputs may have an "unknown" state until the door or window is opened
or closed.

### Option: `MQTT Host` ![optional]
This setting is not required if you are using the Mosquitto MQTT add-on server that comes with Home Assistant.
If you're using a standalone server, then this option specifies the host address for the MQTT server.

### Option: `MQTT User` ![optional]
This setting is not required if you are using the Mosquitto MQTT add-on server that comes with Home Assistant.
If you're using a standalone server, then this option specifies the user name with which to connect to
the MQTT server.

### Option: `MQTT Password` ![optional]
This setting is not required if you are using the Mosquitto MQTT add-on server that comes with Home Assistant.
If you're using a standalone server, then this option specifies the password with which to connect to
the MQTT server.

### Option: `Raw messages` ![optional]
This option is for debugging and testing only and show not be used in production, as it allows arbitrary
command execution on your Comfort system.  When enabled, unknown MQTT 'comfort/set' messages are passed
directly to your Comfort system.  This is useful for trying new stuff - especially when adding new features
to the [comfort2mqtt][comfort2mqtt] project.


[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=4fca9aae_comfort2mqtt&repository_url=https%3A%2F%2Fgithub.com%2Fnicramage%2Fha-addons
[comfort2mqtt]: https://github.com/nicramage/comfort2mqtt/
[required]: https://img.shields.io/badge/required-yes-blue.svg
[optional]: https://img.shields.io/badge/required-no-blue.svg
