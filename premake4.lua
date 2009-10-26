solution "http-fetch"

  targetdir "build"

  configurations { "Release", "Debug" }

  flags { "ExtraWarnings" }
  
  configuration "Release"
      flags { "Optimize" }
  configuration "Debug"
      flags { "Symbols" }
 
  configuration {}

  project "http-fetch"

    kind "SharedLib"
    language "C++"
    files { "src/*.cpp" }

    links { "flusspferd", "curl" }

    configuration { "not windows" }
      includedirs { 
        "/usr/local/include/boost-1_37",
        "/Users/ash/code/js/mozjs_debug/include"
      }

      libdirs {
        "/Users/ash/code/js/mozjs_debug/lib"
      }

    configuration { "windows" }
      --defines {"_WIN32_WINDOWS"}
      includedirs { 
        "C:/flusspferd/include",
        "C:/spidermonkey/include",
        "C:/libcurl-7.17.1/include"
      }

      libdirs {
        --"C:/flusspferd/lib",
        "C:/flusspferd/bin",
        "C:/libcurl-7.17.1/lib"
      }
      links {"ws2_32", "mswsock"}

