#!/bin/bash -e

#
# RH prerequisites:
#   1. sudo yum install git
#

function realpath { echo $(cd $(dirname $1); pwd)/$(basename $1); }

REPODIR=$(dirname $(realpath $0))
CRYPTED_REPODIR=$(dirname $REPODIR)/gcrypt-$(basename $REPODIR)

ORIGIN_URI=$(git remote -v |grep origin|awk -F ' ' '{print $2}' |head -1)

echo "Cloning gcrypt repository into $CRYPTED_REPODIR..."
git clone gcrypt::$ORIGIN_URI $CRYPTED_REPODIR
cd $CRYPTED_REPODIR

echo "Calling decrypted setup.sh..."
./setup.sh