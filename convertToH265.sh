#!/bin/bash

# https://handbrake.fr/docs/en/latest/cli/cli-guide.html

SRC=./in/*.*
DEST=./out
DEST_EXT=mp4
HANDBRAKE_CLI=HandBrakeCLI

find $SRC | while read -r FILE
do

	# rename file
	cleanFileName=${FILE// /_}
	mv "$FILE" "$cleanFileName"

	# build path to output dir
    filename=$(basename $cleanFileName)
    extension=${filename##*.}
    filename=${filename%.*}
    
    # start cli
    $HANDBRAKE_CLI -i $cleanFileName -o $DEST/$filename.$DEST_EXT -e x265 -q 20 --all-audio --all-subtitles
done
