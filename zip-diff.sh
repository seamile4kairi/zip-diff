#!/bin/sh
if [ "$2" = "" ]; then
  git archive --format=zip --prefix=www/ HEAD `git diff --name-only HEAD $1` -o ../diff.zip
  git diff --name-status $1 HEAD > ../filelist.txt
else
  git archive --format=zip --prefix=www/ $1 `git diff --name-only $1 $2` -o ../diff.zip
  git diff --name-status $2 $1 > ../filelist.txt
fi
