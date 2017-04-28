project "Shared"
	language "C++11"
	kind "StaticLib"
	targetname "shared"
		
	vpaths { 
		["Headers/*"] = { "**.h", "**.hpp" },
		["*"] = "premake5.lua",
	}
		
	files {
		"premake5.lua",
		"**.h",
		"**.hpp",
	}

	removefiles {
		"mods/**",
		"publicsdk/**",
		"XML/**",
	}

	flags { "ExcludeFromBuild" } 
