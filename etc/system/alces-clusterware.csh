################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
setenv alces_PATH /opt/clusterware/
setenv alces_MODE system

foreach i ( "${alces_PATH}/etc/clusterware/plugins.d"/*.csh )
    source $i
end
