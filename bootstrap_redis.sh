#!/usr/bin/env bash

cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo cp redis-server /usr/local/bin/
sudo cp redis-cli /usr/local/bin/
sudo mkdir /etc/redis
sudo mkdir /var/redis
sudo cp utils/redis_init_script /etc/init.d/redis
sudo cp redis.conf /etc/redis/redis.conf
sudo update-rc.d redis defaults
/etc/init.d/redis start

redis-server --version