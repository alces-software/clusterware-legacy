################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2015 Alces Software Ltd
##
################################################################################
export alces_PATH=/opt/clusterware/
export alces_MODE=system

if [ -d "${alces_PATH}/etc/clusterware/plugins.d" ]; then
    for a in "$alces_PATH/etc/clusterware/plugins.d"/*.sh; do
	if [ -r "$a" ]; then
	    source $a
	fi
    done
fi
