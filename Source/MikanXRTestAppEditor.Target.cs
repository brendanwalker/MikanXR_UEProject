using UnrealBuildTool;
using System.Collections.Generic;

public class MikanXRTestAppEditorTarget : TargetRules
{
	public MikanXRTestAppEditorTarget(TargetInfo Target) : base(Target)
	{
		DefaultBuildSettings = BuildSettingsVersion.V2;
		Type = TargetType.Editor;
		
		ExtraModuleNames.Add("MikanXRTestApp");
	}
}
