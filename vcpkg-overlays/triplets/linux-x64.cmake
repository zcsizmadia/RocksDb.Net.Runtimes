set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_FIXUP_ELF_RPATH ON)
set(VCPKG_BUILD_TYPE release)

# This replaces the need for patchelf
set(VCPKG_LINKER_FLAGS "-Wl,-rpath,'$ORIGIN' -Wl,-z,origin")

# Ensure vcpkg doesn't try to "fix" (remove) the RPATH we just set
set(VCPKG_FIXUP_ELF_RPATH OFF)