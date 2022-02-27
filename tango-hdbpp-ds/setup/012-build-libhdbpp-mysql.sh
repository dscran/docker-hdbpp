#! /bin/bash

REPOSITORY=https://github.com/tango-controls-hdbpp/libhdbpp-mysql.git
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
    --pkgversion="1.2.0" \
    --pkgrelease="SNAPSHOT" \
    --pkgname=$PKGNAME \
    --requires="libhdbpp" \
    make install

