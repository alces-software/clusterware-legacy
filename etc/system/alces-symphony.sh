################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
export alces_PATH=/var/lib/alces/nodeware/
export alces_MODE=system

for a in "$alces_PATH/etc/symphony/plugins.d"/*.sh; do
  source $a
done
