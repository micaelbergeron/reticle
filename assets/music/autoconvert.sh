#!/bin/bash

for f in ./*.mp3
  do ffmpeg -i "$f" -c:a libvorbis -q:a 4 "../${f/%mp3/ogg}"
done

mv *.ogg ../../game/music/
