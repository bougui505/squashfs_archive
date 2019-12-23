#!/usr/bin/env sh
# -*- coding: UTF8 -*-

# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr
# https://research.pasteur.fr/en/member/guillaume-bouvier/
# 2017-12-04 14:40:38 (UTC+0100)

# Mount the given squashfs archive in $MNTDIR

usage ()
{
	echo "Usage"
	echo "unsquash filename.sqsh"
	echo "• -u: unmount the archive"
}

if [ "$#" -lt 1 ]; then
    usage
    exit
fi

MNTDIR="/mnt/squashfs"

ARCHIVE=$1

if [ "$ARCHIVE" = "-u" ]; then
	sudo umount $MNTDIR
	echo "$MNTDIR unmounted"
else
	sudo mount "$ARCHIVE" "$MNTDIR" -t squashfs -o loop
	echo "$ARCHIVE mounted in $MNTDIR"
fi
