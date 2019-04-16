-- scaffold geniefile for incbin

incbin_script = path.getabsolute(path.getdirectory(_SCRIPT))
incbin_root = path.join(incbin_script, "incbin")

incbin_includedirs = {
	path.join(incbin_script, "config"),
	incbin_root,
}

incbin_libdirs = {}
incbin_links = {}
incbin_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { incbin_includedirs }
	end,

	_add_defines = function()
		defines { incbin_defines }
	end,

	_add_libdirs = function()
		libdirs { incbin_libdirs }
	end,

	_add_external_links = function()
		links { incbin_links }
	end,

	_add_self_links = function()
		links { "incbin" }
	end,

	_create_projects = function()

project "incbin"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		incbin_includedirs,
	}

	defines {}

	files {
		path.join(incbin_script, "config", "**.h"),
		path.join(incbin_root, "**.h"),
		path.join(incbin_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
