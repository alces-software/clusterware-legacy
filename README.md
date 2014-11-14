Alces Clusterware
=================

Alces Software Ltd HPC Clusterware facility

Clusterware is a set of tools that makes managing and using HPC clusters simpler and more integrated. 

Notes
-----

* Supports RHEL6/6 CentOS6/7 SL6/7
* Installs from a @core @base minimal install

Installation
------------

* Install Core

```
curl -L "https://raw.githubusercontent.com/alces-software/clusterware/master/scripts/bootstrap" | /bin/bash
```

* Install Facilities
 
 - HPC Stack
```
#reload your shell
bash -l
alces facility install stack https://github.com/alces-software/clusterware-stack
```
 - HPC Packager
```
#reload your shell
bash -l
alces facility install packager https://github.com/alces-software/clusterware-packager
```

Copyright (C) 2007-2014 Alces Software Ltd.
