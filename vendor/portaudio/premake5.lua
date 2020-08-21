project "portaudio"
	language "C++"
	kind "StaticLib"
	targetname "portaudio"

	buildoptions { "/MP" }

	disablewarnings { "4996" }

	vpaths {
		["Headers/*"] = "**.h",
		["Sources/*"] = "**.c",
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",
		"*.h",
		"*.c"
	}

	filter "architecture:x64"
		flags { "ExcludeFromBuild" }
	filter "system:not windows"
		flags { "ExcludeFromBuild" }