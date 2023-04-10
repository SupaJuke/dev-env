#!/bin/bash

if [[ $# -lt 1 ]]
then
    echo "usage: $0 <path to font dir> [font-patcher flags]"
    exit
fi

FONT_DIR=$(dirname $1)
FLAGS="--complete"

if [[ $# -gt 1 ]]
then
    FLAGS="$FLAGS ${@:2}"
fi

for FILE in $FONT_DIR/*.*tf
do
    # echo "ran: fontforge -script FontPatcher/font-patcher $FLAGS -out "${FONT}_patched" $FILE" # For debug purposes
    # echo $FILE
    fontforge -script FontPatcher/font-patcher $FLAGS -out ${FONT_DIR}/patched/ $FILE
done
