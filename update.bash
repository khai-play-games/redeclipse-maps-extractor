#! /usr/bin/env bash
wdir="$(dirname $0)"
target="$(./target.bash)"
for archive in $(./list.js)
do
  echo Uncompressing: $archive → $target
  7za x "$wdir/$archive" "-o$target" -y
done
