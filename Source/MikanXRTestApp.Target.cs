using UnrealBuildTool;
using System.Collections.Generic;

public class MikanXRTestAppTarget : TargetRules
{
	public MikanXRTestAppTarget(TargetInfo Target) : base(Target)
	{
		DefaultBuildSettings = BuildSettingsVersion.V2;
		Type = TargetType.Game;
		
		ExtraModuleNames.Add("MikanXRTestApp");
	}
}
