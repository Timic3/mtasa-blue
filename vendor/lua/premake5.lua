project "minilua"
	language "C++"
	targetname "minilua"
	kind "ConsoleApp"
	targetdir "src"
	targetsuffix ""

	linkoptions { "/SAFESEH:NO", "/RELEASE" }

	vpaths {
		["Headers"] = "**.h",
		["Sources"] = "**.c",
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",
		"src/host/minilua.c"
	}

	defines { "_CRT_SECURE_NO_DEPRECATE", "_CRT_STDIO_INLINE=__declspec(dllexport)__inline" }

	postbuildcommands {
		"{CHDIR} %{wks.location}/../vendor/lua/src",
		"minilua ../dynasm/dynasm.lua -LN -D WIN -D JIT -D FFI -o host/buildvm_arch.h vm_x86.dasc"
	}

project "buildvm"
	language "C++"
	targetname "buildvm"
	kind "ConsoleApp"
	targetdir "src"
	targetsuffix ""

	dependson "minilua"

	linkoptions { "/SAFESEH:NO", "/RELEASE" }

	vpaths {
		["Headers"] = "**.h",
		["Sources"] = "**.c",
		["*"] = "premake5.lua"
	}

	includedirs {
		"dynasm", "src"
	}

	files {
		"premake5.lua",
		"src/host/buildvm*.c"
	}

	defines { "_CRT_SECURE_NO_DEPRECATE", "_CRT_STDIO_INLINE=__declspec(dllexport)__inline" }

	postbuildcommands {
		"{CHDIR} %{wks.location}/../vendor/lua/src",
		"buildvm -m peobj -o lj_vm.obj",
		"buildvm -m bcdef -o lj_bcdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_utf8.c",
		"buildvm -m ffdef -o lj_ffdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_utf8.c",
		"buildvm -m libdef -o lj_libdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_utf8.c",
		"buildvm -m recdef -o lj_recdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_utf8.c",
		"buildvm -m vmdef -o jit/vmdef.lua lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_utf8.c",
		"buildvm -m folddef -o lj_folddef.h lj_opt_fold.c"
	}

project "Lua"
	language "C++"
	kind "SharedLib"
	targetname "lua51"
	targetdir "src"
	targetsuffix ""

	linkoptions { "/SAFESEH:NO" }

	dependson { "buildvm" }

	libdirs { "src" }

	vpaths {
		["Headers"] = "**.h",
		["Sources"] = "**.c",
		["*"] = "premake5.lua"
	}
	
	files {
		"premake5.lua",
		"src/lj_*.c",
		"src/lib_*.c",
	}

	buildoptions {
		"/arch:SSE2", "/MD"
	}

	defines {
		"_CRT_SECURE_NO_DEPRECATE",
		"_CRT_STDIO_INLINE=__declspec(dllexport)__inline",
		"LUA_USE_APICHECK",
		"LUA_BUILD_AS_DLL"
	}

	links { "./src/lj_*.obj", "./src/lib_*.obj" }
