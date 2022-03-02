#! /bin/bash

REPOSITORY=https://github.com/tango-controls-hdbpp/hdbpp-cm.git
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
    --install=no \
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
    --requires="libtango9,libhdbpp" \
    make install

