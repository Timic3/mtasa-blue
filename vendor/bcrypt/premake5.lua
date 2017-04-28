project "blowfish_bcrypt"
	language "C++11"
	kind "StaticLib"
	targetname "blowfish_bcrypt"
	
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
