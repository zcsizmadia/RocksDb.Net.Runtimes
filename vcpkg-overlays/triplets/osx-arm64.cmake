set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Darwin)
set(VCPKG_OSX_ARCHITECTURES arm64)
set(VCPKG_BUILD_TYPE release)

# 1. Force libraries to identify themselves as @rpath/libname.dylib
set(VCPKG_MACHO_RPATH ON)

# 2. Tell the linker to use @loader_path for finding dependencies
set(VCPKG_LINKER_FLAGS "-Wl,-rpath,@loader_path")

# 3. Prevent vcpkg from "correcting" these to absolute paths post-build
set(VCPKG_FIXUP_MACHO_RPATH OFF)