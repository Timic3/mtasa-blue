project "blowfish_bcrypt"
	language "C++"
	kind "StaticLib"
	targetname "blowfish_bcrypt"

	buildoptions { "/MP" }

	vpaths {
		["Headers/*"] = "*.h",
		["Sources/*"] = "*.c",
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",

		"*.h",
		"*.c",
		"*.S"
	}
