#!/bin/bash

FLAGS="--complete"

for FILE in original/*
do
    fontforge -script ../FontPatcher/font-patcher $FILE $FLAGS $@ -out nerd_font/
done
