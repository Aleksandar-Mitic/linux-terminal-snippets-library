#!/bin/bash

set -x

#Set variables here
LARAVEL_OWNER=$SUDO_USER # <-- owner (user)
LARAVEL_WS_GROUP=www-data # <-- WebServer group
LARAVEL_ROOT=$PWD # <-- Laravel root directory


# BEGIN Fix Laravel Permissions Script

# First set up 755 permission to all files recursively
sudo chmod -R 755 ${LARAVEL_ROOT}

# Adding owner to web server group
sudo usermod -a -G ${LARAVEL_WS_GROUP} ${LARAVEL_OWNER}

# Set files owner/group
sudo chown -R ${LARAVEL_OWNER}:${LARAVEL_WS_GROUP} ${LARAVEL_ROOT}

# Set correct permissions for directories
sudo find ${LARAVEL_ROOT} -type f -exec chmod 644 {} \;

# Set correct permissions for files
sudo find ${LARAVEL_ROOT} -type d -exec chmod 755 {} \;

# Give rights for web server to read and write storage and cache
sudo chgrp -R ${LARAVEL_WS_GROUP} ${LARAVEL_ROOT}/storage ${LARAVEL_ROOT}/bootstrap/cache
sudo chmod -R ug+rwx ${LARAVEL_ROOT}/storage ${LARAVEL_ROOT}/bootstrap/cache

## give the newly created files/directories the group of the parent directory
## e.g. the laravel group
sudo find ${LARAVEL_ROOT}/bootstrap/cache -type d -exec chmod g+s {} \;
sudo find ${LARAVEL_ROOT}/storage -type d -exec chmod g+s {} \;

# CodersTape manual below
#sudo chmod -R 775 ${LARAVEL_ROOT}/storage/

## let newly created files/directories inherit the default owner
## permissions up to maximum permission of rwx e.g. new files get 664, folders get 775
sudo setfacl -R -d -m g::rwx ${LARAVEL_ROOT}/storage
sudo setfacl -R -d -m g::rwx ${LARAVEL_ROOT}/bootstrap/cache

## Reboot so group file permissions refresh (required on Debian and Centos)
#sudo shutdown now -r

echo "Script finished altering permissions! Proceed with your work...";
