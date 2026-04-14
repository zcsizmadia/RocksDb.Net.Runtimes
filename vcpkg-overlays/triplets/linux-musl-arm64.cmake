set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_FIXUP_ELF_RPATH ON)
set(VCPKG_BUILD_TYPE release)

# Tell the linker to set the RPATH to $ORIGIN
# $ORIGIN is a special variable that tells the loader to look in the same 
# directory as the library itself.
set(VCPKG_LINKER_FLAGS "-Wl,-rpath,'$ORIGIN'")

# Disable vcpkg's automatic RPATH "fixup" 
# vcpkg normally tries to clear RPATHs or point them to the vcpkg install tree.
# We want our $ORIGIN to stay exactly where it is for the NuGet package.
set(VCPKG_FIXUP_ELF_RPATH OFF)