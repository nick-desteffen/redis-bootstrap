#!/usr/bin/env bash

apt-get -y -m install build-essential

cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable

make
make install

mkdir /etc/redis
mkdir /var/redis

cp utils/redis_init_script /etc/init.d/redis
sed -i 's/redis_${REDISPORT}.pid/redis.pid/g' /etc/init.d/redis
sed -i 's/${REDISPORT}.conf/redis.conf/g' /etc/init.d/redis

cp redis.conf /etc/redis/redis.conf
sed -i 's/daemonize no/daemonize yes/g' /etc/redis/redis.conf

update-rc.d redis defaults
/etc/init.d/redis start

redis-server --version
