################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2015 Alces Software Ltd
##
################################################################################
setenv alces_PATH /opt/clusterware/
setenv alces_MODE system

if ( -d "${alces_PATH}/etc/clusterware/plugins.d" ) then
    set nonomatch
    foreach i ( "${alces_PATH}/etc/clusterware/plugins.d"/*.csh )
      if ( -r "$i" ) then
         source "$i"
      endif
    end
    unset i nonomatch
endif
