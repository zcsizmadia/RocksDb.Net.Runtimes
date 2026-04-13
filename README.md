# RocksDb.Net.Runtimes

Native runtime assets for [RocksDb.Net](https://github.com/zcsizmadia/RocksDb.Net).

This package contains platform-specific native libraries required by RocksDB when used from .NET.

## Upstream and Attribution

The native `librocksdb` binaries in this package are based on the upstream RocksDB project maintained by Facebook and contributors:

- https://github.com/facebook/rocksdb

This package redistributes native RocksDB runtime binaries for use with the .NET package RocksDb.Net. All rights to RocksDB belong to its respective authors and maintainers. This package is an independent distribution focused on .NET runtime asset packaging.

## What This Package Is

`RocksDb.Net.Runtimes` is a runtime-asset NuGet package. It ships native binaries under `runtimes/<RID>/native` so the .NET runtime can load RocksDB on each supported operating system and architecture.

In most scenarios, you should install [RocksDb.Net](https://github.com/zcsizmadia/RocksDb.Net), which will reference this package for you.

## Supported Runtimes

- `win-x64`
- `win-arm64`
- `linux-x64`
- `linux-arm64`
- `osx-x64`
- `osx-arm64`

## Included Native Libraries

Depending on the target runtime, the package includes:

- RocksDB shared library (`librocksdb` / `rocksdb-shared.dll`)
- zlib (`zlib1.dll` / `libz`)
- snappy (`snappy.dll` / `libsnappy`)

## Installation

Install the main managed package (recommended):

```bash
dotnet add package RocksDb.Net
```

Install this package directly only if you need explicit control over native asset packaging:

```bash
dotnet add package RocksDb.Net.Runtimes
```

## Usage Notes

- Native assets are resolved by Runtime Identifier (RID).
- For self-contained publishing, set an appropriate RID (for example `win-x64`, `linux-x64`, or `osx-arm64`).
- If a native load error occurs, verify that your published output contains the matching `runtimes/<RID>/native` folder.

## Related Project

- RocksDb.Net: https://github.com/zcsizmadia/RocksDb.Net
- This repository: https://github.com/zcsizmadia/RocksDb.Net.Runtimes
- Facebook RocksDB: https://github.com/facebook/rocksdb

## License

MIT. See [LICENSE](LICENSE).
