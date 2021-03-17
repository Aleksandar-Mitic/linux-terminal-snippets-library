# LIST OF MY BASH ALIASES
*Do not forget after adding new aliases to run command: . ~/.bashrc*

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

    #Reload web servers
        alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
        alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
        alias lightyload='sudo /etc/init.d/lighttpd reload'
        alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
        alias apachereload='sudo /usr/sbin/apachectl -k graceful'
        alias apachetest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

    #Which apache sites are enabled?
        alias sites-enabled="apachectl -S"

    # Laravel shortcuts
        alias art="php artisan"
        alias mfs="php artisan migrate:fresh --seed"
        alias migrate="php artisan migrate"
        alias dev='cd /var/www/'
        alias createshortcut="ln -s $PWD ~/Desktop/"

    # Dev shortcut
        alias dev='cd /var/www/'
