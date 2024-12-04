#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
DOMAIN="localhost"
SV_CONTEXT="/scientific-visuals"
SV_DIR="/home/vagrant/scientific-visuals/dist"
SITE_CONF="/etc/apache2/sites-available/sv-visuals.conf"

# Update package list
echo "Updating package list..."
sudo apt update

# Install Apache2 and OpenSSL
echo "Installing Apache2 and OpenSSL..."
sudo apt install -y apache2 openssl

# Enable necessary Apache modules
echo "Enabling SSL and Alias modules..."
#sudo a2enmod ssl
sudo a2enmod alias
sudo a2enmod rewrite

sudo bash -c "cat > $SITE_CONF" <<EOL2
<VirtualHost *:80>
    ServerName $DOMAIN

    Alias $SV_CONTEXT $SV_DIR

    <Directory $SV_DIR>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/vito-visuals-error.log
    CustomLog \${APACHE_LOG_DIR}/vito-visuals-access.log combined
</VirtualHost>
EOL2

# Disable the default SSL site to prevent conflicts
#echo "Disabling default SSL site..."
#sudo a2dissite default-ssl.conf

# Enable the new site
echo "Enabling vito-visuals SSL site..."
sudo a2ensite sv-visuals.conf

# Test Apache configuration
echo "Testing Apache configuration..."
sudo apache2ctl configtest

# Reload Apache to apply changes
echo "Reloading Apache..."
sudo systemctl reload apache2

echo "Apache HTTP server with 'sv-visuals' context is set up successfully."
