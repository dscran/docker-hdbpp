#! /bin/bash

REPOSITORY=https://gitlab.com/tango-controls/hdbpp/libhdbpp.git
_GITNAME=${REPOSITORY##*/}
PKGNAME=${_GITNAME%.*}

cd ~
git clone $REPOSITORY
cd $PKGNAME
mkdir build
cd build
cmake ..
make
checkinstall -y \
    --pakdir=/ \
    --install=yes \
    --fstrans=no \
    --showinstall=no \
    --backup=no \
    --type=debian \
    --pkgsource="$REPOSITORY" \
    --pkglicense="LGPLv3" \
    --deldesc=no \
    --nodoc \
    --strip \
    --stripso \
    --maintainer="tango" \
    --pkgarch=$(dpkg --print-architecture) \
    --pkgversion="2.0.0" \
    --pkgrelease="SNAPSHOT" \
    --pkgname=$PKGNAME \
    --requires="libzmq5,libomniorb4-2" \
    make install

