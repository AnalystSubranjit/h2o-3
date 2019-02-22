#! /bin/bash

set -x -e

if [ -z ${HIVE_VERSION} ]; then
    echo "HIVE_VERSION must be set"
    exit 1
fi

# Download and initialize HIVE
cd /home/hive
wget http://archive.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz
tar -xzf apache-hive-${HIVE_VERSION}-bin.tar.gz
rm apache-hive-${HIVE_VERSION}-bin.tar.gz
chown -R hive:hive apache-hive-*/
sudo -E -u hive ${HIVE_HOME}/bin/schematool -dbType derby -initSchema

ls $HIVE_HOME/lib | grep 'jdbc' | tr '\n' ':' > /opt/hive-jdbc-cp
