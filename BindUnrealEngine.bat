@echo off
setlocal

::Select the path to the root UnrealEngine folder
if DEFINED UNREAL_ENGINE_PATH (goto setup_copy_script)
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the root folder for UnrealEngine (ex: C:\Program Files\Epic Games\UE_5.4\Engine).',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "UNREAL_ENGINE_PATH=%%I"
if NOT DEFINED UNREAL_ENGINE_PATH (goto failure)

:setup_copy_script

:: Write out the paths to a batch file
del SetUnrealEngineVars_x64.bat
echo @echo off >> SetUnrealEngineVars_x64.bat
echo set "UNREAL_ENGINE_PATH=%UNREAL_ENGINE_PATH%" >> SetUnrealEngineVars_x64.bat

:: Success
EXIT /B 0

:failure
pause
EXIT /B 1