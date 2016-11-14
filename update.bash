#! /usr/bin/env bash

wdir="$(dirname $0)"
target="$(./target.bash)"

echo EXTRACTING...
for archive in $(./list.js)
do
  echo Uncompressing: $archive → $target
  7za x "$wdir/$archive" "-o$target" -y
done

echo CORRECTING...
cd ~/.redeclipse/maps
for item in $(ls)
do
  if [[ -d "$item" ]]
    then
      echo Getting stuffs out of $item
      for subitem in $(ls -A "$item")
      do
      	echo '  >' $subitem
      	mv "$item/$subitem" "../$subitem"
      done
      rmdir "$item"
  fi
done
