#!/bin/sh

# Enter the path to your FileMaker Server directory, ending in a slash 
SERVER_PATH="/opt/FileMaker/FileMaker Server/"

FMADMIN="fmConsoleLogin"
FMPASS="fmConsolePassword"

#
# --- you shouldn't need to edit anything below this line
#

WEB_ROOT="${SERVER_PATH}HTTPServer/htdocs"


# Get the certificate
certbot renew

cp "/etc/letsencrypt/live/${DOMAIN}/fullchain.pem" "${SERVER_PATH}CStore/fullchain.pem"
cp "/etc/letsencrypt/live/${DOMAIN}/privkey.pem" "${SERVER_PATH}CStore/privkey.pem"

chmod 640 "${SERVER_PATH}CStore/privkey.pem"

# Move an old certificate, if there is one, to prevent an error
# changed to server.pem as that seems to be used by fm now instead
mv "${SERVER_PATH}CStore/server.pem" "${SERVER_PATH}CStore/serverKey-old.pem"

# Remove the old certificate
fmsadmin certificate delete --yes -u ${FMADMIN} -p ${FMPASS}

# Install the certificate
fmsadmin certificate import "${SERVER_PATH}CStore/fullchain.pem" --keyfile "${SERVER_PATH}CStore/privkey.pem" -y -u ${FMADMIN} -p ${FMPASS}

# Stop FM service
sudo service fmshelper stop

# Start FM service
sudo service fmshelper start
