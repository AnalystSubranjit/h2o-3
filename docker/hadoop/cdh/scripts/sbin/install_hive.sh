#! /bin/bash

set -x -e

apt-get install -y hive hive-server2
sudo -E -u hive /usr/lib/hive/bin/schematool -dbType derby -initSchema

ls /usr/lib/hive/lib | grep 'jdbc-standalone' | tr '\n' ':' > /opt/hive-jdbc-cp
