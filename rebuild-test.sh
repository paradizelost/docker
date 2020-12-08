#!/bin/bash
cd /var/docker/config
rm -f dockerbackup.tar
find . -name "*.jar" -exec tar -rvf dockerbackup.tar {} \;
find . -name "*.properties" -exec tar -rvf dockerbackup.tar {} \;
find . -name "*.pem" -exec tar -rvf dockerbackup.tar {} \;
find . -name "*.cfg" -exec tar -rvf dockerbackup.tar {} \;
find . -name "*.json" -exec tar -rvf dockerbackup.tar {} \;
find . -name "passwd" -exec tar -rvf dockerbackup.tar {} \;
find . -name "shadow" -exec tar -rvf dockerbackup.tar {} \;
find . -name docker-compose.yml -exec tar -rvf dockerbackup.tar {} \;
scp dockerbackup.tar root@10.0.2.41:/var/docker/
ssh root@10.0.2.41 rebuild-env.sh
