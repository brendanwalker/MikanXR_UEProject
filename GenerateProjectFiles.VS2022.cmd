set BuildBat="D:/Github/git-EpicGames/UnrealEngine_4.27/Engine/Build/BatchFiles/Build.bat"
%BuildBat% -projectfiles -vs2022 -project="%~dp0MikanXRTestApp.uproject" -Game -Engine -progress
