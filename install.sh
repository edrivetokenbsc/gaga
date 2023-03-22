curl -o gaganode-linux-amd64.tar.gz https://assets.coreservice.io/public/sdk/gaganode/1.0.4/gaganode-linux-amd64.tar.gz && tar -zxf gaganode-linux-amd64.tar.gz && rm -f gaganode-linux-amd64.tar.gz && cd gaganode-linux-amd64 && rm -rf ./root_conf/default.toml && cd root_conf && wget https://raw.githubusercontent.com/taikhoanxzc004/gaga/main/default.toml

cat > /etc/systemd/system/gaganode.service <<EOL
[Unit]
Description=Example .NET Web API App running on Ubuntu

[Service]
WorkingDirectory=/root/gaganode-linux-amd64
ExecStart=/root/gaganode-linux-amd64/gaganode
Restart=always
RestartSec=10
KillSignal=SIGINT
User=root

[Install]
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload && sudo systemctl enable gaganode.service && sudo systemctl start gaganode.service
