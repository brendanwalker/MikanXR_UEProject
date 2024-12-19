@echo off
call SetUnrealEngineVars_x64.bat

set "BUILD_BAT=%UNREAL_ENGINE_PATH%\Build\BatchFiles\Build.bat"
echo %BUILD_BAT%

if not exist "%BUILD_BAT%" goto Error_BatchFileInWrongLocation
call "%BUILD_BAT%" -projectfiles -project="%~dp0\MikanXRTestApp.uproject" -game -rocket -progress
exit /B %ERRORLEVEL%

:Error_BatchFileInWrongLocation
echo GenerateProjectFiles ERROR: The batch file does not appear to be located in the UnrealEngine directory.  
pause
exit /B 1
