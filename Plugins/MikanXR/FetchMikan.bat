@echo off
call SetMikanVars_x64.bat

echo "Clear Output Binaries"
del "%~dp0Binaries\Win64\*.dll"
del "%~dp0Binaries\Win64\*.pdb"

echo "Copy Mikan DLLs"
copy "%MIKAN_DIST_PATH%\Mikan_CAPI.dll" "%~dp0ThirdParty\MikanXR\bin\win64"
copy "%MIKAN_DIST_PATH%\SpoutLibrary.dll" "%~dp0ThirdParty\MikanXR\bin\win64"
IF %ERRORLEVEL% NEQ 0 (
  echo "Error copying DLLs"
  goto failure
)

echo "Copy Mikan header files"
copy "%MIKAN_DIST_PATH%\include\*.h" "%~dp0ThirdParty\MikanXR\include"
IF %ERRORLEVEL% NEQ 0 (
  echo "Error copying header files"
  goto failure
)

echo "Copy Mikan Libs"
copy "%MIKAN_DIST_PATH%\lib\Mikan_CAPI.lib" "%~dp0ThirdParty\MikanXR\lib\win64\Mikan_CAPI.lib"
IF %ERRORLEVEL% NEQ 0 (
  echo "Error copying libs"
  goto failure
)


popd
EXIT /B 0

:failure
pause
EXIT /B 1