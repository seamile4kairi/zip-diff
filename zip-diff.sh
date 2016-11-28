#!/bin/sh

if [ "$2" = "" ]; then
  git diff --name-status HEAD $1 > ../filelist.txt
  git archive --format=zip --prefix=www/ HEAD `git diff --diff-filter=AMCR --name-only HEAD $1` -o ../diff.zip
else
  git diff --name-status $2 $1 > ../filelist.txt
  git archive --format=zip --prefix=www/ $1 `git diff --diff-filter=AMCR --name-only $2 $1` -o ../diff.zip
fi
