################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
if ($?tcsh) then
	setenv alces_SHELL "tcsh"
else
	setenv alces_SHELL "csh"
endif

set prefix=""
set postfix=""

if ( $?histchars ) then
  set histchar = `echo $histchars | cut -c1`
  set _histchars = $histchars

  set prefix  = 'unset histchars;'
  set postfix = 'set histchars = $_histchars;'
else
  set histchar = \!
endif

if ($?prompt) then
  set prefix  = "$prefix"'set _prompt="$prompt";set prompt="";'
  set postfix = "$postfix"'set prompt="$_prompt";unset _prompt;'
endif

if ($?noglob) then
  set prefix  = "$prefix""set noglob;"
  set postfix = "$postfix""unset noglob;"
endif
set postfix = "set _exit="'$status'"; $postfix; test 0 = "'$_exit;'

alias al 'alces'
alias alces $prefix'if ( -e ${alces_PATH}/bin/alces ) ${alces_PATH}/bin/alces \!*; '$postfix

unset prefix
unset postfix
