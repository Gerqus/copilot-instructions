#!/usr/bin/env bash

set -u

script_dir="$(cd "$(dirname "$0")" && pwd)"
project_root="$(cd "$script_dir/../../../.." && pwd)"
runner="$project_root/tests/run_all.sh"

if [ ! -x "$runner" ]; then
    echo "Missing executable test runner: $runner"
    exit 2
fi

tmp_output="$(mktemp)"
trap 'rm -f "$tmp_output"' EXIT

set +e
bash "$runner" >"$tmp_output" 2>&1
runner_status=$?
set -e

awk '
function flush_block() {
    if (current_file != "" && failed_block != "") {
        print "FAILED_FILE: " current_file
        print failed_block
        print ""
        any_failed = 1
    }
}

BEGIN {
    current_file = ""
    failed_block = ""
    collecting_failed_lines = 0
    any_failed = 0
}

/^---- / {
    flush_block()
    current_file = substr($0, 6)
    failed_block = ""
    collecting_failed_lines = 0
    next
}

{
    if (current_file == "") {
        next
    }

    if ($0 ~ /^FAILED( \(syntax\))?: /) {
        collecting_failed_lines = 1
    }

    if (!collecting_failed_lines) {
        next
    }

    if ($0 ~ /^(Passed:|Failures:|Failed files:|DONE$)/) {
        next
    }

    if ($0 ~ /^ - .*\/tests\/.*\.php$/) {
        next
    }

    if (failed_block == "") {
        failed_block = $0
    } else {
        failed_block = failed_block ORS $0
    }
}

END {
    flush_block()
    if (!any_failed) {
        print "NO_FAILED_TEST_FILES"
    }
}
' "$tmp_output"

exit "$runner_status"
