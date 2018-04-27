#!/bin/sh

# Make sure the directory for individual app logs exists

export R_PORT=`expr $PORT + 1`

sed -i -e "s/\$PORT/$PORT/g" /app/shiny-server.conf
sed -i -e "s/\$R_PORT/$R_PORT/g" /app/shiny-server.conf
sed -i -e "s/\$HOSTNAME/$HOSTNAME/g" /app/shiny-server.conf

ln -s /app/shiny-server.conf /etc/nginx/sites-enabled/shiny-server.conf

echo "Starting NGINX"

rm /etc/nginx/sites-enabled/default

service nginx start

exec /usr/bin/R --no-save --quiet --slave --file=/app/run.R
