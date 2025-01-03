# ansible-role-coredns
A role to configure CoreDNS

## Overview

This role helps to install and configure CoreDNS as a systemd service.

## Setup
- Create a playbook vars file with the following required variables:
```yaml
coredns_zones: [] # Takes a list of coreDNS zonefile data as follows

coredns_zones:
  name: "<zone name>"
    ttl: "1h"
    serial: "<9 digit serial number>"
    retry_interval: "<retry interval in seconds>"
    refresh_interval: "<refresh interval in seconds>"
    expiry: "<expiry in seconds>"
    minimum_ttl: "1h"
    contact: <dot separated name>
    plugin: # <additional plugins to add>
      - name: file
        args: "<path to the zone database where this config will be created>"
```

## Variables

|       Variable              |               Description                 |   Default Value   |   Required?     |
|-----------------------------|-------------------------------------------|-------------------|-----------------|
|     coredns_user            |   User to run systemd service             |   coredns         |     No          |
|     coredns_version         |   CoreDNS version to install              |   1.11.0          |     No          |
|  coredns_config_file_path   |   Path to store configuration             |   /etc/coredns/   |     No          |
| coredns_forward_dns_servers | A list of DNS servers to use as upstream  |   1.1.1.1,8.8.8.8 |     No          |
|   coredns_default_zone      | Default zone to create at start up (Used as forward) |  "."   |     No          |
|   coredns_common_plugins    | A list of common plugins to add to all zones    |   log,errors  |   No          |
| coredns_default_zone_plugins  | A list of global plugins to add to default zone | "forward plugin"  | No      |
| coredns_zones             |   A list of coredns zones to create. As described above.     |   N/A   |   Yes    |


## Example Playbook

```yaml
- hosts: localhost
  name: "Configure CoreDNS"
  become: true
  roles:
    - ansible-role-coredns
```
