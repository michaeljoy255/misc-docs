#==============================================================================
# This is a shell script used to setup the shell prompt for Git-Bash.
# I've altered this one from the original based on my preferences.
# Script located at: C:\Program Files\Git\etc\profile.d\git-prompt.sh
#
# To alter colors - [##m\]
# NUMBER	COLOR
# 30		Black
# 31		Red
# 32		Green
# 33		Yellow
# 34		Blue
# 35		Magenta
# 36		Cyan
# 37		White
#==============================================================================

PS1='\[\033]0;Git-Bash: ${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\[\033[35m\]'       # change color to magenta
PS1="$PS1"'\w'                 # current working directory

#------------------------------------------------------------------------------
# Git prompt helpers - Leave this mostly unchanged
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[36m\]'  # change color to cyan
		PS1="$PS1"'`__git_ps1`'   # bash function
	fi
fi
#------------------------------------------------------------------------------

PS1="$PS1"'\[\033[0m\]'        # change color to white
PS1="$PS1"'$ '                 # prompt: always $
MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

#------------------------------------------------------------------------------
# Path to desired starting directory (depends on system)
#cd <path here>
