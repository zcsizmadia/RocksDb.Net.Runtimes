# Third-party notices

This package redistributes compiled third-party libraries. It is not affiliated with, endorsed by, or sponsored by Meta Platforms, Inc., Google LLC, or any other project named here.

The MIT licence in [LICENSE](LICENSE) covers the build scripts and packaging in this repository. It does **not** cover the native libraries in the package, whose own terms are reproduced below and in the `licenses/` directory shipped alongside this file.

Every library listed here is built from unmodified upstream sources through [vcpkg](https://github.com/microsoft/vcpkg), as `rocksdb[snappy,zlib,lz4,zstd]`. No source changes are made.

## What the package contains

| Library | Licence | Full text |
| --- | --- | --- |
| RocksDB | Apache 2.0 or GPLv2, at your option | [`licenses/LICENSE.rocksdb-Apache-2.0.txt`](licenses/LICENSE.rocksdb-Apache-2.0.txt) |
| Snappy | BSD 3-Clause | [`licenses/LICENSE.snappy.txt`](licenses/LICENSE.snappy.txt) |
| zlib | zlib licence | [`licenses/LICENSE.zlib.txt`](licenses/LICENSE.zlib.txt) |
| LZ4 | BSD 2-Clause | [`licenses/LICENSE.lz4.txt`](licenses/LICENSE.lz4.txt) |
| Zstandard | BSD 3-Clause | [`licenses/LICENSE.zstd.txt`](licenses/LICENSE.zstd.txt) |

RocksDB is compiled with Snappy, zlib, LZ4 and Zstandard support, and the shared libraries for those compression codecs are shipped in the package next to RocksDB itself. That is why their notices appear here: the BSD licences require the copyright notice, conditions and disclaimer to be reproduced when the software is redistributed in binary form.

## RocksDB

Copyright (c) 2011-present, Facebook, Inc. All rights reserved.
Copyright (c) Meta Platforms, Inc. and affiliates.

- Project: <https://rocksdb.org/>
- Source: <https://github.com/facebook/rocksdb>

RocksDB is dual-licensed under the Apache License 2.0 (upstream `LICENSE.Apache`) and the GNU General Public License version 2 (upstream `COPYING`). A recipient may choose either. The Apache 2.0 text is included with this package; the GPLv2 alternative is available in [RocksDB's repository](https://github.com/facebook/rocksdb/blob/main/COPYING).

## Snappy

Copyright 2011, Google Inc. All rights reserved.

- Source: <https://github.com/google/snappy>

Licensed under the BSD 3-Clause licence. Full text in `licenses/LICENSE.snappy.txt`.

## zlib

Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler.

- Project: <https://zlib.net/>
- Source: <https://github.com/madler/zlib>

Licensed under the zlib licence. Full text in `licenses/LICENSE.zlib.txt`. The zlib licence does not require acknowledgement for binary redistribution; it is given here because it is deserved.

## LZ4

Copyright (c) 2011-2020, Yann Collet. All rights reserved.

- Source: <https://github.com/lz4/lz4>

The LZ4 library is licensed under the BSD 2-Clause licence. Full text in `licenses/LICENSE.lz4.txt`. Only the library ships here, not the LZ4 command-line programs, which upstream licenses under the GPLv2.

## Zstandard

Copyright (c) Meta Platforms, Inc. and affiliates. All rights reserved.

- Project: <https://facebook.github.io/zstd/>
- Source: <https://github.com/facebook/zstd>

Licensed under the BSD 3-Clause licence. Full text in `licenses/LICENSE.zstd.txt`. Zstandard is also offered upstream under the GPLv2; the BSD terms are taken here.

## Further dependencies

RocksDB builds on other open-source work, including LevelDB by Google, Inc. Those notices are carried in the RocksDB source tree.

Each library may also link against the platform C and C++ runtimes, which are covered by the terms of the operating system or toolchain that provides them and are not redistributed by this package.

## If licence obligations matter to you

This file is a summary written to satisfy the attribution these licences require. It is not legal advice, and it does not change your own obligations when you redistribute software that includes these libraries. Read the licence texts in `licenses/`, and the upstream projects' own licence files, rather than relying on this summary.
