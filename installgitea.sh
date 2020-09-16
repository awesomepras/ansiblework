#!/bin/bash
echo installing gitea
yum -y install git sqlite wget net-tools vim 
sudo useradd --system --shell /bin/bash -m --home /home/git --comment 'Git Version Control' git
VERSION=1.12.4
sudo wget -b -O /tmp/gitea https://dl.gitea.io/gitea/${VERSION}/gitea-${VERSION}-linux-amd64
sudo mv /tmp/gitea /usr/local/bin
sudo chmod +x /usr/local/bin/gitea
sudo mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
sudo chown git: /var/lib/gitea/{data,indexers,log}
sudo chmod 750 /var/lib/gitea/{data,indexers,log}
sudo mkdir -p /etc/gitea
sudo chown git:root /etc/gitea
sudo chmod 770 /etc/gitea
sudo wget -b -O /tmp/gitea.service https://raw.githubusercontent.com/go-gitea/gitea/master/contrib/systemd/gitea.service 
sudo mv /tmp/gitea.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now gitea
sudo systemctl start gitea
sudo systemctl status gitea
GITEA_WORK_DIR=/var/lib/gitea/ sudo /usr/local/bin/gitea web -c /etc/gitea/app.ini >/dev/null 2>&1
