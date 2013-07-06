#!/usr/bin/env bash

cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make install
sudo mkdir /etc/redis
sudo mkdir /var/redis
sudo cp utils/redis_init_script /etc/init.d/redis
sudo sed -i 's/redis_${REDISPORT}.pid/redis.pid/g' /etc/init.d/redis
sudo sed -i 's/${REDISPORT}.conf/redis.conf/g' /etc/init.d/redis

sudo cp redis.conf /etc/redis/redis.conf
sudo sed -i 's/daemonize no/daemonize yes/g' /etc/redis/redis.conf
sudo update-rc.d redis defaults
sudo /etc/init.d/redis start

redis-server --version
