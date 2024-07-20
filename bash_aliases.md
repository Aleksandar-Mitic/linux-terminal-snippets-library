# LIST OF MY BASH ALIASES
*Do not forget after adding new aliases to run command: . source ~/.bashrc*

    #A bash alias has the following structure:
        alias [alias_name]="[command_to_alias]"

    #Open file manager here
        alias openfilemanager='xdg-open .'

    #Make grep more user friendly by highlighting matches and exclude grepping through .svn folders.
        alias grep='grep --color=auto --exclude-dir=\.svn'

    #if user is not root, pass all commands via sudo
        if [ $UID -ne 0 ]; then
            alias reboot='sudo reboot'
            alias updatesystem='sudo apt-get update && sudo apt-get upgrade'
        fi

    #Show open ports
        alias ports='netstat -tulanp'

    #Unpack pack zip etc commands
        alias untar='tar -zxvf '

    #Need to know your local IP address?
        alias myip='ip addr show'

    #SSH connections
        alias pp-sl="ssh ppssh@91.240.216.154 -p 106"
        alias pp-hr="ssh ppssh@91.240.216.145 -p 106"
        alias pp-de="ssh ppssh@91.240.216.151 -p 106"
        alias pp-es="ssh ppssh@91.240.216.147 -p 106"
        alias pp-fr="ssh ppssh@91.240.216.146 -p 106"
        alias pp-hu="ssh ppssh@91.240.216.149 -p 106"
        alias pp-it="ssh ppssh@91.240.216.150 -p 106"
        alias pp-nl="ssh ppssh@91.240.216.143 -p 106"
        alias pp-pl="ssh ppssh@91.240.216.152 -p 106"
        alias pp-ro="ssh ppssh@91.240.216.144 -p 106"
        alias pp-sk="ssh ppssh@91.240.216.194 -p 106"
        alias pp-cz="ssh ppssh@91.240.216.148 -p 106"
        alias funnelsio-server="ssh forge@164.92.166.0"
        
        alias pp-dev="ssh ppssh@91.240.216.211 -p 106"
        
        alias pp-metrics="ssh laravel@91.240.216.53 -p 106"

    #Apache
        alias sites-enabled="apachectl -S"
        alias cd-sites-enabled="cd /etc/apache2/sites-enabled"
        alias cd-apache-log="cd /var/log/apache2"
    
        alias apachereload='sudo /usr/sbin/apachectl -k graceful'
        alias apachetest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'
    
        alias apache-status='sudo systemctl status apache2'
        alias apache-start='sudo systemctl start apache2'
        alias apache-stop='sudo systemctl stop apache2'
        alias apache-restart='sudo /usr/sbin/apachectl -k graceful'

    #PHP
        alias php-config='sudo subl /etc/php/8.0/apache2/php.ini'
        alias cd-php-config='cd /etc/php/8.0/apache2/php.ini'

    # MySql
        alias mysql-cnf="/usr/sbin/mysqld --verbose --help"
        alias mysql-config="/usr/sbin/mysqld --verbose --help"

        alias mysql-cnf-location="/usr/sbin/mysqld --verbose --help | grep -A 1 \"Default options\""
        alias mysql-config-location="/usr/sbin/mysqld --verbose --help | grep -A 1 \"Default options\""

        alias mysql-status="systemctl status mysql.service"
        alias mysql-restart="systemctl restart mysql.service"
        alias mysql-stop="systemctl stop mysql.service"
        alias mysql-start="systemctl start mysql.service"

    # Laravel shortcuts
        alias art="php artisan"
        alias mfs="php artisan migrate:fresh --seed"
        alias pp-mfs="php artisan db:wipe --database pp-metrics && php artisan db:wipe --database pp-advertising && php artisan migrate:fresh --seed"
        alias migrate="php artisan migrate"
        alias dev='cd /var/www/'
        alias pint='./vendor/bin/pint'
        alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

    # Dev shortcut
        alias dev='cd /var/www/'

    #Edit Hosts
        alias edit-hosts="sudo subl /etc/hosts"
        alias view-hosts="cat /etc/hosts"

    # get rid of command not found
        alias cd..='cd ..'

    # a quick way to get out of current directory
        alias ..='cd ..'
        alias ...='cd ../../../'
        alias ....='cd ../../../../'
        alias .....='cd ../../../../'
        alias .4='cd ../../../../'
        alias .5='cd ../../../../..'

    # pass options to free
        alias meminfo='free -m -l -t'

    # get top process eating memory
        alias psmem='ps auxf | sort -nr -k 4'
        alias psmem10='ps auxf | sort -nr -k 4 | head -10'

    # get top process eating cpu ##
        alias pscpu='ps auxf | sort -nr -k 3'
        alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

    # Get server cpu info ##
        alias cpuinfo='lscpu'

    # older system use /proc/cpuinfo ##
    ##alias cpuinfo='less /proc/cpuinfo' ##

    # get GPU ram on desktop / laptop##
        alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
