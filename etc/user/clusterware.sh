################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2012 Alces Software Ltd
##
################################################################################
export alces_PATH="$HOME/.alces"
export alces_MODE=user

for a in "$alces_PATH/etc/clusterware/plugins.d"/*.sh; do
  source $a
done
