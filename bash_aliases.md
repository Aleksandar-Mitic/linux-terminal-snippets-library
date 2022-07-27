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

    #Apache
        alias sites-enabled="apachectl -S"
        alias scd-sites-enabled="cd /etc/apache2/sites-enabled"

        alias apachereload='sudo /usr/sbin/apachectl -k graceful'
        alias apachetest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

    # Laravel shortcuts
        alias art="php artisan"
        alias mfs="php artisan migrate:fresh --seed"
        alias migrate="php artisan migrate"
        alias dev='cd /var/www/'


    # Dev shortcut
        alias dev='cd /var/www/'

    # MySql
        alias mysql-cnf="/usr/sbin/mysqld --verbose --help"
        alias mysql-config="/usr/sbin/mysqld --verbose --help"

        alias mysql-cnf-location="/usr/sbin/mysqld --verbose --help | grep -A 1 \"Default options\""
        alias mysql-config-location="/usr/sbin/mysqld --verbose --help | grep -A 1 \"Default options\""

        alias mysql-status="systemctl status mysql.service"

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