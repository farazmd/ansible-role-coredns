[Unit]
Description=CoreDNS server
Documentation=https://coredns.io
After=network.target

[Service]
PermissionsStartOnly=true
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true
User={{ coredns_user }}
WorkingDirectory={{ coredns_config_file_path }}
ExecStart=/usr/local/bin/coredns -conf={{ coredns_config_file_path }}/Corefile
ExecReload=/bin/kill -SIGUSR1 $MAINPID
SyslogIdentifier=coredns
Restart=on-failure

[Install]
WantedBy=multi-user.target