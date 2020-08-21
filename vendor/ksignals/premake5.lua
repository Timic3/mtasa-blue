project "ksignals"
	language "C++"
	kind "StaticLib"
	targetname "ksignals"

	buildoptions { "/MP" }

	vpaths {
		["Headers/*"] = "**.h",
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",
		"*.h",
	}
