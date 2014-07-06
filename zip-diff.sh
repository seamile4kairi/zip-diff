#!/bin/sh
git archive --format=zip --prefix=www/ $1 `git diff --name-only $1 $2` -o ../diff.zip
git diff --name-status $2 $1 > ../filelist.txt
