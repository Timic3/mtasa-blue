project "discord-rpc"
	language "C++"
	kind "StaticLib"
	targetname "discord-rpc"

	includedirs { "include" }
	defines { "ENABLE_IO_THREAD", "USE_STATIC_CRT" }

	files {
		"premake5.lua",
		"rapidjson/**.h",
		"include/*.h",
		"src/*.h",
		"src/*.cpp"
	}

	-- We don't need other dependencies than Windows
	excludes {
		"src/discord_register_linux.cpp",
		"src/discord_register_osx.m",
		"src/connection_unix.cpp",
		"src/dllmain.cpp"
	}