if "%2" EQU "" (
  set PARAM1=HEAD
  set PARAM2=%1
) else (
  set PARAM1=%2
  set PARAM2=%1
)

setlocal ENABLEDELAYEDEXPANSION
set diff=
for /f "delims=" %%d in (
  'git diff --diff-filter=AMCR --name-only PARAM1 PARAM2'
) do (
  set diff=!diff! %%d
)

git diff --name-status PARAM2 PARAM1 >> ../filelist.txt
git archive --format=zip --prefix=www/ PARAM1 %diff% -o ../diff.zip

endlocal
