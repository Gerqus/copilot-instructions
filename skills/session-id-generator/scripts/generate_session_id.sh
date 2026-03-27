#!/usr/bin/env bash
# Generate a short unique session ID by hashing random data.
# Output: 8-character lowercase hex string, no newline issues.
set -euo pipefail

hex=$(od -An -tx1 -N4 /dev/urandom | tr -d ' \n')
echo "$hex"
