################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
setenv alces_PATH /var/lib/alces/nodeware/
setenv alces_MODE system

foreach i ( "${alces_PATH}/etc/symphony/plugins.d"/*.csh )
    source $i
end
