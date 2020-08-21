project "zlib"
	language "C"
	kind "StaticLib"
	targetname "zlib"

	buildoptions { "/MP" }

	vpaths {
		["Headers/*"] = "*.h",
		["Sources/*"] = "*.c",
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",
		"*.h",
		"*.c"
	}

	excludes {
		"example.c"
	}

	defines { "verbose=-1" }    -- Stop "bit length overflow" warning
