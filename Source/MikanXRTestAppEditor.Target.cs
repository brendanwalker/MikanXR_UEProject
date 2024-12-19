using UnrealBuildTool;
using System.Collections.Generic;

public class MikanXRTestAppEditorTarget : TargetRules
{
	public MikanXRTestAppEditorTarget(TargetInfo Target) : base(Target)
	{
		DefaultBuildSettings = BuildSettingsVersion.V5;
		IncludeOrderVersion = EngineIncludeOrderVersion.Latest;
		Type = TargetType.Editor;
		
		ExtraModuleNames.Add("MikanXRTestApp");
	}
}
