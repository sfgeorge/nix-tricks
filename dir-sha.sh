#!/bin/sh

## Purpose
##   Calculate a hash for a directory's full contents.
##   Useful for quickly checking if remote copies of a directory are equal.
##
## Usage:  dir-sha.sh [path]
##
## Advanced Usage:  SHA=sha512sum TIME_OPTIONS=' ' dir-sha.sh [path]
##   SHA           By default we use the weak and INSECURE sha1sum hashing
##                 algorithm. This can be overridden by specifying a different
##                 hashing binary via the SHA environment variable.
##   TIME_OPTIONS  By default we ignore difference in the modification time of
##                 files.  Set this to ' ' (a space character) to consider 2
##                 files different if merely their modify times differ.


set -o errexit
set -o nounset
set -o pipefail


DIR="$1"
SHA=${SHA:-'sha1sum'}
TIME_OPTIONS=${TIME_OPTIONS:-'--mtime=0'}


tar -c --to-stdout $TIME_OPTIONS "$DIR" | $SHA
