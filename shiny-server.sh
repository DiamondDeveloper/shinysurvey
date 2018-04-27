#!/bin/sh

# Make sure the directory for individual app logs exists
mkdir -p /var/log/shiny-server

sed -i -e "s/\$PORT/$PORT/g" /etc/shiny-server/shiny-server.conf

USER=`whoami`

mkhomedir_helper $USER
sed -i -e "s/\$USER/$USER/g" /etc/shiny-server/shiny-server.conf

exec shiny-server 2>&1
