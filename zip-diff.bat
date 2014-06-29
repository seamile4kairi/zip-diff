setlocal ENABLEDELAYEDEXPANSION
set diff=
for /f "delims=" %%d in ('git diff --name-only %1 %2') do set diff=!diff! %%d
git archive --format=zip --prefix=www/ %1 %diff% -o ../diff.zip
git diff --name-status %2 %1 >> ../filelist.txt
endlocal