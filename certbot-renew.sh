#!/bin/bash
# docker-compose -f /var/docker/config/haproxy/docker-compose.yml down
#/usr/bin/certbot certonly --force-renewal --standalone -d rs.hamik.net
#/usr/bin/certbot renew
/usr/local/bin/certbot certonly -d *.hamik.net --dns-route53  -m dan@paradizelost.net --agree-tos --non-interactive --server https://acme-v02.api.letsencrypt.org/directory --force-renewal
bash -c 'cat /etc/letsencrypt/live/hamik.net/fullchain.pem /etc/letsencrypt/live/hamik.net/privkey.pem > /var/docker/config/haproxy/data/ssl/hamik.net.pem'
export HOSTNAME=$HOSTNAME
docker kill -s HUP haproxy
#docker-compose -f /var/docker/config/haproxy/docker-compose.yml up -d
#docker-compose -f /var/docker/config/thelounge/docker-compose.yml up -d
#docker-compose -f /var/docker/config/guacamole/docker-compose.yml up -d

