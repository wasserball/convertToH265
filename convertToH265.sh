#!/bin/bash

# this script is to automatically convert a folder of video files to H.265
# You need to change SRC -- Source folder and DEST -- Destination folder


#         $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT -e x265 -q 20 -E av_aac --custom-anamorphic --keep-display-aspect -O
# https://handbrake.fr/docs/en/latest/cli/cli-guide.html

SRC=/home/nick/Desktop/convertToH265/in
DEST=/home/nick/Desktop/convertToH265/out
DEST_EXT=mp4
HANDBRAKE_CLI=HandBrakeCLI

for FILE in `ls $SRC`
do
        filename=$(basename $FILE)
        extension=${filename##*.}
        filename=${filename%.*}

        $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT -e x265 -q 20 --all-audio --all-subtitles
done
