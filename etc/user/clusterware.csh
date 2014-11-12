################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
setenv alces_PATH "$HOME/.alces"
setenv alces_MODE user

foreach i ( "${alces_PATH}/etc/clusterware/plugins.d"/*.csh )
    source $i
end
