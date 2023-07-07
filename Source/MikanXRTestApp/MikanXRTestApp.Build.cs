// Copyright // Copyright 2015-2018 Polyarc, Inc. All rights reserved.

using UnrealBuildTool;

public class MikanXRTestApp : ModuleRules
{
	public MikanXRTestApp(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

		PublicDependencyModuleNames.AddRange(new string[]
		{
			"Core",
			"CoreUObject",
			"Engine",
			"InputCore"
		});
	}
}
