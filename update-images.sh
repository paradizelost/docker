find /var/docker/config -name docker-compose.yml -exec docker-compose -f {} pull  \;
find /var/docker/config -name docker-compose.yml -exec docker-compose -f {} up -d --remove-orphans \;
