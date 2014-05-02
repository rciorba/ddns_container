#!/bin/bash


while test $# -gt 0; do
    case "$1" in
        -r|--root)
            shift
            ROOT=$1
            shift
            ;;
        *)
            break
            ;;
    esac
done

if ! [ $DEB_MIRROR ]; then
    DEB_MIRROR=http://ftp.ch.debian.org/debian/
fi
STAMP=`date +%s`

if ! [ $ROOT ]; then
    ROOT=rootfs.$STAMP
    debootstrap --arch=amd64 --variant=minbase --include=bind9 wheezy $ROOT $DEB_MIRROR
else
    cp -r $ROOT rootfs.$STAMP
    ROOT=rootfs.$STAMP
fi

rm latest
ln -s `pwd`/$ROOT ./latest

export ROOT
source ./configure.sh

EXCLUDE=$(echo $ROOT/proc | sed s_//_/_g)
tar --exclude $EXCLUDE -cf wheezy.$STAMP.tar $ROOT
mv wheezy.$STAMP.tar ../images/
echo built ../images/wheezy.$STAMP.tar
