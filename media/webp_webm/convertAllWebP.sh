#!/bin/bash

for file in `\find . -maxdepth 5 -type f`; do
  faname_ext="${file##*.}"   # get ext
  if [ "$faname_ext" = 'mp4' ] ; then #if mp4
    fname=${file%.*}
    newfile=$fname".webm"  # convert to webm
    ffmpeg -y -i $file $newfile
  else  #それ以外は
    fname=${file%.*}
    newfile=$fname".webp"  # convert to webp
    ffmpeg -y -i $file $newfile
  fi
done