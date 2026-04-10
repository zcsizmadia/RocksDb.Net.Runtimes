#!/bin/bash

VERSION_ROCKSDB="$1"

# Extract expected version from csproj template to ensure it matches the tag version
VERSION_CSPROJ=$(awk 'match($0,/<Version>([^<]*)/,m) {print m[1]}' RocksDb.Net.Runtime.csproj.template)

# Check if VERSION_ROCKSDB is the same as VERSION_CSPROJ or VERSION_CSPROJ starts with VERSION_ROCKSDB and -
# if not, exit with error
if [[ "$VERSION_ROCKSDB" != "$VERSION_CSPROJ" && "$VERSION_CSPROJ" != "$VERSION_ROCKSDB-"* ]]; then
  echo "Version mismatch! Tag version ($VERSION_ROCKSDB) does not match csproj version ($VERSION_CSPROJ)."
  exit 1
fi
echo ok