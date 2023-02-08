# Setting Up A Laravel Local Dev Environment On Ubuntu

### Install PHP

    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    sudo apt-get install curl git wget unzip 

Verify the PHP version installed

    php -v

Install PHP basic modules

    sudo apt install php8.0 php8.0-common php8.0-mysql libapache2-mod-php8.0 php8.0-odbc php8.0-readline php8.0-sqlite3 php8.0-xsl php8.0-apcu php8.0-curl php8.0-opcache php8.0-redis php8.0-mbstring php8.0-tidy php8.0-yaml php8.0-bcmath php8.0-dev php8.0-imagick php8.0-memcached php8.0-uuid php8.0-zip php8.0-xdebug php8.0-cgi php8.0-psr php8.0-soap php8.0-cli php8.0-intl php8.0-oauth php8.0-xml


Change the following variables in php.ini

    memory_limit = 1000M - Set memory limit to what is available on the system
    post_max_size = 4G - Ensure that this value is greater or equal to the upload_max_filesize value
    upload_max_filesize = 4G - Set this to whatever you want the maximum to be

### Install Apache

    sudo apt install apache2
    sudo a2enmod rewrite

Check if Apache is running

    sudo systemctl status apache2

### Install specific MySQL version
First, load the MySQL download page [ https://dev.mysql.com/downloads/repo/apt/ ] in your web browser.
After you checked the latest version download package.

    wget http://repo.mysql.com/mysql-apt-config_0.8.10-1_all.deb
    sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb
    
    sudo apt update  
    sudo apt install mysql-server 

    # Secure installation
    sudo mysql_secure_installation 

    # If error is ocurred during setup root password this is the fix 1
    sudo mysql
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'mynewpassword';
    sudo mysql_secure_installation

    #if there is error "ERROR 1819 (HY000): Your password does not satisfy the current policy requirements"
    sudo mysql  # or mysql -h localhost -u root -p
    SET GLOBAL validate_password.policy=LOW;

    #Here is what I do to remove the validate password plugin:

    #Login to the mysql server as root mysql -h localhost -u root -p
    #Run the following sql command: uninstall plugin validate_password;
    #If last line doesn't work (new mysql release), you should execute UNINSTALL COMPONENT 'file://component_validate_password';

    # For a local dev environment I skip the 'Validate Password Plugin'.
    # You will be asked to enter a password for the root user.
    # From there remove the anonymous users, disallow the root user from remote access, and remove the test database.
    # When asked to reload privilege tables select yes.

Create a non-root user with root privileges

    mysql -u root -p
    
    CREATE USER 'admin'@'localhost' IDENTIFIED BY '';
    GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    mysql> exit

    mysql -u admin -p

    sudo service mysql status

    sudo service mysql stop
    sudo service mysql start

### Install Composer
    cd ~
    curl -sS https://getcomposer.org/installer -o composer-setup.php

Next, we’ll verify that the downloaded installer matches the SHA-384 hash for the latest installer 
found on the Composer [Public Keys / Signatures page](https://composer.github.io/pubkeys.html). To facilitate the verification step, you can use the following command to programmatically obtain the latest hash from the Composer page and store it in a shell variable:
    
    HASH=`curl -sS https://composer.github.io/installer.sig`
    echo $HASH

    php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    # To install composer globally, use the following command which will download and install Composer as a system-wide command named composer, under /usr/local/bin:
    sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    
    # To test your installation, run:
    composer


### Install phpMyAdmin

Download the latest phpMyAdmin archive from the official [download](https://www.phpmyadmin.net/downloads/) page

    DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
    URL="$(echo $DATA | cut -d ' ' -f 3)"
    VERSION="$(echo $DATA | cut -d ' ' -f 1)"

    wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-english.tar.gz
    
    tar xvf phpMyAdmin-${VERSION}-all-languages.tar.gz
    sudo mv phpMyAdmin-*/ /usr/share/phpmyadmin
    sudo mkdir /etc/phpmyadmin/

    sudo vim /usr/share/phpmyadmin/config.inc.php
    $cfg['blowfish_secret'] = 'H2OxcGXxflSd8JwrwVlh6KW6s2rER63i';

    $cfg['TempDir'] = '/var/lib/phpmyadmin/tmp';

Configure Apache web Server

    sudo nano /etc/apache/conf-available/phpmyadmin.conf

``` apacheconf
Alias /phpmyadmin /usr/share/phpmyadmin
Alias /phpMyAdmin /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin/>
   AddDefaultCharset UTF-8
   <IfModule mod_authz_core.c>
      <RequireAny>
      Require all granted
     </RequireAny>
   </IfModule>
</Directory>

<Directory /usr/share/phpmyadmin/setup/>
   <IfModule mod_authz_core.c>
     <RequireAny>
       Require all granted
     </RequireAny>
   </IfModule>
</Directory>
```

    sudo a2enconf phpmyadmin 
    sudo systemctl restart apache2 