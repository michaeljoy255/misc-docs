# Custom Bash Prompt
# I made this sometime in 2015 for practice.
# Not sure if it even still works or is useful.

function myprompt() {
    local GREEN="\[\033[0;32m\]"
    local BLUE="\[\033[0;34m\]"
    local NO_COLOR="\[\033[033[0m\]"

    #Appearance: [user@host directory ]$
    PS1="$NO_COLOR[$GREEN\u@\h: $BLUE\w $NO_COLOR]$ "
}
# Call function to alter prompt automatically
myprompt

# Custom PATH List
function mypath() {
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
