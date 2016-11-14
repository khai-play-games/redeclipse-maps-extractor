#! /usr/bin/env bash

wdir="$(pwd)"
target="$(./target.bash)"

echo CLEANING...
cd "$target"
rm -rvf *

echo EXTRACTING...
cd "$wdir"
for archive in $(./list.js)
do
  echo Uncompressing: $archive → $target
  7za x "$wdir/$archive" "-o$target" -y
done

echo FLATTENING...
function flatten () (
  if [[ -d "$1" ]]
  	then
  	  echo '  d>' $1
  	  for item in $(ls "$1")
  	  do
  	    flatten "$1/$item"
  	  done
  	  rmdir "$1"
  elif [[ -f "$1" ]]
    then
      echo '  f>' $1
      mv "$1" "$target"
  fi
)
for item in $(ls "$target")
do
  if [[ -d "$target/$item" ]]
    then flatten "$target/$item"
  fi
done
