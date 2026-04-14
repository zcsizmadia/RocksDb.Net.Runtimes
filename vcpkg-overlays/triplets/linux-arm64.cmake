set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_FIXUP_ELF_RPATH ON)
set(VCPKG_BUILD_TYPE release)

# 1. Disable fixup first.
set(VCPKG_FIXUP_ELF_RPATH OFF)

# 2. Use double-backslash for the dollar sign. 
# Without the backslashes, CMake often treats $ORIGIN as an empty CMake variable.
set(VCPKG_LINKER_FLAGS "-Wl,-rpath,'\\\$ORIGIN' -Wl,--disable-new-dtags")