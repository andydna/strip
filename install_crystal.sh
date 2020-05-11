#!/bin/sh
crystal build --release strip_ext.cr -o stripext
mv stripext ~/bin/stripext
