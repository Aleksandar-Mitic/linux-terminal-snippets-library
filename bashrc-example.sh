# typing 'path' in terminal whill list all PATH on the system
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}