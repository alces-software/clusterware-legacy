################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
alces() { 
    if [[ -t 1 && "$TERM" != linux ]]; then
	export alces_COLOUR=1
    else
	export alces_COLOUR=0
    fi
    [[ -s "$alces_PATH/bin/alces" ]] && case $1 in
	mo*)
	    if [[ ! $(ps -o 'command=' -p "$$" 2>/dev/null) =~ ^- ]]; then
		# Not an interactive shell
		if [[ ! ":$alces_FLAGS:" =~ :verbose-modules: ]]; then
  	            export alces_MODULES_VERBOSE=0
		fi
            fi
	    case $2 in
		al*|h*|-h|--help)
		    if [[ ":$alces_FLAGS:" =~ :nopager: ]]; then
			"$alces_PATH/bin/alces" "$@" 0>&1 2>&1
		    else
			"$alces_PATH/bin/alces" "$@" 0>&1 2>&1 | less -FRX
		    fi
		    ;;
		*)
		    if [[ ":$alces_FLAGS:" =~ :nopager: ]]; then
			eval $($alces_PATH/bin/alces "$@") 2>&1
		    else
			eval $($alces_PATH/bin/alces "$@" 2> >(less -FRX >&2)) 2>&1
		    fi
		    ;;
	    esac
	    ;;
	*)
	    "$alces_PATH/bin/alces" "$@"
	    ;;
    esac
    unset alces_COLOUR
}
if [ "$ZSH_VERSION" ]; then
  export alces
else
  export -f alces
fi
alias al=alces
#SFN - breaks xterm title PS1
#if [ "$alces_MODE" = "system" ]; then
#    # We use prompt command for system-wide use rather than customizing PS1
#    export PROMPT_COMMAND="alces message last"
#else
#    export PS1='$(alces message last)'$PS1
#fi

export alces_SHELL=bash

if [ "$BASH_VERSION" ]; then
    _alces() {
        local cur="$2" prev="$3" cmds opts

        COMPREPLY=()

	cmds=$(ls $alces_PATH/opt/clusterware/lib/actions)
        #cmds="attach config help hub message module packager session"

        if ((COMP_CWORD == 1)); then
            COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
        else
	    if type _alces_packager &>/dev/null; then
		case "${COMP_WORDS[1]}" in
                    pa*)
			_alces_packager "$cur" "$prev"
			;;
                    mo*)
			unset COMP_WORDS[0]
			COMP_CWORD=$(($COMP_CWORD-1))
			_module "module" "$cur" "$prev"
			;;
                    *) 
			case "$cur" in
                            *)
				COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
				;;
			esac
			;;
		esac
	    else
		COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
	    fi
        fi
    }

    complete -o default -F _alces alces al
fi
