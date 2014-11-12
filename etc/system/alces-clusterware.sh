################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
export alces_PATH=/opt/clusterware/
export alces_MODE=system

for a in "$alces_PATH/etc/clusterware/plugins.d"/*.sh; do
  source $a
done
