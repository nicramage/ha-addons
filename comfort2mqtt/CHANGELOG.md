# Changelog

## [0.1.12] - 2023-09-28

- Added a change log
- Do not publish the Comfort login password to the log
  (Upstream change to [comfort2mqtt service][comfort2mqtt]).

## [0.1.11] - 2023-09-28

- Start the addon later to give the MQTT broker addon a chance to start up
- Updated documentation to inform the user about the ACLs required for the
  'addon's user.

## [0.1.10] - 2023-09-27

- Fixed retrieval of 'raw_msgs' configuration setting.
- Actually use the MQTT configuration options, if specified.

[comfort2mqtt]: https://github.com/nicramage/comfort2mqtt/
