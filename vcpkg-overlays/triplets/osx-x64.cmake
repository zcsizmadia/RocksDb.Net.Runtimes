set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Darwin)
set(VCPKG_OSX_ARCHITECTURES x86_64)
set(VCPKG_BUILD_TYPE release)

# 1. Provide extra header space for path changes (The "Header Pad")
#set(VCPKG_LINKER_FLAGS "-Wl,-headerpad_max_install_names")

# 2. Tell vcpkg NOT to move RPATHs around after the build
# This lets our custom RPATH stay put
#set(VCPKG_FIXUP_MACHO_RPATH OFF)

# 3. Force the internal ID and RPATH to use @rpath and @loader_path
#set(VCPKG_INSTALL_NAME_DIR "@rpath")
#set(VCPKG_LINKER_FLAGS "${VCPKG_LINKER_FLAGS} -Wl,-rpath,@loader_path/")

set(VCPKG_FIXUP_MACHO_RPATH ON)
