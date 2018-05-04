#!/bin/sh

## Purpose
##   Calculate a hash for a directory's full contents.
##   Useful for quickly checking if remote copies of a directory are equal.
##
## Usage:  dir-sha.sh [path]
##
## Advanced Usage:  SHA=sha512sum dir-sha.sh [path]


set -o errexit
set -o nounset
set -o pipefail


DIR="$1"
# By default we use the weak and INSECURE sha1sum hashing algorithm.
# This can be overridden by specifying a different hashing binary via the SHA
# environment variable.
SHA=${SHA:-'sha1sum'}


tar -c --to-stdout "$DIR" | $SHA
