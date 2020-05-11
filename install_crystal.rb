#!/bin/sh
crystal build --release strip_ext.cr -o stripext
rm stripext.dwarf
mv stripext ~/bin/stripext
