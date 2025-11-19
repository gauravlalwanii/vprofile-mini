#!/bin/bash
set -e

apt-get update -y
apt-get install -y git curl

curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

cd /home/ubuntu || cd /root

git clone https://github.com/gauravlalwanii/vprofile-mini.git app || {
  cd app
  git pull
}

cd app/app || cd app

npm install --no-audit --no-fund
nohup npm start > app.log 2>&1 &

