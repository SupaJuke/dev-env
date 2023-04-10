#!/bin/bash

if [[ $# -lt 1 ]]
then
    echo "usage: $0 <path to font dir> [font-patcher flags]"
    exit
fi

FONT=$1
FLAGS="--complete"
if [[ $# -gt 1 ]]
then
    FLAGS="$FLAGS ${@:2}"
fi

for FILE in "$FONT/*.*tf"
do
    # echo "fontforge -script FontPatcher/font-patcher $FILE $FLAGS -out "$FONT/nerd_font/"" # For debug purposes
    fontforge -script FontPatcher/font-patcher $FILE $FLAGS -out "${FONT}_patched/"
done
