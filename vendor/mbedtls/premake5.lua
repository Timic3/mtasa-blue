project "mbedtls"
	language "C"
	kind "StaticLib"
	targetname "mbedtls"

	buildoptions { "/MP" }

	defines { "MBEDTLS_ZLIB_SUPPORT" }
	includedirs { "include", "../zlib" }
	warnings "off"

	files {
		"premake5.lua",
		"include/**.h",
		"library/*.c"
	}

	filter { "system:windows" }
		flags { "ExcludeFromBuild" }
