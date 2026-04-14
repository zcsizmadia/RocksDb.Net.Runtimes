using System.Reflection;
using System.Runtime.InteropServices;

namespace NupkgValidator;

/// <summary>
/// Provides the application entry point and manages initialization for RocksDB interop, including custom native library
/// resolution and database lifecycle management.
/// </summary>
/// <remarks>This class configures a custom DLL import resolver to enable cross-platform loading of the native
/// RocksDB library at runtime. It demonstrates basic usage of the RocksDB C API by creating database options, opening a
/// database, and ensuring proper resource cleanup. The class is intended for use as a self-contained application entry
/// point and is not designed for reuse as a library component.</remarks>

class Program
{
    static Program()
    {
        // Register the custom DLL resolver for the current assembly
        NativeLibrary.SetDllImportResolver(Assembly.GetExecutingAssembly(), ResolveRuntimeDll);
    }

    static int Main(string[] args)
    {
        // Database path can be specified as a command-line argument, defaulting to "rocksdb" if not provided
        string dbPath = args.Length > 0 ? args[0] : "rocksdb";

        try
        {
            // Create database options
            nint dbOptions = rocksdb_options_create();
            rocksdb_options_set_create_if_missing(dbOptions, 1);

            // Open the database
            nint err = default;
            nint db = rocksdb_open(dbOptions, dbPath, ref err);

            // Close database and destroy options
            rocksdb_close(db);
            rocksdb_options_destroy(dbOptions);

            Console.WriteLine("RocksDB database opened and closed successfully.");

            return 0; // Success
        }
        catch (Exception e)
        {
            Console.Error.WriteLine($"Error: {e.Message}");
            return 1; // Failure
        }
    }

    // Native methods and library loading logic

    const string LibName = "rocksdb";

    [DllImport(LibName, CallingConvention = CallingConvention.Cdecl)]
    internal static extern nint rocksdb_open(
        nint options,
        [MarshalAs(UnmanagedType.LPUTF8Str)] string name,
        ref nint errptr);

    [DllImport(LibName, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void rocksdb_close(nint db);

    [DllImport(LibName, CallingConvention = CallingConvention.Cdecl)]
    internal static extern nint rocksdb_options_create();

    [DllImport(LibName, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void rocksdb_options_destroy(nint opt);

    [DllImport(LibName, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void rocksdb_options_set_create_if_missing(nint opt, byte val);

    private static IntPtr ResolveRuntimeDll(string libraryName, Assembly assembly, DllImportSearchPath? searchPath)
    {
        // Only intercept the specific library
        if (libraryName != LibName)
        {
            return IntPtr.Zero; // Fallback to default loading logic
        }

        string rid = RuntimeInformation.RuntimeIdentifier;
        string libraryNameExt;

        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            libraryNameExt = $"{LibName}-shared.dll";
        }
        else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
        {
            libraryNameExt = $"lib{LibName}.11.dylib";
        }
        else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
        {
            libraryNameExt = $"lib{LibName}.so.11";
        }
        else
        {
            throw new PlatformNotSupportedException("Unsupported OS platform");
        }

        // Attempt to load the library from the assembly location directory
        string libPath = Path.Combine(Path.GetDirectoryName(assembly.Location) ?? AppContext.BaseDirectory, "runtimes", rid, "native", libraryNameExt);
        if (File.Exists(libPath))
        {
            return NativeLibrary.Load(libPath);
        }

        // Attempt to load the library from the application base directory
        libPath = Path.Combine(AppContext.BaseDirectory, "runtimes", rid, "native", libraryNameExt);
        if (File.Exists(libPath))
        {
            return NativeLibrary.Load(libPath);
        }

        // Attempt to load the library directly from the application base directory
        libPath = Path.Combine(AppContext.BaseDirectory, libraryNameExt);
        if (File.Exists(libPath))
        {
            return NativeLibrary.Load(libPath);
        }

        // Attempt using the default search path
        if (NativeLibrary.TryLoad(libraryNameExt, assembly, searchPath, out var handle))
        {
            return handle;
        }

        return IntPtr.Zero; // Let the system try its default search paths
    }
}
