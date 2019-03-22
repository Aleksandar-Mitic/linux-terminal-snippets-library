# LIST OF MY BASH ALIASES
*Do not forget after adding new aliases to run command: . ~/.bashrc*

A bash alias has the following structure:

    alias [alias_name]="[command_to_alias]"

Open file manager here

    alias openfilemanager='xdg-open .'

Make grep more user friendly by highlighting matches
and exclude grepping through .svn folders.

    alias grep='grep --color=auto --exclude-dir=\.svn'

if user is not root, pass all commands via sudo

    if [ $UID -ne 0 ]; then
        alias reboot='sudo reboot'
        alias updatesystem='sudo apt-get update && sudo apt-get upgrade'
    fi

Show open ports

    alias ports='netstat -tulanp'

Unpack pack zip etc commands

    alias untar='tar -zxvf '

Need to know your local IP address?

    alias myip='ip addr show'
