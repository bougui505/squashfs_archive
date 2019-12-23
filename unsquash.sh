#!/usr/bin/env zsh
# -*- coding: UTF8 -*-

# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr
# https://research.pasteur.fr/en/member/guillaume-bouvier/
# 2017-12-04 14:40:38 (UTC+0100)

# Mount the given squashfs archive in $MNTDIR

usage ()
{
	echo "Usage: "
	echo "unsquash filename.sqsh"
	echo "• -u filename.sqsh: unmount the archive"
}

if [ "$#" -lt 1 ]; then
    usage
    exit
fi

ACTION="MOUNT"
if [ "$1" = "-u" ]; then
    ACTION="UNMOUNT"
    shift
fi

ARCHIVE="$1"
MNTDIR="$ARCHIVE:r"

if [ $ACTION = "UNMOUNT" ]; then
    sudo umount $MNTDIR \
        && echo "$MNTDIR unmounted" \
        && rmdir "$MNTDIR"
else
    mkdir $MNTDIR \
        && sudo mount "$ARCHIVE" "$MNTDIR" -t squashfs -o loop \
        && echo "$ARCHIVE mounted in $MNTDIR"
fi
