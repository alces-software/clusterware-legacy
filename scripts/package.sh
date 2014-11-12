#!/bin/bash
DIR=$(cd `dirname $0` && pwd)
cd $DIR/..
git archive master > symphony.tar
if [ -x $(which gtar 2> /dev/null) ]; then
    TAR=gtar
else
    TAR=tar
fi
$TAR -rf symphony.tar archives
gzip symphony.tar
cp symphony.tar.gz scripts/bootstrap bootstrap/.
rm symphony.tar.gz
